//
//  ViewController.m
//  SearchExampleObjC
//
//  Created by David Haynes on 17/03/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

#import "ViewController.h"
#import "OSResultsViewController.h"

@interface ViewController ()<UISearchResultsUpdating>

@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) OSResultsViewController *resultsViewController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.resultsViewController = [[OSResultsViewController alloc] init];
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:self.resultsViewController];
    self.searchController.searchResultsUpdater = self;
    self.searchController.dimsBackgroundDuringPresentation = YES;
    self.searchController.searchBar.scopeButtonTitles = @[ @"OS Places", @"OS Open Names" ];
    [self.view addSubview:self.searchController.searchBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    [self.resultsViewController search:searchController.searchBar.text scope:searchController.searchBar.selectedScopeButtonIndex];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
