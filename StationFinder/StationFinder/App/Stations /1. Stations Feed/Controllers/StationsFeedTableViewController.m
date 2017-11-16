//
//  StationsFeedTableViewController.m
//  StationFinder
//
//  Created by Takomborerwa Mazarura on 16/11/2017.
//  Copyright © 2017 SuperAwesomeInc. All rights reserved.
//

#import "StationsFeedTableViewController.h"

#import "GetStationsHandler.h"

@interface StationsFeedTableViewController () <GetStationsHandlerDelegate>
{
    NSInteger searchRadius;
}

@property (nonatomic, strong) GetStationsHandler *stationsHandler;

@end

@implementation StationsFeedTableViewController

- (void)viewDidLoad {
   
    [super viewDidLoad];
    
    [self setupVariables];
    
    [self getNearbyStations];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)initHandlers
{
    if (!self.stationsHandler) {
        
        self.stationsHandler = [[GetStationsHandler alloc] init];
        
        self.stationsHandler.delegate = self;
    }
}

- (void)setupVariables
{
    searchRadius = 500; // meters
    
    [self initHandlers];
}

#pragma mark - Get Stations

- (void)getNearbyStations
{
    // 1. Get the users location
    
    NSDictionary *locationInfo = [self getUsersLocation];

    // 2. Get the location
    
    [self getStationsWithLocationAndRadius:searchRadius latitude:locationInfo[@"latitude"] longitude:locationInfo[@"longitude"]];
}

- (NSDictionary*)getUsersLocation
{
    // 1. Get the users location
    
    // 2. Check if they are in london
    
    // 3. Set/Adjust the location as appropriate
    
    NSDictionary *location = @{@"longitude" : @"-0.0856340",
                               @"latitude"  : @"51.5226620"};
    return location;
}

- (void)getStationsWithLocationAndRadius:(NSInteger)radius latitude:(NSString*)latitude longitude:(NSString*)longitude
{
    if (([longitude length] & [latitude length]) > 0) {
 
        [self.stationsHandler getNearbyTubeStationsWithLocationInfo:radius latitude:latitude longitude:longitude];
    }
}

#pragma mark - Station Handler Delegate Methods

- (void)returnStationsFromHandler:(GetStationsHandler*)handler
                         stations:(NSMutableArray*)stations
{
    
}

- (void)returnErrorFromStationsFromHandler:(GetStationsHandler*)handler
                                  stations:(NSMutableArray*)stations
{
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
