//
//  OSResultsViewController.m
//  Search
//
//  Created by David Haynes on 17/03/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

#import "OSResultsViewController.h"
@import Search;

@interface OSResultsViewController ()

@property (nonatomic, strong) NSArray *results;
@property (nonatomic, strong) OSPlacesSearchService *placesService;
@property (nonatomic, strong) OSOpenNamesSearchService *openNamesService;
@end

@interface SearchCell : UITableViewCell
@end

@interface NSObject (SafeCast)
+ (instancetype)os_safeCast:(id)object;
@end

@implementation OSResultsViewController

-
    (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *apiKeyURL = [[NSBundle mainBundle] URLForResource:@"APIKEY"
                                               withExtension:nil];
    NSString *apiKey = [NSString stringWithContentsOfURL:apiKeyURL
                                                encoding:NSUTF8StringEncoding
                                                   error:nil];
    self.placesService = [[OSPlacesSearchService alloc] initWithApiKey:apiKey];
    self.openNamesService = [[OSOpenNamesSearchService alloc] initWithApiKey:apiKey];
    self.results = [NSMutableArray array];
    [self.tableView registerClass:SearchCell.class forCellReuseIdentifier:@"cell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)search:(NSString *)text scope:(OSSearchResultsScope)scope {
    if (text.length > 2) {
        if (scope == OSSearchResultsScopePlaces) {
            [self.placesService find:text completion:^(OSSearchResponse *_Nullable response, NSError *_Nullable error) {
                if (error) {
                    NSLog(@"Error: %@", error.localizedDescription);
                    return;
                }
                self.results = response.results;
                [self.tableView reloadData];
            }];
        } else {
            [self.openNamesService find:text completion:^(OSOpenNamesResponse *_Nullable response, NSError *_Nullable error) {
                if (error) {
                    NSLog(@"Error: %@", error.localizedDescription);
                    return;
                }
                self.results = response.results;
                [self.tableView reloadData];
            }];
        }
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.results.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
    id result = self.results[indexPath.row];
    [self updateCell:cell forSearchResult:[OSSearchResult os_safeCast:result]];
    [self updateCell:cell forGazetteerResult:[OSGazetteerEntry os_safeCast:result]];
    return cell;
}

- (void)updateCell:(UITableViewCell *)cell forSearchResult:(OSSearchResult *)result {
    if (result == nil) {
        return;
    }
    cell.textLabel.text = [result.address capitalizedString];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Coords: %f, %f", result.xCoordinate, result.yCoordinate];
}

- (void)updateCell:(UITableViewCell *)cell forGazetteerResult:(OSGazetteerEntry *)result {
    if (result == nil) {
        return;
    }
    NSString *secondValue = result.populatedPlace ?: (result.countyUnitary ?: result.region);
    cell.textLabel.text = [NSString stringWithFormat:@"%@, %@, %@", result.name1, secondValue, result.postcodeDistrict ?: @""];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Coords: %f, %f", result.geometryX, result.geometryY];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end

@implementation SearchCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier])) {
    }
    return self;
}

@end

@implementation NSObject (SafeCast)

+ (instancetype)os_safeCast:(id)object {
    if ([object isKindOfClass:self]) {
        return object;
    }
    return nil;
}

@end
