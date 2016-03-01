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
    internal let kHeaderMatchprecisionKey: String = "matchprecision"
    internal let kHeaderLrKey: String = "lr"
    internal let kHeaderDatasetKey: String = "dataset"
    internal let kHeaderMaxresultsKey: String = "maxresults"
    internal let kHeaderTotalresultsKey: String = "totalresults"
    internal let kHeaderUriKey: String = "uri"
    internal let kHeaderOutputSrsKey: String = "output_srs"
    internal let kHeaderEpochKey: String = "epoch"
    internal let kHeaderOffsetKey: String = "offset"
    internal let kHeaderFormatKey: String = "format"
    internal let kHeaderQueryKey: String = "query"

    public let matchprecision: Int?
    public let lr: String?
    public let dataset: String?
    public let maxresults: Int?
    public let totalresults: Int?
    public let uri: String?
    public let outputSrs: String?
    public let epoch: String?
    public let offset: Int?
    public let format: String?
    public let query: String?

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
