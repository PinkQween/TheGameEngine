# TheGameEngine Makefile
# Alternative build system for environments without Swift Package Manager

SWIFT = swift
BUILD_DIR = .build
SOURCES_DIR = Sources
TESTS_DIR = Tests

# Build configurations
DEBUG_FLAGS = -g
RELEASE_FLAGS = -O

.PHONY: all build test clean debug release run-demo help

# Default target
all: build

# Build the framework
build:
	@echo "Building TheGameEngine..."
	$(SWIFT) build

# Build in debug mode
debug:
	@echo "Building TheGameEngine (Debug)..."
	$(SWIFT) build $(DEBUG_FLAGS)

# Build in release mode
release:
	@echo "Building TheGameEngine (Release)..."
	$(SWIFT) build -c release $(RELEASE_FLAGS)

# Run tests
test:
	@echo "Running tests..."
	$(SWIFT) test

# Run the demo application
run-demo: build
	@echo "Running GameEngineDemo..."
	$(SWIFT) run GameEngineDemo

# Clean build artifacts
clean:
	@echo "Cleaning build artifacts..."
	$(SWIFT) package clean
	rm -rf $(BUILD_DIR)

# Generate documentation
docs:
	@echo "Generating documentation..."
	$(SWIFT) package generate-documentation

# Install dependencies and resolve package
resolve:
	@echo "Resolving package dependencies..."
	$(SWIFT) package resolve

# Update dependencies
update:
	@echo "Updating package dependencies..."
	$(SWIFT) package update

# Show package info
info:
	@echo "Package information:"
	$(SWIFT) package describe

# Lint the code (requires SwiftLint)
lint:
	@if command -v swiftlint >/dev/null 2>&1; then \
		echo "Linting code..."; \
		swiftlint; \
	else \
		echo "SwiftLint not installed. Install with: brew install swiftlint"; \
	fi

# Format code (requires swift-format)
format:
	@if command -v swift-format >/dev/null 2>&1; then \
		echo "Formatting code..."; \
		find $(SOURCES_DIR) -name "*.swift" -exec swift-format -i {} \;; \
		find $(TESTS_DIR) -name "*.swift" -exec swift-format -i {} \;; \
	else \
		echo "swift-format not installed. Install with: brew install swift-format"; \
	fi

# Create a new release build and package it
package: release
	@echo "Creating release package..."
	mkdir -p dist
	$(SWIFT) build -c release
	cp -r $(BUILD_DIR)/release/* dist/
	@echo "Release package created in dist/"

# Help target
help:
	@echo "TheGameEngine Build System"
	@echo ""
	@echo "Available targets:"
	@echo "  build      - Build the framework (debug mode)"
	@echo "  debug      - Build in debug mode"
	@echo "  release    - Build in release mode"
	@echo "  test       - Run all tests"
	@echo "  run-demo   - Build and run the demo application"
	@echo "  clean      - Clean build artifacts"
	@echo "  docs       - Generate documentation"
	@echo "  resolve    - Resolve package dependencies"
	@echo "  update     - Update package dependencies"
	@echo "  info       - Show package information"
	@echo "  lint       - Lint code (requires SwiftLint)"
	@echo "  format     - Format code (requires swift-format)"
	@echo "  package    - Create release package"
	@echo "  help       - Show this help message"
	@echo ""
	@echo "Examples:"
	@echo "  make build"
	@echo "  make test"
	@echo "  make run-demo"
	@echo "  make release"
