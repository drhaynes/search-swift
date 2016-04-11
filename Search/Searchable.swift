//
//  Searchable.swift
//  Search
//
//  Created by David Haynes on 16/03/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

import Fetch
import OSTransformation

/**
 *  Searchable protocol
 */
public protocol Searchable {
    /**
     Find the text specified

     - parameter query:      The text to find
     - parameter completion: Completion block to call
     */
    func find(query: String, completion: (Result<SearchResponse> -> Void))

    /**
     Find the nearest address to the provided grid point. Will find a result
     within 100 metres.

     - parameter location:   The location to query
     - parameter completion: Completion block to call
     */
    func nearest(location: OSGridPoint, completion: (Result<SearchResponse> -> Void))
}

/**
 *  Extension to the searchable protocol that allows for a find query that 
 *  prioritises results within the specified bounding box
 */
public protocol BoundingBoxSearchable: Searchable {
    /**
     Find the specified text, prioritising results within the bounding box

     - parameter query:       The text to find
     - parameter boundingBox: The bounding box to search within
     - parameter completion:  Completion block to call
     */
    func find(query: String, boundingBox: OSBoundingBox, completion: (Result<SearchResponse> -> Void))
}
