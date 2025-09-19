# Improve code quality and structure in point.py

The `point.py` file contains basic Python functionality but lacks proper code organization, documentation, and best practices. This issue outlines improvements needed to make the code more maintainable, readable, and professional.

**Current Issues:**
- Missing docstrings for functions
- Inconsistent commenting style (using `#` instead of proper docstrings)
- No error handling for edge cases (empty lists)
- Functions are not following PEP 8 naming conventions completely
- No type hints for better code clarity
- Missing main guard (`if __name__ == "__main__":`)
- Code organization could be improved

**Tasks:**
- Add proper docstrings to all functions following PEP 257 conventions
- Add type hints for function parameters and return values
- Implement error handling for edge cases (e.g., empty name lists)
- Add input validation
- Organize code with proper main guard
- Add unit tests to validate functionality
- Consider renaming file to be more descriptive of its purpose
- Add logging instead of direct print statements for better debugging

**Acceptance Criteria:**
- All functions have proper docstrings
- Type hints are added for all function signatures
- Error handling covers edge cases
- Code follows PEP 8 style guidelines
- Unit tests cover main functionality
- Code is organized with proper main guard

This improvement will make the code more robust, maintainable, and suitable for a professional codebase.