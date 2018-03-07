//
//  GetStationsHandler.m
//  StationFinder
//
//  Created by Takomborerwa Mazarura on 16/11/2017.
//  Copyright © 2017 SuperAwesomeInc. All rights reserved.
//

#import "GetStationsHandler.h"
#import "TubeStation.h"

#define PAGE_COUNT 20

@implementation GetStationsHandler

/**
 Method getNearbyTubeStationsWithLocationDict collects
 nearby stations based on a given longitue and latitude
 
 Example:https://api.tfl.gov.uk/stoppoint?lat=51.5226620&lon=-0.0856340&radius=600&stoptypes=NaptanMetroStation&useStopPointHierarchy=false
 
 See:
 api documentation: https://api.tfl.gov.uk/swagger/ui/index.html?url=/swagger/docs/v1#!/StopPoint/StopPoint_GetByGeoPoint
 search api call: "Gets a list of StopPoints within {radius} by the specified criteria"
 
 Try https://www.getpostman.com to test and run api calls outside of the app
 
 @param radius area that the stations must be in given the longitude and latitide
 @param latitude users location latitude
 @param longitude users location longitude
 */
- (void)getNearbyTubeStationsWithLocationInfo:(NSInteger)radius
                                     latitude:(NSString*)latitude
                                    longitude:(NSString*)longitude
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSString *radiusString  = [NSString stringWithFormat:@"%d", (int)radius];
    
    NSString *lonLatSection = [NSString stringWithFormat:@"?lat=%@&lon=%@", latitude, longitude];
    
    NSString *radiusSection = [NSString stringWithFormat:@"&radius=%@", radiusString];

    NSString *restOfUrl     = @"&stoptypes=NaptanMetroStation&useStopPointHierarchy=false";
    
    NSString *urlString     = [NSString stringWithFormat:@"%@/stoppoint%@%@%@", BASE_API_URL, lonLatSection, radiusSection, restOfUrl];
    
    [manager GET:urlString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
    
        NSDictionary *resultsDictionary = responseObject;
        
        NSArray *resultsArray           = resultsDictionary[@"stopPoints"];
        
        NSMutableArray *resultsFinal    = [self createTubeStationsArray:resultsArray];
        
        [self returnStationsToCaller:resultsFinal];
    
    }failure:^(NSURLSessionTask *operation, NSError *error) {
     
        NSLog(@"Error: %@", error);
        
        NSString *errorMessage = [self createErrorMessageWithError:error];
        
        [self returnErrorToCaller:errorMessage];
        
    }];
}

#pragma mark - Supporting Methods

- (NSMutableArray*)createTubeStationsArray:(NSArray*)results
{
    NSMutableArray *stationsArray = [[NSMutableArray alloc] init];
    
    for (NSDictionary *stationDictionary in results) {
        
        TubeStation *station = [[TubeStation alloc] initWithStationDictionary:stationDictionary];
        
        [stationsArray addObject:station];
    }
    
    return stationsArray;
}

- (NSString *)createErrorMessageWithError:(NSError*)error
{
    NSString *errorMessage = @"Error";
    
    if (error) {
        
        errorMessage = [NSString stringWithFormat:@"Error: %@", error];
    }
    
    return errorMessage;
}

#pragma mark - Station Handler Delegate Method Calls

- (void)returnStationsToCaller:(NSMutableArray*)stations
{
    id <GetStationsHandlerDelegate> strongDelegate = self.delegate;
    
    if ([strongDelegate respondsToSelector:@selector(returnStationsFromHandler:stations:)]) {
        
        [strongDelegate returnStationsFromHandler:self stations:stations];
    }
}

- (void)returnErrorToCaller:(NSString *)errorMessage
{
    id <GetStationsHandlerDelegate> strongDelegate = self.delegate;
    
    if ([strongDelegate respondsToSelector:@selector(returnErrorFromStationsFromHandler:errorMessage:)]) {
        
        [strongDelegate returnErrorFromStationsFromHandler:self errorMessage:errorMessage];
    }
}

@end
