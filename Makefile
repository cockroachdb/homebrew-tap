# Usage example (crdb): make PRODUCT=cockroach VERSION=21.2.5
# Usage example (ccloud): make PRODUCT=ccloud VERSION=0.1.1

ifndef PRODUCT
$(error define PRODUCT)
endif

ifndef VERSION
$(error define VERSION)
endif

generate:
	@cd release && \
		go run main.go $(PRODUCT) $(VERSION) > ../Formula/$(PRODUCT).rb
