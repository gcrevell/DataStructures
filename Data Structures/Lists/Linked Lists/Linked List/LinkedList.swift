//
//  LinkedList.swift
//  Data Structures
//
//  Created by Gabriel Revells on 5/21/19.
//  Copyright © 2019 Gabriel Revells. All rights reserved.
//

import UIKit

/// A singly linked list.
/// - Complexity: O(n) storage
class LinkedList<V>: ListProtocol {
    public private(set) var size: Int = 0

    private var first: Node<V>
    private var last: Node<V>

    init() {
        // Create sentinal node
        first = Node<V>()
        last = first
    }

    /// Append a new value to the end of the list.
    ///
    /// - Parameter value: The value to append to the list
    /// - Complexity: O(1) time
    func append(_ value: V) {
        let newNode = Node<V>(value)
        last.next = newNode
        last = newNode
        size += 1
    }

    /// Insert a value at a given index of the list.
    ///
    /// If the index is beyond the current size of the list, the value will be
    /// appended to the end of the list. If the index is negative, the value
    /// will be inserted at the beginning of the list.
    ///
    /// - Parameters:
    ///   - value: The value to insert
    ///   - index: The index to insert at
    /// - Complexity: O(n) time
    func insert(_ value: V, at index: Int) {
        let previousNode = (try? getNode(at: index).previous) ?? (index < 0 ? first : last)
        let newNode = Node<V>(value)

        newNode.next = previousNode.next
        previousNode.next = newNode

        size += 1
    }

    /// Get a value at a specific index in the list.
    ///
    /// Returns nil if the index is out of bounds of the list.
    ///
    /// - Parameter index: The position index to grab from.
    /// - Returns: The value at that index, or nil if the index is out of bounds
    /// - Complexity: O(1) time
    func get(at index: Int) -> V? {
        // Techincally node.value is optional, because the sentry node doesn't
        // have a value. However, realistically this won't happen because we
        // don't get the sentry node from getNode.
        return try? getNode(at: index).current.value
    }

    /// Remove the value at a given index.
    ///
    /// Remove the value at a given index from the list, and return the value.
    ///
    /// - Parameter index: The index of the value to remove.
    /// - Returns: The value at the index, or nil if the index is out of bounds.
    /// - Complexity: O(n) time
    func remove(at index: Int) -> V? {
        guard let nodes = try? getNode(at: index) else { return nil }
        let previousNode = nodes.previous
        let nodeToRemove = nodes.current

        previousNode.next = nodeToRemove.next

        size -= 1

        return nodeToRemove.value
    }

    /// Get the node at a current index.
    ///
    /// This gets the node at a specific index, and the previous node. The
    /// current node is the node at the given index, and is gurenteed to be an
    /// actual node. The previous node is gurenteed to exist, but may be the
    /// sentry node at the beginning of the list.
    ///
    /// - Parameter index: The index of the node to get.
    /// - Returns:
    ///     - previous: The node before the given index
    ///     - current: The node at the given index
    /// - Throws: Throws an index out of bounds error if the index is outside
    ///               of the current list.
    /// - Complexity: O(n) time
    private func getNode(at index: Int) throws -> (previous: Node<V>, current: Node<V>) {
        guard index >= 0 else { throw ListError.IndexOutOfBoundsError }

        // Our first node is a sentry node, so skip that
        var previousNode = first
        guard var currentNode = first.next else { throw ListError.IndexOutOfBoundsError }
        var count = 0

        while count < index {
            guard let nextNode = currentNode.next else { throw ListError.IndexOutOfBoundsError }

            previousNode = currentNode
            currentNode = nextNode
            count += 1
        }

        return (previous: previousNode, current: currentNode)
    }
}
