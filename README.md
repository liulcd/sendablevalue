# sendablevalue


`SendableValue` provides type-erased, sendable value wrappers for Swift. It allows you to safely pass values of any type, including hashable types and closures, across concurrency domains.

## Features
- Type-erased value wrappers: `SendableValue`, `SendableAnyValue`, `SendableAnyHashableValue`, `SendableUpdatedHandlerValue`
- Safe for use with Swift concurrency
- Simple API for storing and retrieving values

## Usage

```swift
import SendableValue

// Store any value
let value = SendableValue(42)

// Store any value (non-optional)
let anyValue = SendableAnyValue("Hello")

// Store a hashable value
let hashableValue = SendableAnyHashableValue("Key")

// Store an update handler closure
let handler = SendableUpdatedHandlerValue { newValue, oldValue in
	print("Value updated from \(String(describing: oldValue)) to \(String(describing: newValue))")
}
```

## API Overview

- `SendableValue`: Type-erased, optionally hashable value. Provides access to the value and, if possible, as `AnyHashable` or update handler closure.
- `SendableAnyValue`: Type-erased value for any type.
- `SendableAnyHashableValue`: Type-erased value for any `AnyHashable`.
- `SendableUpdatedHandlerValue`: Stores a closure for value update handling.

## License
This project is licensed under the terms of the MIT license. See the [LICENSE](LICENSE) file for details.
