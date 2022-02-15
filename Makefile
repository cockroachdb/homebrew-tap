# Usage example: make VERSION=21.2.5

ifndef VERSION
$(error define VERSION)
endif

generate:
	@cd release && \
		go run main.go $(VERSION) > ../Formula/cockroach.rb
