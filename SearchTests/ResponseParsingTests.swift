//
//  SearchTests.swift
//  SearchTests
//
//  Created by David Haynes on 25/02/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

import XCTest
import Nimble
@testable import Search

class ResponseParsingTests: XCTestCase {

    func testItIsPossibleToParseAResponse() {
        let data = NSData(contentsOfURL: Bundle().URLForResource("test-response", withExtension: "json")!)!
        let result = Response.parse(fromData: data, withStatus: 200)
        switch result {
        case .Success(let response):
            validateResponse(response)
        default:
            fail("Unexpected result")
        }
    }

    private func validateResponse(response: Response) {
        fail("Not yet implemented")
    }

}
