//
//  StationDetailViewController.m
//  StationFinder
//
//  Created by Takomborerwa Mazarura on 17/11/2017.
//  Copyright © 2017 SuperAwesomeInc. All rights reserved.
//

#import "StationDetailViewController.h"

#import "FormCellFactory.h"

@interface StationDetailViewController ()

@property (nonatomic, strong) FormCellFactory *cellFactory;

@property (nonatomic, strong) CoreStationInfoFormTableViewCell *coreStationInfoFormTableViewCell;

@property (nonatomic, strong) NextTrainsTableViewCell *nextTrainsTableViewCell;

@end

@implementation StationDetailViewController

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
    
    [self setupTableViewAppearance];
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
    self.title = self.station ? self.station.name : @"Station";
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    [self.navigationController.navigationBar setTranslucent: NO];
    
    [self.navigationController.navigationBar setBarTintColor:kAppWhite];
}

- (void)setupNavigationItem
{
    [self.navigationItem setHidesBackButton:NO];
}

#pragma mark - Table View Configuration

- (void)setupTableViewAppearance
{
    self.tableView.separatorColor   = [UIColor clearColor];
    
    self.tableView.separatorStyle   = UITableViewCellSeparatorStyleNone;
    
    self.tableView.backgroundColor  = kAppUltraLightGray;
    
    self.tableView.tableFooterView  = [[UIView alloc]initWithFrame:CGRectZero];
    
    [self.tableView.tableFooterView setTintColor:[UIColor clearColor]];
    
    [self.tableView setContentInset:UIEdgeInsetsMake(5,0,0,0)];
    
    [self setupFormCells];
}

- (void)setupFormCells
{
    if (!_cellFactory) {
        
        _cellFactory = [[FormCellFactory alloc] init];
        
        _cellFactory.delegate = self;
    }
    
    [self setupTableViewCells];
}

- (void)setupTableViewCells
{
    self.coreStationInfoFormTableViewCell   = [self.cellFactory coreStationInfoFormTableViewCell];
    
    self.nextTrainsTableViewCell            = [self.cellFactory nextTrainsTableViewCell];
    
    [self conifgureCellsWithStation:self.station];
    
    self.formCells = @[[self createFormCellArray]];
}

- (NSArray*)createFormCellArray
{
    NSMutableArray *cells = [[NSMutableArray alloc]init];

    [cells addObject:self.coreStationInfoFormTableViewCell];
    
    [cells addObject:self.nextTrainsTableViewCell];
    
    return cells;
}

- (void)conifgureCellsWithStation:(TubeStation*)tubeStation
{
    if (tubeStation) {
        
        [self.coreStationInfoFormTableViewCell configureWithStation:tubeStation];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
