//
//  Header.swift
//  Search
//
//  Created by David Haynes on 01/03/2016
//  Copyright (c) Ordnance Survey. All rights reserved.
//

import Foundation

public class Header: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
    internal static let MatchprecisionKey: String = "matchprecision"
    internal static let LrKey: String = "lr"
    internal static let DatasetKey: String = "dataset"
    internal static let MaxresultsKey: String = "maxresults"
    internal static let TotalresultsKey: String = "totalresults"
    internal static let UriKey: String = "uri"
    internal static let OutputSrsKey: String = "output_srs"
    internal static let EpochKey: String = "epoch"
    internal static let OffsetKey: String = "offset"
    internal static let FormatKey: String = "format"
    internal static let QueryKey: String = "query"

    public let matchprecision: Int
    public let lr: String
    public let dataset: String
    public let maxresults: Int
    public let totalresults: Int
    public let uri: String
    public let outputSrs: String
    public let epoch: String
    public let offset: Int
    public let format: String
    public let query: String

    init(matchprecision: Int, lr: String, dataset: String, maxresults: Int, totalresults: Int, uri: String, outputSrs: String, epoch: String, offset: Int, format: String, query: String) {
        self.matchprecision = matchprecision
        self.lr = lr
        self.dataset = dataset
        self.maxresults = maxresults
        self.totalresults = totalresults
        self.uri = uri
        self.outputSrs = outputSrs
        self.epoch = epoch
        self.offset = offset
        self.format = format
        self.query = query
    }
}
