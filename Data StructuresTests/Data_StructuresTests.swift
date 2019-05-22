//
//  Data_StructuresTests.swift
//  Data StructuresTests
//
//  Created by Gabriel Revells on 5/21/19.
//  Copyright © 2019 Gabriel Revells. All rights reserved.
//

import XCTest
@testable import Data_Structures

class Data_StructuresTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

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

    func testLink
}
