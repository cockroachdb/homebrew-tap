package main

import (
	"bytes"
	"crypto/sha256"
	"encoding/hex"
	"fmt"
	"io"
	"net/http"
	"os"
	"reflect"
	"strings"
	"text/template"
)

type templateArgs struct {
	Version           string
	DarwinAMD64URL    string
	DarwinARM64URL    string
	LinuxAMD64URL     string
	LinuxARM64URL     string
	DarwinAMD64SHA256 string
	DarwinARM64SHA256 string
	LinuxAMD64SHA256  string
	LinuxARM64SHA256  string
	// ClassSuffix is the suffix of the class name. It's used to identify the
	// product. For example, "cockroach@v25.1" becomes "CockroachAT251". Note
	// that we use the version, without the patch level.
	ClassSuffix string
}

type archive struct {
	// URL is the URL of the archive. It's a template that will be filled with
	// the version.
	URL string
	// placeholder is the name of the field in the templateArgs struct that will
	// be set to the URL.
	placeholder string
	// sha256Placeholder is the name of the field in the templateArgs struct that
	// will be set to the SHA256 checksum.
	sha256Placeholder string
}

type product struct {
	name string
	// version is the version of the product. Its value is set at runtime.
	version string
	// hasSHA256 is true if the product has a SHA256 file, which can be used to
	// determine the checksum without downloading the tarball. We assume that
	// the URL is equal to the tarball URL, but with the ".sha256sum" suffix.
	hasSHA256 bool
	archives  []archive
}

// products is a list of products that are supported by the formula.
// Even though we support Linux ARM64, homebrew doesn't.
// See https://github.com/Homebrew/brew/issues/19208
var products = []product{
	{
		name:      "cockroach",
		hasSHA256: true,
		archives: []archive{
			{
				URL:               "https://binaries.cockroachdb.com/cockroach-v%s.darwin-10.9-amd64.tgz",
				placeholder:       "DarwinAMD64URL",
				sha256Placeholder: "DarwinAMD64SHA256",
			},
			{
				URL:               "https://binaries.cockroachdb.com/cockroach-v%s.darwin-11.0-arm64.tgz",
				placeholder:       "DarwinARM64URL",
				sha256Placeholder: "DarwinARM64SHA256",
			},
			{
				URL:               "https://binaries.cockroachdb.com/cockroach-v%s.linux-amd64.tgz",
				placeholder:       "LinuxAMD64URL",
				sha256Placeholder: "LinuxAMD64SHA256",
			},
		},
	},
	{
		name:      "cockroach-sql",
		hasSHA256: true,
		archives: []archive{
			{
				URL:               "https://binaries.cockroachdb.com/cockroach-sql-v%s.darwin-10.9-amd64.tgz",
				placeholder:       "DarwinAMD64URL",
				sha256Placeholder: "DarwinAMD64SHA256",
			},
			{
				URL:               "https://binaries.cockroachdb.com/cockroach-sql-v%s.darwin-11.0-arm64.tgz",
				placeholder:       "DarwinARM64URL",
				sha256Placeholder: "DarwinARM64SHA256",
			},
			{
				URL:               "https://binaries.cockroachdb.com/cockroach-sql-v%s.linux-amd64.tgz",
				placeholder:       "LinuxAMD64URL",
				sha256Placeholder: "LinuxAMD64SHA256",
			},
		},
	},
	{
		name:      "ccloud",
		hasSHA256: false,
		archives: []archive{
			{
				URL:               "https://binaries.cockroachdb.com/ccloud/ccloud_darwin-amd64_%s.tar.gz",
				placeholder:       "DarwinAMD64URL",
				sha256Placeholder: "DarwinAMD64SHA256",
			},
			{
				URL:               "https://binaries.cockroachdb.com/ccloud/ccloud_darwin-arm64_%s.tar.gz",
				placeholder:       "DarwinARM64URL",
				sha256Placeholder: "DarwinARM64SHA256",
			},
			{
				URL:               "https://binaries.cockroachdb.com/ccloud/ccloud_linux-amd64_%s.tar.gz",
				placeholder:       "LinuxAMD64URL",
				sha256Placeholder: "LinuxAMD64SHA256",
			},
		},
	},
}

func main() {
	if len(os.Args) != 4 {
		fmt.Println("Usage: go run main.go <cockroach[@version]|cockroach-sql|ccloud> <version> <template file>")
		os.Exit(1)
	}
	productName := os.Args[1]
	version := strings.TrimPrefix(os.Args[2], "v")
	templateFile := os.Args[3]
	out, err := processTemplate(productName, version, templateFile)
	if err != nil {
		panic(err)
	}
	fmt.Print(out)
}

// getSHA256 calculates the SHA256 checksum of the file at the given URL.
// If hasSHA256 is true, it downloads the SHA256 file and returns the checksum.
// Otherwise, it calculates the checksum from the file content.
func getSHA256(url string, hasSHA256 bool) (string, error) {
	if hasSHA256 {
		url = url + ".sha256sum"
	}
	resp, err := http.DefaultClient.Get(url)
	if err != nil {
		return "", fmt.Errorf("cannot download: %w", err)
	}
	if resp.StatusCode >= 400 {
		return "", fmt.Errorf("unexpected status code %d for %s", resp.StatusCode, url)
	}
	defer resp.Body.Close()

	if hasSHA256 {
		// Download the SHA256 file and return the checksum.
		content, err := io.ReadAll(resp.Body)
		if err != nil {
			return "", fmt.Errorf("cannot read: %w", err)
		}
		fields := strings.Fields(strings.TrimSpace(string(content)))
		if len(fields) != 2 {
			return "", fmt.Errorf("unexpected number of fields in %s: %d", url, len(fields))
		}
		return fields[0], nil
	}
	// Download the file and calculate the SHA256 checksum.
	var buf bytes.Buffer
	if _, err := io.Copy(&buf, resp.Body); err != nil {
		return "", fmt.Errorf("cannot copy: %w", err)
	}
	hasher := sha256.New()
	hasher.Write(buf.Bytes())
	return hex.EncodeToString(hasher.Sum(nil)), nil
}

func processTemplate(productName, version string, templateFile string) (string, error) {
	t, err := template.ParseFiles(templateFile)
	if err != nil {
		return "", fmt.Errorf("failed to parse template: %w", err)
	}
	data := templateArgs{Version: version}
	dataRef := reflect.ValueOf(&data).Elem()
	// If the product contains "@", it's a versioned product. We need to
	// extract the product name and the version. We add the "AT" prefix to the
	// version, remove all dots and use the result as the class suffix in the
	// formula. For example, "cockroach@v25.1" becomes "CockroachAT251". Note
	// that we use the version, without the patch level.
	if strings.Contains(productName, "@") {
		split := strings.Split(productName, "@")
		if len(split) != 2 {
			return "", fmt.Errorf("found %d elements using @", len(split))
		}
		data.ClassSuffix = "AT" + strings.ReplaceAll(split[1], ".", "")
		productName = split[0]
	}

	for _, p := range products {
		if p.name != productName {
			continue
		}
		for _, archive := range p.archives {
			// To avoid using hardcoded data fields, we use reflection to set
			// the corresponding fields dynamically.
			// The formalas use explicit placeholder names due to the fact
			// that they have to be enclosed with `on_linux` or `on_macos`
			// directives.
			placeholder := archive.placeholder
			sha256Placeholder := archive.sha256Placeholder
			url := fmt.Sprintf(archive.URL, version)
			dataRef.FieldByName(placeholder).SetString(url)
			sha256, err := getSHA256(url, p.hasSHA256)
			if err != nil {
				return "", fmt.Errorf("failed to calculate SHA256: %w", err)
			}
			dataRef.FieldByName(sha256Placeholder).SetString(sha256)
		}
	}
	var buf bytes.Buffer
	err = t.Execute(&buf, data)
	if err != nil {
		return "", fmt.Errorf("cannot execute template: %w", err)
	}
	return buf.String(), nil
}
