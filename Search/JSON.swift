//
//  JSON.swift
//  Search
//
//  Created by Dave Hardiman on 09/03/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

import Foundation

typealias SomeJSON = [String: AnyObject]

private func cast<T>(value: AnyObject?) -> T? {
    return value as? T
}

func integer(value: AnyObject?) -> Int? {
    return cast(value)
}

func float(value: AnyObject?) -> Float? {
    return cast(value)
}

func double(value: AnyObject?) -> Double? {
    return cast(value)
}

func string(value: AnyObject?) -> String? {
    return cast(value)
}

func json(value: AnyObject?) -> SomeJSON? {
    return cast(value)
}

func jsonArray(value: AnyObject?) -> [SomeJSON]? {
    return cast(value)
}
