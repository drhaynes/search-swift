//
//  OSSearchError.h
//  Search
//
//  Created by David Haynes on 16/03/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Error domain for use with the search framework
 */
NSString *const OSSearchErrorDomain = @"uk.os.search.error";

NS_ENUM(NSInteger){
    /**
     *  The server returned no data.
     */
    OSSearchErrorNoDataReceived,
    /**
     *  The JSON was malformed and could not be parsed.
     */
    OSSearchErrorFailedToParseJSON,
    /**
     *  The JSON response could not be deserialised into a response object.
     */
    OSSearchErrorFailedToDeserialiseJSON,
    /**
     *  An error occurred which was none of the above.
     */
    OSSearchErrorUnknownError
};
