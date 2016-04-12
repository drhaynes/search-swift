//
//  OpenNamesSearchServiceTests.swift
//  Search
//
//  Created by Dave Hardiman on 11/04/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

import XCTest
import Nimble
import Fetch
import OHHTTPStubs
import OSTransformation
@testable import Search

class OpenNamesSearchServiceTests: XCTestCase {

    func testTheServiceIsConfiguredCorrectly() {
        let testApiKey = "test-key"
        let service = OpenNamesSearchService(apiKey: testApiKey)
        expect(service.apiKey).to(equal(testApiKey))
    }

    func testItSendsAFindRequestCorrectly() {
        let testApiKey = "test-key"
        let testQuery = "Ordnance Survey"
        let service = OpenNamesSearchService(apiKey: testApiKey)

        let expectation = expectationWithDescription("Request received")

        stub(stubFindHttpBlock(testApiKey, query: testQuery)) { (request) -> OHHTTPStubsResponse in
            return OHHTTPStubsResponse(error: stubError())
        }

        service.find(testQuery) { result in
            expectation.fulfill()
        }

        waitForExpectationsWithTimeout(1.0, handler: nil)
        OHHTTPStubs.removeAllStubs()
    }

    func testItSendsABoundingBoxFindRequestCorrectly() {
        let testApiKey = "test-key"
        let testQuery = [
            NSURLQueryItem(name: "query", value: "Ordnance Survey"),
            NSURLQueryItem(name: "bounds", value: "0,0,100,100")
        ]
        let service = OpenNamesSearchService(apiKey: testApiKey)

        let expectation = expectationWithDescription("Request received")

        stub(stubOpenNamesHttpBlock(testApiKey, path: "find", queryItems: testQuery)) { (request) -> OHHTTPStubsResponse in
            return OHHTTPStubsResponse(error: stubError())
        }

        service.find("Ordnance Survey", boundingBox: OSGridRect(originSW: OSGridPoint(easting: 0, northing: 0), size: OSGridSize(width: 100, height: 100))) { result in
            expectation.fulfill()
        }

        waitForExpectationsWithTimeout(1.0, handler: nil)
        OHHTTPStubs.removeAllStubs()
    }

    func testItSendsANearestRequestCorrectly() {
        let testApiKey = "test-key"
        let testLocation = NSURLQueryItem(name: "point", value: "437293,115515")
        let service = OpenNamesSearchService(apiKey: testApiKey)

        let expectation = expectationWithDescription("Request received")

        stub(stubOpenNamesHttpBlock(testApiKey, path: "nearest", queryItems: [testLocation])) { (request) -> OHHTTPStubsResponse in
            return OHHTTPStubsResponse(error: stubError())
        }

        service.nearest(OSGridPoint(easting: 437293, northing: 115515)) { (result) -> Void in
            expectation.fulfill()
        }

        waitForExpectationsWithTimeout(1.0, handler: nil)
        OHHTTPStubs.removeAllStubs()
    }

    func stubFindHttpBlock(apiKey: String, query: String) -> OHHTTPStubsTestBlock {
        return stubOpenNamesHttpBlock(apiKey, path: "find", queryItems: [
            NSURLQueryItem(name: "query", value: query)
            ])
    }

    func stubOpenNamesHttpBlock(apiKey: String, path: String, queryItems: [NSURLQueryItem]) -> OHHTTPStubsTestBlock {
        let query = [NSURLQueryItem(name: "key", value: apiKey)] + queryItems
        let match = isScheme("https") &&
            isHost("api.ordnancesurvey.co.uk") &&
            isPath("/opennames/v1/\(path)") &&
            containsQueryItems(query)
        return match
    }

}
