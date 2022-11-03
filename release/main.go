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
	cockroach         = "cockroach"
	cockroachSQL      = "cockroach-sql"
	ccloud            = "ccloud"
	cockroachURLIntel = "https://binaries.cockroachdb.com/%s-v%s.darwin-10.9-amd64.tgz"
	cockroachURLARM   = "https://binaries.cockroachdb.com/%s-v%s.darwin-11.0-aarch64.tgz"
	ccloudURL         = "https://binaries.cockroachdb.com/ccloud/ccloud_darwin-amd64_%s.tar.gz"
)

type templateArgs struct {
	Version     string
	IntelURL    string
	ARMURL      string
	IntelSHA256 string
	ARMSHA256   string
}

func main() {
	if len(os.Args) != 4 {
		fmt.Println("Usage: go run main.go <cockroach|cockroach-sql|ccloud> <version> <template file>")
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

	if product == cockroach || product == cockroachSQL {
		url := fmt.Sprintf(cockroachURLIntel, product, version)
		sha256, err := sha256FromURL(url)
		if err != nil {
			return "", fmt.Errorf("failed to calculate SHA256: %w", err)
		}
		data.IntelURL = url
		data.IntelSHA256 = sha256
		urlARM := fmt.Sprintf(cockroachURLARM, product, version)
		sha256ARM, err := sha256FromURL(urlARM)
		if err != nil {
			return "", fmt.Errorf("failed to calculate SHA256: %w", err)
		}
		data.ARMURL = urlARM
		data.ARMSHA256 = sha256ARM
	} else if product == ccloud {
		url := fmt.Sprintf(ccloudURL, version)
		sha256, err := sha256FromURL(url)
		if err != nil {
			return "", fmt.Errorf("failed to calculate SHA256: %w", err)
		}
		data.IntelURL = url
		data.IntelSHA256 = sha256
	}
	var buf bytes.Buffer
	err = t.Execute(&buf, data)
	if err != nil {
		return "", fmt.Errorf("cannot execute template: %w", err)
	}
	return buf.String(), nil
}
