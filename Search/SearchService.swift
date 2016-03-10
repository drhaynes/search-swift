//
//  SearchService.swift
//  Search
//
//  Created by David Haynes on 10/03/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

import Fetch

public class SearchService {
    let apiKey: String

    public init(apiKey: String) {
        self.apiKey = apiKey
    }
}

/**
 *  Searchable protocol
 */
public protocol Searchable {
    /**
     Find the text specified

     - parameter query:      The text to find
     - parameter completion: Completion block to call
     */
    func find(query: String, completion: (Result<Response> -> Void))
}
