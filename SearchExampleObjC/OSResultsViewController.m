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

@property (nonatomic, strong) NSArray<OSSearchResult *> *results;
@property (nonatomic, strong) OSPlacesSearchService *searchService;

@end

@implementation OSResultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *apiKeyURL = [[NSBundle mainBundle] URLForResource:@"APIKEY"
                                               withExtension:nil];
    NSString *apiKey = [NSString stringWithContentsOfURL:apiKeyURL
                                                encoding:NSUTF8StringEncoding
                                                   error:nil];
    self.searchService = [[OSPlacesSearchService alloc] initWithApiKey:apiKey];
    self.results = [NSMutableArray array];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)search:(NSString *)text {
    if (text.length > 2) {
        [self.searchService find:text completion:^(OSResponse * _Nullable response, NSError * _Nullable error) {
            if (error) {
                NSLog(@"Error: %@", error.localizedDescription);
                return;
            }
            self.results = response.results;
            [self.tableView reloadData];
        }];
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
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    OSSearchResult *result = self.results[indexPath.row];
    cell.textLabel.text = [result.address capitalizedString];
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
    return cell;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
