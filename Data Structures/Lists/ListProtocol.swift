//
//  ListProtocol.swift
//  Data Structures
//
//  Created by Gabriel Revells on 5/22/19.
//  Copyright © 2019 Gabriel Revells. All rights reserved.
//

import Foundation

protocol ListProtocol {
    // The generic type for this protocol. Thanks, Swift
    associatedtype V

    /// The size of the list. Readonly, obviously.
    var size: Int { get }

    /// Insert a value into the list at a given position.
    ///
    /// Insert a value into the list at a given value, shifting the rest of the
    /// list down one. If the index if outside of the bounds of the array, the
    /// value should be added to the beginning or the end of the list, depending
    /// on the given index (negative values should be added to the beginning of
    /// the list, values greater than the size to the end of the list.
    ///
    /// - Parameters:
    ///   - value: The value to insert into the list
    ///   - index: The indes to insert at
    func insert(_ value: V, at index: Int)

    /// Get a value at a specific index in the list.
    ///
    /// Returns nil if the index is out of bounds of the list.
    ///
    /// - Parameter index: The position index to grab from.
    /// - Returns: The value at that index, or nil if the index is out of bounds
    func get(at index: Int) -> V?

    /// Remove the value at a given index.
    ///
    /// Remove the value at a given index from the list, and return the value.
    /// Return nil if the index does not exist in the list.
    ///
    /// - Parameter index: The index of the value to remove.
    /// - Returns: The value at the index, or nil if the index is out of bounds.
    func remove(at index: Int) -> V?
}
