//
//  JsonPerformanceTests.swift
//  Search
//
//  Created by David Haynes on 08/03/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

import XCTest
import Nimble
@testable import Search

class JsonPerformanceTests: XCTestCase {

    func testOSJSONPerformance() {
        measureBlock {
            let data = NSData(contentsOfURL: Bundle().URLForResource("100-results", withExtension: "json")!)!
            let result = Response.parse(fromData: data, withStatus: 200)
            switch result {
            case .Success(_):
                break
            default:
                fail("Unexpected result")
            }
        }
    }
    
}
