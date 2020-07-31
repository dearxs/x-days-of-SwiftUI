//
//  Transaction.swift
//  Transaction
//
//  Created by Dali Han on 2020/7/31.
//

import SwiftUI
import Combine

@propertyWrapper
@dynamicMemberLookup

public struct Transaction<Value> : DynamicProperty {
    @State private var derived: Value
    @Binding private var source : Value
    
    fileprivate init(source: Binding<Value>) {
        self._source = source
        self._derived = State(initialValue: source.wrappedValue)
    }
    
    public var wrappedValue : Value {
        get { derived }
        nonmutating set { derived = newValue }
    }
    public var projectedValue: Transaction<Value> { self }
    
    public subscript<T>(dynamicMember keyPath: WritableKeyPath<Value, T>) -> Binding<T> {
        return $derived[dynamicMember: keyPath]
    }
    
    public var binding: Binding<Value> { $derived }
    
    public func commit() {
        source = derived
    }
    
    public func rollback() {
        derived = source
    }
}

extension Transaction where Value : Equatable {
    public var hasChanges: Bool { return source != derived }
}

extension Binding {
    public func transaction() -> Transaction<Value> { .init(source: self) }
}
