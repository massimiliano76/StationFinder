//
//  StationsFeedTableViewController.m
//  StationFinder
//
//  Created by Takomborerwa Mazarura on 16/11/2017.
//  Copyright © 2017 SuperAwesomeInc. All rights reserved.
//

#import "StationsFeedTableViewController.h"

#import "LocationHandler.h"
#import "GetStationsHandler.h"

#import "StationsFeedTableViewCell.h"

@interface StationsFeedTableViewController () <LocationHandlerDelegate, GetStationsHandlerDelegate>
{
    NSInteger searchRadius;
    
    BOOL isReloading;
}

@property (nonatomic, strong) GetStationsHandler *stationsHandler;

@property (nonatomic, strong) LocationHandler *locationHandler;

@property (nonatomic, strong) NSMutableArray *stations;

@end

@implementation StationsFeedTableViewController

- (void)viewDidLoad {
   
    [super viewDidLoad];
    
    [self registerTableViewCells];
    
    [self setupVariables];
    
    [self setupViewAppearance];

    [self collectDataForView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Setup Core View Variables

- (void)setupVariables
{
    searchRadius = 500; // meters
    
    [self initHandlers];
}

- (void)initHandlers
{
    if (!self.stationsHandler) {
        
        self.stationsHandler = [[GetStationsHandler alloc] init];
        
        self.stationsHandler.delegate = self;
    }
    
    if (!self.locationHandler) {
        
        self.locationHandler = [[LocationHandler alloc] init];
        
        self.locationHandler.delegate = self;
    }
}

#pragma mark - Collect Data For View

/**
 Method collectDataForView
 
 This method begins the process of collecting the location and nearby stations. The process works like so ..
 
 1. Start collecting with locationHandler (done in this method) if you can, location will be returned in delegate method 'returnLocationFromLocationHandler' ... otherwise default location from locationHandler
 2. On success location data will be used to collect nearby stations using method 'getNearbyStationsWithUsersLocation'
 3. Stations will be used to populate the table view
 */
- (void)collectDataForView
{
    if (!isReloading) {
     
        isReloading = YES;
        
        if ([CLLocationManager locationServicesEnabled]){
            
            [self.locationHandler beginCollectingUsersLocation];
            
        }else{
            
            [self.locationHandler.locationManager requestWhenInUseAuthorization];
            
            [self getNearbyStationsWithUsersLocation:[self.locationHandler getHandlerDefaultLocation]];
        }
    }
}

#pragma mark - Get Stations

- (void)getNearbyStationsWithUsersLocation:(CLLocation*)location;
{
    NSString *latitude  = [NSString stringWithFormat:@"%f", location.coordinate.latitude];
    
    NSString *longitude = [NSString stringWithFormat:@"%f", location.coordinate.longitude];
    
    if (([longitude length] & [latitude length]) > 0) {
        
        [self.stationsHandler getNearbyTubeStationsWithLocationInfo:searchRadius latitude:latitude longitude:longitude];
    }
}

#pragma mark - Location Handler Delegate Methods

- (void)returnLocationFromLocationHandler:(LocationHandler*)handler
                                 location:(CLLocation*)location;
{
    [self getNearbyStationsWithUsersLocation:location];
}

#pragma mark - Station Handler Delegate Methods

- (void)returnStationsFromHandler:(GetStationsHandler*)handler
                         stations:(NSMutableArray*)stations
{
    self.stations = stations;
    
    [self.tableView reloadData];
    
    isReloading = NO;
}

- (void)returnErrorFromStationsFromHandler:(GetStationsHandler*)handler
                              errorMessage:(NSString*)errorMessage;
{
    [self presentErrorWithTitleAndMessage:@"error" message:errorMessage];
}

#pragma mark - Setup View Appearance

- (void)setupViewAppearance
{
    [self setupNavigationBarAppearance];
    
    [self setupTableView];
}

#pragma mark - Navigation Bar Appearance

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
    self.title = @"Nearby Stations";
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    [self.navigationController.navigationBar setTranslucent: NO];
    
    [self.navigationController.navigationBar setBarTintColor:kAppWhite];
}

- (void)setupNavigationItem
{
    [self.navigationItem setHidesBackButton:YES];
}

#pragma mark - Setup Table View

- (void)setupTableView
{
    [self registerTableViewCells];
    
    self.view.backgroundColor       = kAppUltraLightGray;
    
    self.tableView.backgroundColor  = kAppUltraLightGray;
    
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    [self.tableView setContentInset:UIEdgeInsetsMake(25,0,0,0)];
    
    //[self setupPullToRefresh];
}

- (void)setupPullToRefresh
{
    if (!self.refreshControl) {
        
        self.refreshControl = [[UIRefreshControl alloc] init];
    }
    
    self.refreshControl.tintColor       = kAppDarkGray;
    
    self.refreshControl.backgroundColor = [UIColor clearColor];
    
    [self.refreshControl addTarget:self
                            action:@selector(collectDataForView)
                  forControlEvents:UIControlEventValueChanged];
}

- (void)registerTableViewCells
{
    [self.tableView registerNib:[UINib nibWithNibName:kStationsFeedTableViewCellCellNibName bundle:[NSBundle mainBundle]]
         forCellReuseIdentifier:kStationsFeedTableViewCellID];
}

#pragma mark - Present Error

- (void)presentErrorWithTitleAndMessage:(NSString*)title message:(NSString*)message
{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:title
                                                                    message:message
                                                             preferredStyle:UIAlertControllerStyleAlert];
    
    alert.popoverPresentationController.sourceView = self.view;
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
        [alert dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [alert addAction:okAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.stations count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StationsFeedTableViewCell *feedCell = [[StationsFeedTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kStationsFeedTableViewCellID];
    
    if (feedCell == nil) {
        
        feedCell = [[StationsFeedTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                    reuseIdentifier:kStationsFeedTableViewCellID];
    }
    
    feedCell.backgroundColor = [UIColor redColor];
    
    if ([self.stations objectAtIndex:indexPath.row]) {
        
        TubeStation *station = [self.stations objectAtIndex:indexPath.row];
 
        [feedCell configureWithStation:station];
    }
    
    return feedCell;
}

#pragma mark - Table view delegat

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger height = 100;
    
    return height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
