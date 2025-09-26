# sendablevalue

`SendableValue` provides type-erased, sendable value wrappers for Swift. It allows you to safely pass values of any type, including hashable types, across concurrency domains.

## Features
- Type-erased value wrappers: `SendableValue`, `SendableAnyValue`, `SendableAnyHashableValue`
- Safe for use with Swift concurrency
- Simple API for storing and retrieving values

## Usage

```swift
import SendableValue

let value = SendableValue(42)
let anyValue = SendableAnyValue("Hello")
let hashableValue = SendableAnyHashableValue("Key")
```

## License
This project is licensed under the terms of the MIT license. See the [LICENSE](LICENSE) file for details.
