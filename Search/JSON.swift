//
//  JSON.swift
//  Search
//
//  Created by Dave Hardiman on 09/03/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

import Foundation

typealias SomeJSON = [String: NSObject]

private func cast<T>(value: AnyObject?) -> T? {
    return value as? T
}

protocol JSONValue {}

extension NSObject: JSONValue {
    var integer: Int? {
        return cast(self)
    }

    var float: Float? {
        return cast(self)
    }

    var double: Double? {
        return cast(self)
    }

    var string: String? {
        return cast(self)
    }

    var json: SomeJSON? {
        return cast(self)
    }

    var jsonArray: [SomeJSON]? {
        return cast(self)
    }
}
