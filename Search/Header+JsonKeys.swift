//
//  Header+JsonKeys.swift
//  Search
//
//  Created by David Haynes on 08/03/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

import Foundation

extension Header {
    // MARK: Declaration for string constants to be used to decode and also serialize.
    @nonobjc internal static let MatchprecisionKey: String = "matchprecision"
    @nonobjc internal static let LrKey: String = "lr"
    @nonobjc internal static let DatasetKey: String = "dataset"
    @nonobjc internal static let MaxresultsKey: String = "maxresults"
    @nonobjc internal static let TotalresultsKey: String = "totalresults"
    @nonobjc internal static let UriKey: String = "uri"
    @nonobjc internal static let OutputSrsKey: String = "output_srs"
    @nonobjc internal static let EpochKey: String = "epoch"
    @nonobjc internal static let OffsetKey: String = "offset"
    @nonobjc internal static let FormatKey: String = "format"
    @nonobjc internal static let QueryKey: String = "query"
}
