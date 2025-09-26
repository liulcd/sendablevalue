// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

open class SendableValue: NSObject, @unchecked Sendable {
    let value: Any?
    
    init(value: Any?) {
        self.value = value
    }
}
