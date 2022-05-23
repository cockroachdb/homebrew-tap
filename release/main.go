package main

import (
	"bytes"
	"crypto/sha256"
	"encoding/hex"
	"fmt"
	"io"
	"net/http"
	"os"
	"strings"
	"text/template"
)

const (
	cockroach    = "cockroach"
	ccloud       = "ccloud"
	cockroachURL = "https://binaries.cockroachdb.com/cockroach-v%s.darwin-10.9-amd64.tgz"
	ccloudURL    = "https://binaries.cockroachdb.com/ccloud/ccloud_darwin-amd64_%s.tar.gz"
)

type templateArgs struct {
	Version string
	URL     string
	SHA256  string
}

func main() {
	if len(os.Args) != 3 {
		fmt.Println("Usage: go run main.go <cockroach|ccloud> <version>")
		os.Exit(1)
	}
	product := os.Args[1]
	version := strings.TrimPrefix(os.Args[2], "v")
	out, err := processTemplate(product, version)
	if err != nil {
		panic(err)
	}
	fmt.Println(out)
}

func sha256FromURL(url string) (string, error) {
	resp, err := http.DefaultClient.Get(url)
	if err != nil {
		return "", fmt.Errorf("cannot download: %w", err)
	}
	defer resp.Body.Close()

	var buf bytes.Buffer
	if _, err := io.Copy(&buf, resp.Body); err != nil {
		return "", fmt.Errorf("cannot copy: %w", err)
	}
	hasher := sha256.New()
	hasher.Write(buf.Bytes())
	return hex.EncodeToString(hasher.Sum(nil)), nil
}

func processTemplate(product, version string) (string, error) {
	t, err := template.ParseFiles(fmt.Sprintf("%s-tmpl.rb", product))
	if err != nil {
		return "", fmt.Errorf("failed to parse template: %w", err)
	}
	var urlFmt string
	if product == cockroach {
		urlFmt = cockroachURL
	} else if product == ccloud {
		urlFmt = ccloudURL
	}
	url := fmt.Sprintf(urlFmt, version)
	sha256, err := sha256FromURL(url)
	if err != nil {
		return "", fmt.Errorf("failed to calculate SHA256: %w", err)
	}
	data := templateArgs{
		Version: version,
		URL:     url,
		SHA256:  sha256,
	}
	var buf bytes.Buffer
	err = t.Execute(&buf, data)
	if err != nil {
		return "", fmt.Errorf("cannot execute template: %w", err)
	}
	return buf.String(), nil
}
