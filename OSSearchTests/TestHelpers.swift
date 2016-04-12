//
//  TestHelpers.swift
//  Search
//
//  Created by Dave Hardiman on 01/03/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

import Foundation
import OHHTTPStubs

private final class BundleHelper {}

func Bundle() -> NSBundle {
    return NSBundle(forClass: BundleHelper.self)
}

func containsQueryItems(items: [NSURLQueryItem]) -> OHHTTPStubsTestBlock {
    return { req in
        guard let url = req.URL else {
            return false
        }
        let comps = NSURLComponents(URL: url, resolvingAgainstBaseURL: true)
        guard let queryItems = comps?.queryItems else {
            return false
        }
        for item in items {
            if queryItems.filter({ $0 == item}).count == 0 {
                return false
            }
        }
        return true
    }
}

func stubError() -> NSError {
    return NSError(domain: "", code: 0, userInfo: nil)
}
