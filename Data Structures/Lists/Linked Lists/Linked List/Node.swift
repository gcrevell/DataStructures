//
//  Node.swift
//  Data Structures
//
//  Created by Gabriel Revells on 5/21/19.
//  Copyright © 2019 Gabriel Revells. All rights reserved.
//

import UIKit

class Node<V> {
    var next: Node?
    public private(set) var value: V?

    init() {}

    init(_ value: V) {
        self.value = value
    }
}
