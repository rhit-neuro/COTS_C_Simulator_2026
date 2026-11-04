# ================================================================================
# Rose-Hulman Institute of Technology
# Commerical-off-the-Shelf (COTS) HNCell Model Simulator
# ================================================================================

# Compiler Settings
CC = gcc-16
CFLAGS = -Wall -fopenmp -march=native
LDFLAGS = -fopenmp

# Directories
SRC_DIR = src
OBJ_DIR = obj
BIN_DIR = bin

# Create Directories
$(OBJ_DIR):
	mkdir -p $@

$(BIN_DIR):
	mkdir -p $@

# Source Files
SRCS = $(SRC_DIR)/RHIT_Simulator.c

# Object Files
OBJS = $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRCS))

# Compile Files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Displays all available commands.
help:
	@echo ""
	@echo "================================================================================"
	@echo "HNCell Model Simulator - Available 'make' commands"
	@echo "================================================================================"
	@echo ""
	@echo " make help          - Displays all available commands."
	@echo " make clean         - Remove all generated files."
	@echo " make run           - Run the HNCell Model Simulator."
	@echo ""
	@echo "================================================================================"
	@echo ""

# Remove all generated files.
clean:
	@echo "Removing generated files."
	rm -rf $(OBJ_DIR) $(BIN_DIR)
	@echo "Clean completed."

# Build Executable
TARGET = $(BIN_DIR)/RHIT_Simulator

$(TARGET): $(OBJS) | $(BIN_DIR)
	$(CC) $(CFLAGS) -o $@ $(OBJS) $(LDFLAGS)

# Run the HNCell Model Simulator
all: $(TARGET)

run: $(TARGET)
	./$(TARGET)

.PHONY: help clean run