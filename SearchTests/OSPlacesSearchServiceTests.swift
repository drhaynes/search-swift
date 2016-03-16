//
//  OSPlacesSearchServiceTests.swift
//  Search
//
//  Created by David Haynes on 16/03/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

import XCTest
import Nimble
import Fetch
@testable import Search

class OSPlacesSearchServiceTests: XCTestCase {

    func testItHasABackingSearchService() {
        let osPlacesService = OSPlacesSearchService(apiKey: "test")
        guard let searchService = osPlacesService.searchService as? PlacesSearchService else {
            fail("Incorrect search service type")
            return
        }
        expect(searchService.apiKey).to(equal("test"))
    }

    class MockSearchService: Searchable {
        var query: String?
        var completionHandler: (Result<Response> -> Void)?

        func find(query: String, completion: (Result<Response> -> Void)) {
            self.query = query
            self.completionHandler = completion
        }
    }

    
}
