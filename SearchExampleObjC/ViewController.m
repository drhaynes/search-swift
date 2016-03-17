//
//  ViewController.m
//  SearchExampleObjC
//
//  Created by David Haynes on 17/03/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

#import "ViewController.h"

@interface ViewController() <UISearchResultsUpdating>

@property (nonatomic, strong) UISearchController *searchController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.searchResultsUpdater = self;
    self.searchController.dimsBackgroundDuringPresentation = YES;
    [self.view addSubview:self.searchController.searchBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    NSLog(@"text: %@", searchController.searchBar.text);
}

@end
