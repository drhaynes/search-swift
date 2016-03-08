//
//  Header.swift
//  Search
//
//  Created by David Haynes on 01/03/2016
//  Copyright (c) Ordnance Survey. All rights reserved.
//

import Foundation
import JSONLib

public class Header: NSObject {

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

    convenience init?(json: JSON) {
        guard let uri = json[Header.UriKey].string,
            lr = json[Header.LrKey].string,
            dataset = json[Header.DatasetKey].string,
            outputSrs = json[Header.OutputSrsKey].string,
            epoch = json[Header.EpochKey].string,
            format = json[Header.FormatKey].string,
            query = json[Header.QueryKey].string,
            matchPrecision =  json[Header.MatchprecisionKey].number,
            maxresults = json[Header.MaxresultsKey].number,
            totalresults = json[Header.TotalresultsKey].number,
            offset = json[Header.OffsetKey].number
            else {
                return nil
        }

        self.init(
            matchprecision: Int(matchPrecision),
            lr: lr,
            dataset: dataset,
            maxresults: Int(maxresults),
            totalresults: Int(totalresults),
            uri: uri,
            outputSrs: outputSrs,
            epoch: epoch,
            offset: Int(offset),
            format: format,
            query: query
        )
    }
}
