//
//  OSResultsViewController.h
//  Search
//
//  Created by David Haynes on 17/03/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, OSSearchResultsScope) {
    OSSearchResultsScopePlaces,
    OSSearchResultsScopeOpenNames
};

@interface OSResultsViewController : UITableViewController

- (void)search:(NSString *)text scope:(OSSearchResultsScope)scope;

@end
