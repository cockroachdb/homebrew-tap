# Usage example (crdb): make PRODUCT=cockroach VERSION=21.2.5
# Usage example (ccloud): make PRODUCT=ccloud VERSION=0.1.1

ifndef PRODUCT
$(error define PRODUCT)
endif

ifndef VERSION
$(error define VERSION)
endif

generate:
	bazel build //release && \
	  $$(bazel info bazel-bin)/release/release_/release \
	  $(PRODUCT) $(VERSION) release/$(PRODUCT)-tmpl.rb > Formula/$(PRODUCT).rb.tmp && \
	  mv Formula/$(PRODUCT).rb.tmp Formula/$(PRODUCT).rb
