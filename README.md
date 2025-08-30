# Incubyte TDD Assessment - String Calculator Kata

This project implements the **String Calculator Kata** using **Test-Driven Development (TDD)** in Dart, as part of the [Incubyte TDD Assessment](https://blog.incubyte.co/blog/tdd-assessment/).

## 🎯 Assessment Overview

The String Calculator Kata is a TDD exercise that involves building a calculator that can add numbers from a string input. This assessment evaluates:

- TDD implementation following Red → Green → Refactor cycle
- Code readability and testability
- Software craftsmanship practices
- Incremental development with frequent commits

## 🚀 Current Implementation Status

### ✅ Step 1: Basic String Calculator - COMPLETED

**Requirements:**
- Create a simple String calculator with method signature: `int add(String numbers)`
- Handle empty strings → return 0
- Handle single numbers → return the number
- Handle comma-separated numbers → return their sum

**Examples:**
- Input: `""` → Output: `0`
- Input: `"1"` → Output: `1`
- Input: `"1,5"` → Output: `6`

**Implementation:**
- Test cases written in `/test/string_calculator_test.dart`
- Implementation completed in `/lib/string_calculator.dart`
- Uses comma splitting and integer parsing with proper error handling

### ✅ Step 2: Handle Any Amount of Numbers - COMPLETED

**Requirements:**
- Extend the calculator to handle multiple comma-separated numbers
- Support any number of comma-separated values

**Examples:**
- Input: `"1,2,3"` → Output: `6`
- Input: `"1,2,3,4,5"` → Output: `15`

**Implementation:**
- Current implementation already handles this requirement perfectly
- Uses `split(',')` and `fold()` to process any number of comma-separated values
- Robust handling of edge cases including zero values

### ✅ Step 3: Support New Lines Between Numbers - COMPLETED

**Requirements:**
- Handle newline characters as delimiters
- Support mixed delimiters (commas and newlines)
- Handle consecutive delimiters gracefully

**Examples:**
- Input: `"1\n2,3"` → Output: `6`
- Input: `"1\n2\n3"` → Output: `6`
- Input: `"1\n2,3\n4"` → Output: `10`
- Input: `"1,\n2"` → Output: `3` (handles consecutive delimiters)

**Implementation:**
- Uses regex `RegExp(r'[,|\n]')` to split by both commas and newlines
- Filters out empty strings to handle consecutive delimiters
- Maintains backward compatibility with comma-only inputs
- Robust whitespace handling with `trim()`

## 🛠️ Getting Started

### Prerequisites
- [Dart SDK](https://dart.dev/get-dart) (version ^3.7.0 or higher)

### Installation & Testing
```bash
# Navigate to the string_calculator directory
cd string_calculator

# Install dependencies
dart pub get

# Run tests
dart test

# Run tests with coverage
dart test --coverage=coverage
```

## 📁 Project Structure

```
string_calculator/
├── lib/
│   └── string_calculator.dart          # Main implementation
├── test/
│   └── string_calculator_test.dart     # Test cases
├── pubspec.yaml                        # Dependencies
└── README.md
```

## 🧪 Test-Driven Development Approach

This project follows the TDD methodology:

1. **Red**: Write a failing test
2. **Green**: Write minimal code to make the test pass
3. **Refactor**: Clean up the code while keeping tests green

Each step is committed separately to demonstrate the incremental development process.

## 📚 Resources

- [Incubyte TDD Assessment Blog](https://blog.incubyte.co/blog/tdd-assessment/)

## 🎯 Assessment Goals

- Demonstrate strong TDD practices
- Show clean, readable, and testable code
- Follow software craftsmanship principles
- Commit frequently to show code evolution
- Complete all steps for extra points

---

**Note**: This is an active TDD assessment. The implementation will evolve step by step as new requirements are added and tests are written.

