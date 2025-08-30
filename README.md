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

### ✅ Step 4: Custom Delimiters - COMPLETED

**Requirements:**
- Support custom delimiter syntax: `"//[delimiter]\n[numbers...]"`
- Handle special regex characters in delimiters
- Maintain backward compatibility with default delimiters

**Examples:**
- Input: `"//;\n1;2"` → Output: `3`
- Input: `"//|\n1|2|3"` → Output: `6`
- Input: `"//#\n1#2#3#4"` → Output: `10`
- Input: `"//*\n5"` → Output: `5`
- Input: `"//.\n1.2.3"` → Output: `6` (handles regex special characters)

**Implementation:**
- Detects custom delimiter syntax with `startsWith('//')`
- Parses delimiter from `//[delimiter]\n` format
- Uses `RegExp.escape()` to handle special regex characters safely
- Falls back to default comma/newline delimiters when no custom delimiter specified
- Maintains full backward compatibility

### ✅ Step 5: Negative Number Validation - COMPLETED

**Requirements:**
- Throw exception for negative numbers with message: `"negative numbers not allowed <negative_number>"`
- Include all negative numbers in error message, separated by commas
- Handle negative numbers with all delimiter types

**Examples:**
- Input: `"-1"` → Throws: `"negative numbers not allowed -1"`
- Input: `"1,-2,3,-4"` → Throws: `"negative numbers not allowed -2,-4"`
- Input: `"-1,-2,-3"` → Throws: `"negative numbers not allowed -1,-2,-3"`
- Input: `"//;\n1;-2;3"` → Throws: `"negative numbers not allowed -2"`
- Input: `"1\n-2,3"` → Throws: `"negative numbers not allowed -2"`

**Implementation:**
- Collects all negative numbers using `where((num) => num < 0)`
- Formats error message with all negative numbers joined by commas
- Throws `FormatException` with the required message format
- Works with all delimiter types (comma, newline, custom)
- Maintains performance by checking negatives before summing

### 🎁 Bonus Feature: Ignore Numbers Bigger Than 1000 - COMPLETED

**Requirements:**
- Numbers bigger than 1000 should be ignored
- Numbers exactly equal to 1000 should be included
- Works with all delimiter types

**Examples:**
- Input: `"2,1001"` → Output: `2` (1001 is ignored)
- Input: `"1,1001,2,2000,3"` → Output: `6` (1001 and 2000 are ignored)
- Input: `"1001,2000,3000"` → Output: `0` (all numbers ignored)
- Input: `"1,1000,2"` → Output: `1003` (1000 is included)
- Input: `"//;\n1;1001;2"` → Output: `3` (works with custom delimiters)
- Input: `"1\n1001,2"` → Output: `3` (works with newlines)

**Implementation:**
- Filters out numbers greater than 1000 using `where((num) => num <= 1000)`
- Maintains all existing functionality (delimiters, negative validation)
- Efficient filtering before summing operation
- Comprehensive test coverage for edge cases


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
│   └── string_calculator_test.dart     # Test cases (33 tests)
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
- [Dart Testing Documentation](https://dart.dev/guides/testing)
- [TDD Best Practices](https://blog.cleancoder.com/uncle-bob/2014/05/14/TheLittleMocker.html)

## 🎯 Assessment Goals

- ✅ Demonstrate strong TDD practices
- ✅ Show clean, readable, and testable code
- ✅ Follow software craftsmanship principles
- ✅ Commit frequently to show code evolution
- ✅ Complete all steps for extra points
- 🎁 **Bonus**: Implement additional features for extra points

---

**Note**: This TDD assessment has been completed successfully with all required steps implemented, thoroughly tested, and includes bonus features for extra points.

