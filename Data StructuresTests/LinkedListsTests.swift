//
//  Data_StructuresTests.swift
//  Data StructuresTests
//
//  Created by Gabriel Revells on 5/21/19.
//  Copyright © 2019 Gabriel Revells. All rights reserved.
//

import XCTest
@testable import Data_Structures

class LinkedListTests: XCTestCase {
    func testSizeOf() {
        let list = LinkedList<Int>()
        XCTAssert(list.size == 0)
    }

    func testAppend() {
        let list = LinkedList<Int>()

        list.append(1)
        list.append(2)
        list.append(3)

        XCTAssertEqual(list.size, 3)
        XCTAssertEqual(list.get(at: 0), 1)
        XCTAssertEqual(list.get(at: 1), 2)
        XCTAssertEqual(list.get(at: 2), 3)
    }

    func testGet() {
        let list = LinkedList<Int>()

        XCTAssertEqual(list.get(at: 0), nil)

        list.append(1)

        XCTAssertEqual(list.get(at: 0), 1)
        XCTAssertNil(list.get(at: -1))
        XCTAssertNil(list.get(at: 2))
    }

    func testInsert() {
        let list = LinkedList<Int>()

        list.append(1)
        list.append(2)

        XCTAssertEqual(list.size, 2)

        XCTAssertEqual(list.get(at: 0), 1)
        XCTAssertEqual(list.get(at: 1), 2)

        list.insert(3, at: 1)

        XCTAssertEqual(list.size, 3)

        XCTAssertEqual(list.get(at: 0), 1)
        XCTAssertEqual(list.get(at: 1), 3)
        XCTAssertEqual(list.get(at: 2), 2)

        // Test inserting outside of bounds of the array
        list.insert(-1, at: -1)
        list.insert(4, at: 100)

        XCTAssertEqual(list.size, 5)
        XCTAssertEqual(list.get(at: 0), -1)
        XCTAssertEqual(list.get(at: 4), 4)
    }

    func testRemove() {
        let list = LinkedList<Int>()

        list.append(1)
        list.append(2)
        list.append(3)

        XCTAssertEqual(list.size, 3)

        XCTAssertEqual(list.remove(at: 1), 2)
        XCTAssertEqual(list.size, 2)

        XCTAssertEqual(list.get(at: 0), 1)
        XCTAssertEqual(list.get(at: 1), 3)

        XCTAssertNil(list.remove(at: 2))
    }
}
