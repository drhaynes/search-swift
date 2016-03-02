//
//  Results.swift
//  Search
//
//  Created by David Haynes on 01/03/2016
//  Copyright (c) Ordnance Survey. All rights reserved.
//

import Foundation

public class Results: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
    internal let kResultsDpaKey: String = "DPA"

    public let dpa: [Dpa]

    init(dpa: [Dpa]) {
        self.dpa = dpa
    }
}
