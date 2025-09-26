// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

open class SendableValue: NSObject, @unchecked Sendable {
    let value: Any?
    
    init(value: Any?) {
        self.value = value
    }
    
    var anyHashableValue: AnyHashable? {
        get {
            return self.value as? AnyHashable
        }
    }
    
}

open class SendableAnyValue: NSObject, @unchecked Sendable {
    let value: Any
    
    init(value: Any) {
        self.value = value
    }
}

open class SendableAnyHashableValue: NSObject, @unchecked Sendable {
    let anyHashableValue: AnyHashable
    
    init(anyHashableValue: AnyHashable) {
        self.anyHashableValue = anyHashableValue
    }
}
