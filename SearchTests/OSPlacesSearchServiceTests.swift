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
import OSTransformation
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
        var completionHandler: (Result<SearchResponse> -> Void)?
        var location: OSGridPoint?

        func find(query: String, completion: (Result<SearchResponse> -> Void)) {
            self.query = query
            self.completionHandler = completion
        }

        func nearest(location: OSGridPoint, completion: (Result<SearchResponse> -> Void)) {
            self.location = location
            self.completionHandler = completion
        }
    }

    func testTheServiceCallsTheUnderlyingService() {
        let mockService = MockSearchService()
        let osPlacesService = OSPlacesSearchService(apiKey: "test")
        osPlacesService.searchService = mockService
        osPlacesService.find("testQuery", completion: { (result) in })
        expect(mockService.query).to(equal("testQuery"))
        expect(mockService.completionHandler).notTo(beNil())
    }

    func testNearestCallsTheUnderlyingService() {
        let mockService = MockSearchService()
        let osPlacesService = OSPlacesSearchService(apiKey: "test")
        osPlacesService.searchService = mockService
        osPlacesService.nearest(OSGridPoint(easting: 1234, northing: 5678), completion: { _ in })
        expect(OSGridPointEqualToPoint(mockService.location!, OSGridPoint(easting: 1234, northing: 5678))).to(beTrue())
        expect(mockService.completionHandler).notTo(beNil())
    }

    func testASuccesfulSearchResponseIsReturned() {
        let data = NSData(contentsOfURL: Bundle().URLForResource("test-response", withExtension: "json")!)!
        let result = SearchResponse.parse(fromData: data, withStatus: 200)
        let mockService = MockSearchService()
        let osPlacesService = OSPlacesSearchService(apiKey: "test")
        osPlacesService.searchService = mockService
        var receivedSearchResponse: SearchResponse?

        osPlacesService.find("test") { (response, error) in
            receivedSearchResponse = response
        }
        mockService.completionHandler?(result)
        expect(receivedSearchResponse).notTo(beNil())
    }

    func testAnNSErrorIsReturned() {
        let expectedError = NSError(domain: "test.domain", code: 123, userInfo: nil)
        let response = Result<SearchResponse>.Failure(expectedError)
        performErrorTestScenario(response, expectedError: expectedError)
    }

    func testAnNSErrorIsReturnedForNearest() {
        let expectedError = NSError(domain: "test.domain", code: 123, userInfo: nil)
        let result = Result<SearchResponse>.Failure(expectedError)

        let mockService = MockSearchService()
        let osPlacesService = OSPlacesSearchService(apiKey: "test")
        osPlacesService.searchService = mockService
        var receivedError: NSError?

        osPlacesService.nearest(OSGridPoint(easting: 1234, northing: 5678)) { (results, error) in
            receivedError = error
        }
        mockService.completionHandler?(result)
        expect(receivedError).to(equal(expectedError))
    }

    func testSearchServiceErrorsAreTranslatedCorrectly() {
        let errorCases = [
            SearchError.FailedToDeserialiseJSON,
            SearchError.FailedToParseJSON,
            SearchError.NoDataReceived,
            SearchError.Unauthorised,
            SearchError.UnknownError
        ]
        errorCases.forEach { error in
            let expectedError = NSError(domain: OSSearchErrorDomain, code: error.rawValue(), userInfo: nil)
            let result = Result<SearchResponse>.Failure(error)
            performErrorTestScenario(result, expectedError: expectedError)
        }
    }

    func testSearchServiceErrorsWithMessagesAreTranslatedCorrectly() {
        let errorCases = [
            SearchError.BadRequest("test description"),
            SearchError.ServerError("test description")
        ]
        errorCases.forEach { error in
            let expectedError = NSError(domain: OSSearchErrorDomain, code: error.rawValue(), userInfo: [ NSLocalizedDescriptionKey: "test description" ])
            let result = Result<SearchResponse>.Failure(error)
            performErrorTestScenario(result, expectedError: expectedError)
        }
    }

    func performErrorTestScenario(result: Result<SearchResponse>, expectedError: NSError) {
        let mockService = MockSearchService()
        let osPlacesService = OSPlacesSearchService(apiKey: "test")
        osPlacesService.searchService = mockService
        var receivedError: NSError?

        osPlacesService.find("test") { (results, error) in
            receivedError = error
        }
        mockService.completionHandler?(result)
        expect(receivedError).to(equal(expectedError))
    }

}
