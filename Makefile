BUILD_TARGET=./

.PHONY: build
build:
	go build ./pkg/common

.PHONY: code/fix
code/fix:
	@gofmt -w `find . -type f -name '*.go' -not -path "./vendor/*"`

.PHONY: code/check
code/check:
	go vet ./...

.PHONY: code/gen
code/gen:
	go generate ./...

.PHONY: test/unit
test/unit:
	go test -v ./...

.PHONY: vendor/check
vendor/check: vendor/fix
	git diff --exit-code vendor/

.PHONY: vendor/fix
vendor/fix:
	go mod tidy
	go mod vendor
