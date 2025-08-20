# Dart vs TypeScript: Key Differences

## 1. **Null Safety**
- **Dart**: Has built-in null safety with `?` and `!` operators. Variables are non-nullable by default.
- **TypeScript**: Uses optional types with `?` but doesn't enforce null safety at runtime.

```dart
// Dart
String name = "John"; // Non-nullable
String? nullableName; // Nullable
```

```typescript
// TypeScript
let name: string = "John";
let nullableName?: string;
```

## 2. **Function Syntax**
- **Dart**: Uses `void` for functions that don't return values, arrow syntax with `=>`
- **TypeScript**: Uses `void` or omits return type, arrow functions with `=>`

```dart
// Dart
void greet(String name) => print("Hello $name");
int add(int a, int b) => a + b;
```

```typescript
// TypeScript
const greet = (name: string): void => console.log(`Hello ${name}`);
const add = (a: number, b: number): number => a + b;
```

## 3. **Class Constructors**
- **Dart**: Uses `const` constructors, named parameters with `{}`, required parameters with `required`
- **TypeScript**: Uses regular constructors, optional parameters with `?`

```dart
// Dart
class Person {
  final String name;
  final int age;
  
  const Person({required this.name, required this.age});
}
```

```typescript
// TypeScript
class Person {
  constructor(
    public name: string,
    public age: number
  ) {}
}
```

## 4. **Collections**
- **Dart**: Uses `List<T>`, `Map<K,V>`, `Set<T>` with specific syntax
- **TypeScript**: Uses `Array<T>`, `Record<K,V>`, `Set<T>` with different syntax

```dart
// Dart
List<String> names = ['Alice', 'Bob'];
Map<String, int> ages = {'Alice': 25, 'Bob': 30};
Set<String> uniqueNames = {'Alice', 'Bob'};
```

```typescript
// TypeScript
const names: string[] = ['Alice', 'Bob'];
const ages: Record<string, number> = {'Alice': 25, 'Bob': 30};
const uniqueNames: Set<string> = new Set(['Alice', 'Bob']);
```

## 5. **Async/Await**
- **Dart**: Uses `Future<T>` type, `async`/`await` keywords
- **TypeScript**: Uses `Promise<T>` type, `async`/`await` keywords

```dart
// Dart
Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 1));
  return "Data loaded";
}
```

```typescript
// TypeScript
async function fetchData(): Promise<string> {
  await new Promise(resolve => setTimeout(resolve, 1000));
  return "Data loaded";
}
```

---

**Note**: These differences are fundamental to understanding how to transition between the two languages, especially when working with Flutter (Dart) and web development (TypeScript).
