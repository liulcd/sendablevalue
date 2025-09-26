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
    
    /// Returns the value as an update handler closure if possible, otherwise nil.
    /// The closure takes the new value and the old value as parameters.
    open var updatedHandlerValue: ((_ value: Any?, _ oldValue: Any?) -> Void)? {
        get {
            return self.value as? (_ value: Any?, _ oldValue: Any?) -> Void
        }
    }
    
    /// Returns the value as a result handler closure if possible, otherwise nil.
    /// The closure takes a result and an error (NSError) as parameters.
    open var resultHandlerValue: ((_ result: Any?, _ error: NSError?) -> Void)? {
        get {
            return self.value as? (_ result: Any?, _ error: NSError?) -> Void
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

/// A type-erased sendable wrapper for update handler closures.
/// This class stores a closure that takes a new value and an old value, both optional, and returns void.
open class SendableUpdatedHandlerValue: NSObject, @unchecked Sendable {
    /// The stored update handler closure.
    public let value: (_ value: Any?, _ oldValue: Any?) -> Void

    /// Initializes with an update handler closure.
    /// - Parameter value: The closure to store, which takes new and old values.
    public init(_ value: @escaping (_ value: Any?, _ oldValue: Any?) -> Void) {
        self.value = value
    }
}

/// A type-erased sendable wrapper for result handler closures.
/// This class stores a closure that takes a result (optional) and an error (NSError, optional), and returns void.
open class SendableResultHandlerValue: NSObject, @unchecked Sendable {
    /// The stored result handler closure.
    public let value: (_ result: Any?, _ error: NSError?) -> Void

    /// Initializes with a result handler closure.
    /// - Parameter value: The closure to store, which takes a result and an error.
    public init(_ value: @escaping (_ result: Any?, _ error: NSError?) -> Void) {
        self.value = value
    }
}
