//
//  StationFacilityDetailViewController.m
//  StationFinder
//
//  Created by Takomborerwa Mazarura on 17/11/2017.
//  Copyright © 2017 SuperAwesomeInc. All rights reserved.
//

#import "StationFacilityDetailViewController.h"

@interface StationFacilityDetailViewController ()

@end

@implementation StationFacilityDetailViewController

#pragma mark - View Controller Lifecyle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupVariables];
    
    [self setupViewAppearance];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Setup Variables

- (void)setupVariables
{}

#pragma mark - Setup View Appearance

- (void)setupViewAppearance
{
    [self setupNavigationBarAppearance];
}

#pragma mark - Navigation Bar View Configuration

- (void)setupNavigationBarAppearance
{
    [self setupStatusBar];
    
    [self setupNavigationBar];
    
    [self setupNavigationItem];
}

- (void)setupStatusBar
{
    [UIApplication sharedApplication].statusBarStyle = UIBarStyleDefault;
}

- (void)setupNavigationBar
{
    self.title = self.facility ? self.facility.name : @"Facility";
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    [self.navigationController.navigationBar setTranslucent: NO];
    
    [self.navigationController.navigationBar setBarTintColor:kAppWhite];
}

- (void)setupNavigationItem
{
    [self.navigationItem setHidesBackButton:NO];
}

@end
