# Flutter Lints - Recommended Rules

## Overview
`flutter_lints` provides a comprehensive set of linting rules specifically designed for Flutter applications. These rules help maintain code quality, consistency, and follow Flutter best practices.

## Key Rule Categories

### 1. **Error Prevention Rules**
- `avoid_print` - Warns against using `print()` statements (use proper logging instead)
- `avoid_unnecessary_containers` - Suggests using more efficient widgets
- `avoid_web_libraries_in_flutter` - Prevents using web-only libraries in Flutter
- `prefer_const_constructors` - Encourages using `const` constructors for better performance
- `prefer_const_literals_to_create_immutables` - Suggests const for immutable collections

### 2. **Performance Rules**
- `prefer_const_constructors` - Use const constructors when possible
- `prefer_const_literals_to_create_immutables` - Use const for immutable collections
- `prefer_const_declarations` - Use const for variables that don't change
- `unnecessary_const` - Remove unnecessary const keywords
- `unnecessary_new` - Remove unnecessary new keywords

### 3. **Code Style Rules**
- `camel_case_types` - Class names should be in camelCase
- `camel_case_extensions` - Extension names should be in camelCase
- `camel_case_library_names` - Library names should be in camelCase
- `file_names` - File names should be in snake_case
- `library_names` - Library names should be in snake_case
- `non_constant_identifier_names` - Variable names should be in camelCase
- `prefer_single_quotes` - Use single quotes for strings
- `slash_for_doc_comments` - Use /// for documentation comments

### 4. **Flutter-Specific Rules**
- `avoid_unnecessary_containers` - Don't use Container when not needed
- `prefer_sized_box_for_shrink` - Use SizedBox instead of Container for sizing
- `use_key_in_widget_constructors` - Use keys in widget constructors when needed
- `prefer_const_constructors_in_immutables` - Use const constructors in immutable widgets
- `always_use_package_imports` - Use package imports instead of relative imports

### 5. **Best Practices**
- `avoid_empty_else` - Don't have empty else blocks
- `avoid_relative_lib_imports` - Use absolute imports instead of relative
- `avoid_returning_null_for_future` - Don't return null for Future types
- `avoid_returning_null_for_void` - Don't return null for void functions
- `avoid_slow_async_io` - Avoid slow async I/O operations
- `avoid_type_to_string` - Don't use .toString() on types
- `cancel_subscriptions` - Cancel Stream subscriptions
- `close_sinks` - Close StreamSinks
- `comment_references` - Document all public APIs
- `one_member_abstracts` - Don't use abstract classes with only one member

### 6. **Null Safety Rules**
- `avoid_null_checks_in_equality_operators` - Don't check for null in equality operators
- `prefer_conditional_expressions` - Use conditional expressions instead of if-else
- `prefer_if_null_operators` - Use ?? operator instead of if-null checks
- `prefer_null_aware_operators` - Use null-aware operators when possible

## How to Customize Rules

You can customize these rules in your `analysis_options.yaml`:

```yaml
linter:
  rules:
    # Disable a rule
    avoid_print: false
    
    # Enable additional rules
    prefer_single_quotes: true
    always_use_package_imports: true
```

## Running the Analyzer

To see which rules are being violated in your code:

```bash
flutter analyze
```

## Benefits of Using flutter_lints

1. **Consistency** - Ensures all team members follow the same coding standards
2. **Performance** - Identifies potential performance issues
3. **Maintainability** - Encourages writing cleaner, more maintainable code
4. **Best Practices** - Enforces Flutter-specific best practices
5. **Error Prevention** - Catches common mistakes before they become bugs

## Version Information
Current version: flutter_lints 5.0.0

This version includes the latest recommended rules for Flutter development and is regularly updated with new rules and improvements.
