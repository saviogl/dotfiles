.PHONY: install clean

# Detect OS
OS := $(shell uname -s)
PACKAGES := base

# Add OS-specific packages
ifeq ($(OS),Darwin)
	PACKAGES += macos
else ifeq ($(OS),Linux)
	PACKAGES += linux
endif

# Define stow command and flags
STOW := stow -t $(HOME) -v --no-folding

# Check if adopt flag is set
ADOPT ?= false
ifeq ($(ADOPT),true)
	STOW_FLAGS := --adopt
else
	STOW_FLAGS :=
endif

# Check if simulate flag is set
SIMULATE ?= false
ifeq ($(SIMULATE),true)
	STOW_FLAGS := $(STOW_FLAGS) --simulate
	ACTION_TEXT := Would install
	COMPLETION_TEXT := Simulation complete. No changes were made.
else
	ACTION_TEXT := Installing
	COMPLETION_TEXT := Dotfiles installation complete!
endif

# Define directories that should exist before stowing
ENSURE_DIRS := $(HOME)/.config/zsh/conf.d

install: ensure-dirs
	@echo "$(ACTION_TEXT) dotfiles for $(OS)..."
	@echo "Packages to process: $(PACKAGES)"
	@if [ "$(ADOPT)" = "true" ]; then \
		echo "Adopt mode enabled: existing files will be moved to the repository"; \
	fi
	@if [ "$(SIMULATE)" = "true" ]; then \
		echo "Simulate mode enabled: no changes will be made"; \
	fi
	@for pkg in $(PACKAGES); do \
		if [ -d "$$pkg" ]; then \
			echo "$(ACTION_TEXT) $$pkg..."; \
			$(STOW) $(STOW_FLAGS) $$pkg; \
		else \
			echo "Warning: $$pkg directory not found, skipping"; \
		fi \
	done
	@echo "$(COMPLETION_TEXT)"

# Create necessary directories before stowing
ensure-dirs:
	@if [ "$(SIMULATE)" != "true" ]; then \
		for dir in $(ENSURE_DIRS); do \
			if [ ! -d "$$dir" ]; then \
				echo "Creating directory: $$dir"; \
				mkdir -p "$$dir"; \
			fi \
		done; \
	else \
		for dir in $(ENSURE_DIRS); do \
			if [ ! -d "$$dir" ]; then \
				echo "Would create directory: $$dir"; \
			fi \
		done; \
	fi

clean:
	@echo "Removing dotfiles..."
	@for pkg in $(PACKAGES); do \
		if [ -d "$$pkg" ]; then \
			echo "Removing $$pkg..."; \
			$(STOW) -D $$pkg; \
		fi \
	done
	@echo "Dotfiles removal complete!" 