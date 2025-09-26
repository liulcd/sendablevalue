// The Swift Programming Language
// https://docs.swift.org/swift-book

// SendableValue.swift
// This file defines classes for type-erased, sendable values in Swift.
// Author: liulcd
// License: See LICENSE file in the project root for license information.

import Foundation

/// A type-erased, optionally hashable value that conforms to Sendable.
open class SendableValue: NSObject, @unchecked Sendable {
    /// The underlying value, can be any type or nil.
    public let value: Any?

    /// Initializes with an optional value.
    /// - Parameter value: The value to store.
    public init(_ value: Any?) {
        self.value = value
    }

    /// Returns the value as AnyHashable if possible, otherwise nil.
    open var anyHashableValue: AnyHashable? {
        get {
            return self.value as? AnyHashable
        }
    }
}

/// A type-erased value that conforms to Sendable.
open class SendableAnyValue: NSObject, @unchecked Sendable {
    /// The underlying value of any type.
    public let value: Any

    /// Initializes with a value.
    /// - Parameter value: The value to store.
    public init(_ value: Any) {
        self.value = value
    }
}

/// A type-erased AnyHashable value that conforms to Sendable.
open class SendableAnyHashableValue: NSObject, @unchecked Sendable {
    /// The underlying AnyHashable value.
    public let value: AnyHashable

    /// Initializes with an AnyHashable value.
    /// - Parameter value: The AnyHashable value to store.
    public init(_ value: AnyHashable) {
        self.value = value
    }
}
