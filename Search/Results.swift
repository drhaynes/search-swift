//
//  Results.swift
//  Search
//
//  Created by Dave Hardiman on 11/03/2016
//  Copyright (c) Ordnance Survey. All rights reserved.
//

import Foundation
import OSJSON

public class Results: NSObject {

    // MARK: Properties
    public let dpa: SearchResult


    init(dpa: SearchResult) {
        self.dpa = dpa
    }

    //MARK: JSON initialiser
    convenience init?(json: JSON) {
        guard let dpaJSON = json.jsonForKey(Results.SearchResultKey),
            dpa = SearchResult(json: dpaJSON)
        else {
            return nil
        }
        self.init(
            dpa: dpa
        )
    }
}

extension Results {
    // MARK: Declaration for string constants to be used to decode and also serialize.
    @nonobjc internal static let SearchResultKey: String = "DPA"
}
