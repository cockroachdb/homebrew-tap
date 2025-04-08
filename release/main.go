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
	cockroach              = "cockroach"
	cockroachSQL           = "cockroach-sql"
	ccloud                 = "ccloud"
	cockroachURLMacIntel   = "https://binaries.cockroachdb.com/%s-v%s.darwin-10.9-amd64.tgz"
	cockroachURLMacARM     = "https://binaries.cockroachdb.com/%s-v%s.darwin-11.0-arm64.tgz"
	cockroachURLLinuxIntel = "https://binaries.cockroachdb.com/%s-v%s.linux-amd64.tgz"
	cockroachURLLinuxARM   = "https://binaries.cockroachdb.com/%s-v%s.linux-arm64.tgz"
	// NB:
	// - The ccloud URL is not versioned, so we use the latest version.
	// - Skipping support for Linux ccloud for now, as we currently support Linux Intel, but not Linux ARM.
	//   https://www.cockroachlabs.com/docs/cockroachcloud/ccloud-get-started.html?filters=linux
	ccloudURLMacIntel = "https://binaries.cockroachdb.com/ccloud/ccloud_darwin-amd64_%s.tar.gz"
	ccloudURLMacARM   = "https://binaries.cockroachdb.com/ccloud/ccloud_darwin-arm64_%s.tar.gz"
)

type templateArgs struct {
	Version          string
	MacIntelURL      string
	MacARMURL        string
	MacIntelSHA256   string
	MacARMSHA256     string
	LinuxIntelURL    string
	LinuxARMURL      string
	LinuxIntelSHA256 string
	LinuxARMSHA256   string
	ClassSuffix      string
}

func main() {
	if len(os.Args) != 4 {
		fmt.Println("Usage: go run main.go <cockroach[@version]|cockroach-sql|ccloud> <version> <template file>")
		os.Exit(1)
	}
	product := os.Args[1]
	version := strings.TrimPrefix(os.Args[2], "v")
	templateFile := os.Args[3]
	out, err := processTemplate(product, version, templateFile)
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
	if resp.StatusCode >= 400 {
		return "", fmt.Errorf("unexpected status code %d for %s", resp.StatusCode, url)
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

func processTemplate(product, version string, templateFile string) (string, error) {
	t, err := template.ParseFiles(templateFile)
	if err != nil {
		return "", fmt.Errorf("failed to parse template: %w", err)
	}
	data := templateArgs{Version: version}

	if product == cockroach || product == cockroachSQL || strings.HasPrefix(product, cockroach+"@") {
		productBase := product
		if strings.HasPrefix(product, cockroach+"@") {
			split := strings.Split(product, "@")
			if len(split) != 2 {
				return "", fmt.Errorf("found %d elements using cockroach@", len(split))
			}
			productBase = split[0]
			data.ClassSuffix = "AT" + strings.ReplaceAll(split[1], ".", "")
		}
		// MacIntel
		url := fmt.Sprintf(cockroachURLMacIntel, productBase, version)
		sha256, err := sha256FromURL(url)
		if err != nil {
			return "", fmt.Errorf("failed to calculate SHA256: %w", err)
		}
		data.MacIntelURL = url
		data.MacIntelSHA256 = sha256
		// MacARM
		urlARM := fmt.Sprintf(cockroachURLMacARM, productBase, version)
		sha256ARM, err := sha256FromURL(urlARM)
		if err != nil {
			return "", fmt.Errorf("failed to calculate SHA256: %w", err)
		}
		data.MacARMURL = urlARM
		data.MacARMSHA256 = sha256ARM
		// LinuxIntel
		urlLinuxIntel := fmt.Sprintf(cockroachURLLinuxIntel, productBase, version)
		sha256LinuxIntel, err := sha256FromURL(urlLinuxIntel)
		if err != nil {
			return "", fmt.Errorf("failed to calculate SHA256: %w", err)
		}
		data.LinuxIntelURL = urlLinuxIntel
		data.LinuxIntelSHA256 = sha256LinuxIntel
		// LinuxARM
		urlLinuxARM := fmt.Sprintf(cockroachURLLinuxARM, productBase, version)
		sha256LinuxARM, err := sha256FromURL(urlLinuxARM)
		if err != nil {
			return "", fmt.Errorf("failed to calculate SHA256: %w", err)
		}
		data.LinuxARMURL = urlLinuxARM
		data.LinuxARMSHA256 = sha256LinuxARM

	} else if product == ccloud {
		url := fmt.Sprintf(ccloudURLMacIntel, version)
		sha256, err := sha256FromURL(url)
		if err != nil {
			return "", fmt.Errorf("failed to calculate SHA256: %w", err)
		}
		data.MacIntelURL = url
		data.MacIntelSHA256 = sha256

		urlARM := fmt.Sprintf(ccloudURLMacARM, version)
		sha256ARM, err := sha256FromURL(urlARM)
		if err != nil {
			return "", fmt.Errorf("failed to calculate SHA256: %w", err)
		}
		data.MacARMURL = urlARM
		data.MacARMSHA256 = sha256ARM
	}
	var buf bytes.Buffer
	err = t.Execute(&buf, data)
	if err != nil {
		return "", fmt.Errorf("cannot execute template: %w", err)
	}
	return buf.String(), nil
}
