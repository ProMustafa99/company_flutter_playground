# Flutter Training Project

A Flutter project with comprehensive linting rules and best practices.

## Getting Started

This project is a starting point for a Flutter application with strict linting rules to ensure code quality and consistency.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Linting Rules and Best Practices

This project uses comprehensive linting rules to maintain code quality. Below are all the rules organized by category with examples of wrong and correct code.

### 1. Error Prevention Rules

### 1.1 `avoid_print`
**Purpose**: Avoid using `print` statements in production code. Use proper logging instead.

**❌ Wrong:**
```dart
void someFunction() {
  print('Debug message');
  // ... rest of code
}
```

**✅ Correct:**
```dart
import 'dart:developer' as developer;

void someFunction() {
  developer.log('Debug message', name: 'MyApp');
  // ... rest of code
}
```

### 1.2 `avoid_unnecessary_containers`
**Purpose**: Avoid wrapping widgets in unnecessary Container widgets.

**❌ Wrong:**
```dart
Widget build(BuildContext context) {
  return Container(
    child: Text('Hello World'),
  );
}
```

**✅ Correct:**
```dart
Widget build(BuildContext context) {
  return Text('Hello World');
}
```

### 1.3 `avoid_web_libraries_in_flutter`
**Purpose**: Avoid importing web-only libraries in Flutter code.

**❌ Wrong:**
```dart
import 'dart:html'; // Web-only library
```

**✅ Correct:**
```dart
// Use Flutter-compatible alternatives
import 'package:http/http.dart' as http;
```

### 1.4 `prefer_const_constructors`
**Purpose**: Use const constructors when possible for better performance.

**❌ Wrong:**
```dart
Widget build(BuildContext context) {
  return Text('Hello World');
}
```

**✅ Correct:**
```dart
Widget build(BuildContext context) {
  return const Text('Hello World');
}
```

### 1.5 `prefer_const_literals_to_create_immutables`
**Purpose**: Use const for collections that won't be modified.

**❌ Wrong:**
```dart
Widget build(BuildContext context) {
  return Column(
    children: [
      Text('Item 1'),
      Text('Item 2'),
    ],
  );
}
```

**✅ Correct:**
```dart
Widget build(BuildContext context) {
  return Column(
    children: const [
      Text('Item 1'),
      Text('Item 2'),
    ],
  );
}
```

### 2. Performance Rules

### 2.1 `prefer_const_declarations`
**Purpose**: Prefer const declarations for variables that won't change.

**❌ Wrong:**
```dart
final String appName = 'MyApp';
final List<String> items = ['item1', 'item2'];
```

**✅ Correct:**
```dart
const String appName = 'MyApp';
const List<String> items = ['item1', 'item2'];
```

### 2.2 `unnecessary_const`
**Purpose**: Remove unnecessary const keywords.

**❌ Wrong:**
```dart
const String message = const String.fromCharCodes([72, 101, 108, 108, 111]);
```

**✅ Correct:**
```dart
const String message = String.fromCharCodes([72, 101, 108, 108, 111]);
```

### 2.3 `unnecessary_new`
**Purpose**: Remove unnecessary new keywords (deprecated in Dart 2).

**❌ Wrong:**
```dart
Widget build(BuildContext context) {
  return new Text('Hello World');
}
```

**✅ Correct:**
```dart
Widget build(BuildContext context) {
  return Text('Hello World');
}
```

### 3. Code Style Rules

### 3.1 `camel_case_types`
**Purpose**: Use camelCase for type names.

**❌ Wrong:**
```dart
class user_profile {
  // ...
}
```

**✅ Correct:**
```dart
class UserProfile {
  // ...
}
```

### 3.2 `camel_case_extensions`
**Purpose**: Use camelCase for extension names.

**❌ Wrong:**
```dart
extension string_extensions on String {
  // ...
}
```

**✅ Correct:**
```dart
extension StringExtensions on String {
  // ...
}
```

### 3.3 `file_names`
**Purpose**: Use snake_case for file names.

**❌ Wrong:**
```
UserProfile.dart
userProfile.dart
```

**✅ Correct:**
```
user_profile.dart
```

### 3.4 `library_names`
**Purpose**: Use snake_case for library names.

**❌ Wrong:**
```dart
library MyLibrary;
```

**✅ Correct:**
```dart
library my_library;
```

### 3.5 `non_constant_identifier_names`
**Purpose**: Use camelCase for non-constant identifiers.

**❌ Wrong:**
```dart
String user_name = 'John';
void get_user_data() {}
```

**✅ Correct:**
```dart
String userName = 'John';
void getUserData() {}
```

### 3.6 `prefer_single_quotes`
**Purpose**: Use single quotes for strings.

**❌ Wrong:**
```dart
String message = "Hello World";
```

**✅ Correct:**
```dart
String message = 'Hello World';
```

### 3.7 `slash_for_doc_comments`
**Purpose**: Use /// for documentation comments.

**❌ Wrong:**
```dart
/**
 * This is a documentation comment
 */
class MyClass {}
```

**✅ Correct:**
```dart
/// This is a documentation comment
class MyClass {}
```

### 4. Flutter-Specific Rules

### 4.1 `use_key_in_widget_constructors`
**Purpose**: Provide keys for widgets that may be moved around in the widget tree.

**❌ Wrong:**
```dart
Widget build(BuildContext context) {
  return ListView.builder(
    itemBuilder: (context, index) => ListTile(
      title: Text('Item $index'),
    ),
  );
}
```

**✅ Correct:**
```dart
Widget build(BuildContext context) {
  return ListView.builder(
    itemBuilder: (context, index) => ListTile(
      key: ValueKey(index),
      title: Text('Item $index'),
    ),
  );
}
```

### 4.2 `prefer_const_constructors_in_immutables`
**Purpose**: Use const constructors in immutable widgets.

**❌ Wrong:**
```dart
class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Hello'); // Not const
  }
}
```

**✅ Correct:**
```dart
class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('Hello'); // Const
  }
}
```

### 4.3 `always_use_package_imports`
**Purpose**: Use package imports instead of relative imports.

**❌ Wrong:**
```dart
import '../widgets/my_widget.dart';
import './utils/helper.dart';
```

**✅ Correct:**
```dart
import 'package:my_app/widgets/my_widget.dart';
import 'package:my_app/utils/helper.dart';
```

### 5. Best Practices

### 5.1 `avoid_empty_else`
**Purpose**: Avoid empty else clauses.

**❌ Wrong:**
```dart
if (condition) {
  doSomething();
} else {
  // Empty else
}
```

**✅ Correct:**
```dart
if (condition) {
  doSomething();
}
```

### 5.2 `avoid_relative_lib_imports`
**Purpose**: Avoid relative imports from lib directory.

**❌ Wrong:**
```dart
import '../lib/widgets/my_widget.dart';
```

**✅ Correct:**
```dart
import 'package:my_app/widgets/my_widget.dart';
```

### 5.3 `avoid_returning_null_for_future`
**Purpose**: Don't return null for Future types.

**❌ Wrong:**
```dart
Future<String?> getData() async {
  if (condition) {
    return 'data';
  }
  return null; // Don't return null for Future
}
```

**✅ Correct:**
```dart
Future<String> getData() async {
  if (condition) {
    return 'data';
  }
  throw Exception('No data available');
}
```

### 5.4 `avoid_returning_null_for_void`
**Purpose**: Don't return null for void functions.

**❌ Wrong:**
```dart
void doSomething() {
  if (condition) {
    return null; // Don't return null for void
  }
}
```

**✅ Correct:**
```dart
void doSomething() {
  if (condition) {
    return; // Just return, no value
  }
}
```

### 5.5 `avoid_slow_async_io`
**Purpose**: Avoid slow async I/O operations in compute-intensive functions.

**❌ Wrong:**
```dart
Future<void> computeIntensiveTask() async {
  // Heavy computation
  await File('large_file.txt').readAsString(); // Slow I/O in compute function
}
```

**✅ Correct:**
```dart
Future<void> computeIntensiveTask() async {
  // Heavy computation
  final result = await compute(readFile, 'large_file.txt');
}

static Future<String> readFile(String path) async {
  return await File(path).readAsString();
}
```

### 5.6 `avoid_type_to_string`
**Purpose**: Avoid using `.toString()` on types.

**❌ Wrong:**
```dart
String typeName = String.toString();
```

**✅ Correct:**
```dart
String typeName = 'String';
```

### 5.7 `cancel_subscriptions`
**Purpose**: Cancel Stream subscriptions to prevent memory leaks.

**❌ Wrong:**
```dart
class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = someStream.listen((data) {
      // Handle data
    });
  }
  // Missing dispose method
}
```

**✅ Correct:**
```dart
class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = someStream.listen((data) {
      // Handle data
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
```

### 5.8 `close_sinks`
**Purpose**: Close StreamSinks to prevent memory leaks.

**❌ Wrong:**
```dart
class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  StreamController<String>? _controller;

  @override
  void initState() {
    super.initState();
    _controller = StreamController<String>();
  }
  // Missing dispose method
}
```

**✅ Correct:**
```dart
class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  StreamController<String>? _controller;

  @override
  void initState() {
    super.initState();
    _controller = StreamController<String>();
  }

  @override
  void dispose() {
    _controller?.close();
    super.dispose();
  }
}
```

### 5.9 `comment_references`
**Purpose**: Ensure documentation comments reference valid elements.

**❌ Wrong:**
```dart
/// This method calls [nonExistentMethod] // Invalid reference
void myMethod() {}
```

**✅ Correct:**
```dart
/// This method calls [existingMethod] // Valid reference
void myMethod() {
  existingMethod();
}

void existingMethod() {}
```

### 5.10 `one_member_abstracts`
**Purpose**: Prefer concrete classes over abstract classes with single members.

**❌ Wrong:**
```dart
abstract class DataProvider {
  Future<String> getData();
}
```

**✅ Correct:**
```dart
class DataProvider {
  Future<String> getData() async {
    // Implementation
    return 'data';
  }
}
```

### 6. Null Safety Rules

### 6.1 `avoid_null_checks_in_equality_operators`
**Purpose**: Avoid null checks in equality operators.

**❌ Wrong:**
```dart
if (value == null) {
  // Handle null
}
```

**✅ Correct:**
```dart
if (value == null) {
  // Handle null
}
// Or use null-aware operators
final result = value ?? defaultValue;
```

### 6.2 `prefer_if_null_operators`
**Purpose**: Use `??` operator instead of if-null expressions.

**❌ Wrong:**
```dart
String getValue(String? value) {
  if (value == null) {
    return 'default';
  }
  return value;
}
```

**✅ Correct:**
```dart
String getValue(String? value) {
  return value ?? 'default';
}
```

### 6.3 `prefer_null_aware_operators`
**Purpose**: Use null-aware operators when possible.

**❌ Wrong:**
```dart
String? getValue() {
  if (someObject != null) {
    return someObject!.property;
  }
  return null;
}
```

**✅ Correct:**
```dart
String? getValue() {
  return someObject?.property;
}
```

### 7. Additional Useful Rules

### 7.1 `prefer_typing_uninitialized_variables`
**Purpose**: Provide explicit types for uninitialized variables.

**❌ Wrong:**
```dart
var name; // No type specified
```

**✅ Correct:**
```dart
String? name; // Explicit type
```

### 7.2 `sort_child_properties_last`
**Purpose**: Place child property last in widget constructors.

**❌ Wrong:**
```dart
Widget build(BuildContext context) {
  return Container(
    child: Text('Hello'),
    color: Colors.blue,
    padding: EdgeInsets.all(16),
  );
}
```

**✅ Correct:**
```dart
Widget build(BuildContext context) {
  return Container(
    color: Colors.blue,
    padding: EdgeInsets.all(16),
    child: Text('Hello'),
  );
}
```

### 7.3 `use_full_hex_values_for_flutter_colors`
**Purpose**: Use full 6-digit hex values for colors.

**❌ Wrong:**
```dart
Color color = Color(0xFF123); // 3-digit hex
```

**✅ Correct:**
```dart
Color color = Color(0xFF123456); // 6-digit hex
```

### 7.4 `use_rethrow_when_possible`
**Purpose**: Use rethrow instead of throw when re-throwing exceptions.

**❌ Wrong:**
```dart
try {
  // Some operation
} catch (e) {
  throw e; // Don't throw the same exception
}
```

**✅ Correct:**
```dart
try {
  // Some operation
} catch (e) {
  rethrow; // Use rethrow to preserve stack trace
}
```

### 7.5 `valid_regexps`
**Purpose**: Ensure regular expressions are valid.

**❌ Wrong:**
```dart
final regex = RegExp('['); // Invalid regex
```

**✅ Correct:**
```dart
final regex = RegExp(r'[a-z]'); // Valid regex
```

## Running the Linter

To check your code against these rules:

```bash
flutter analyze
```

To automatically fix some issues:

```bash
dart fix --apply
```

## Contributing

When contributing to this project, please ensure your code follows all the linting rules defined in `analysis_options.yaml`.
