//
//  Header.swift
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

    // MARK: Properties
	public var matchprecision: Int?
	public var lr: String?
	public var dataset: String?
	public var maxresults: Int?
	public var totalresults: Int?
	public var uri: String?
	public var outputSrs: String?
	public var epoch: String?
	public var offset: Int?
	public var format: String?
	public var query: String?

    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if matchprecision != nil {
			dictionary.updateValue(matchprecision!, forKey: kHeaderMatchprecisionKey)
		}
		if lr != nil {
			dictionary.updateValue(lr!, forKey: kHeaderLrKey)
		}
		if dataset != nil {
			dictionary.updateValue(dataset!, forKey: kHeaderDatasetKey)
		}
		if maxresults != nil {
			dictionary.updateValue(maxresults!, forKey: kHeaderMaxresultsKey)
		}
		if totalresults != nil {
			dictionary.updateValue(totalresults!, forKey: kHeaderTotalresultsKey)
		}
		if uri != nil {
			dictionary.updateValue(uri!, forKey: kHeaderUriKey)
		}
		if outputSrs != nil {
			dictionary.updateValue(outputSrs!, forKey: kHeaderOutputSrsKey)
		}
		if epoch != nil {
			dictionary.updateValue(epoch!, forKey: kHeaderEpochKey)
		}
		if offset != nil {
			dictionary.updateValue(offset!, forKey: kHeaderOffsetKey)
		}
		if format != nil {
			dictionary.updateValue(format!, forKey: kHeaderFormatKey)
		}
		if query != nil {
			dictionary.updateValue(query!, forKey: kHeaderQueryKey)
		}

        return dictionary
    }

}
