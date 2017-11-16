//
//  GetStationsHandler.m
//  StationFinder
//
//  Created by Takomborerwa Mazarura on 16/11/2017.
//  Copyright © 2017 SuperAwesomeInc. All rights reserved.
//

#import "GetStationsHandler.h"

#define PAGE_COUNT 20
#define BASE_API_URL @"https://api.tfl.gov.uk"
#define TFL_API_KEY @"d4b5fef8d4a146b95ea4e6689ac97853"
#define TFL_APPLICATION_ID @"7ca3324a"

@implementation GetStationsHandler

/**
 Method getNearbyTubeStationsWithLocationDict collects
     nearby stations based on a given longitue and latitude
 
 Example:https://api.tfl.gov.uk/stoppoint?lat=51.5226620&lon=-0.0856340&radius=600&stoptypes=NaptanMetroStation&useStopPointHierarchy=false
 
 See:
     api documentation: https://api.tfl.gov.uk/swagger/ui/index.html?url=/swagger/docs/v1#!/StopPoint/StopPoint_GetByGeoPoint
     search api call: "Gets a list of StopPoints within {radius} by the specified criteria"
 
 @param locationDictionary contains location longitue and latitude
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
    
    NSDictionary *parameters= @{@"app_key": TFL_API_KEY,
                                @"app_id": TFL_APPLICATION_ID};
    
    [manager GET:urlString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
    
        NSLog(@"JSON: %@", responseObject);
    
    }failure:^(NSURLSessionTask *operation, NSError *error) {
     
        NSLog(@"Error: %@", error);
    }];
}

- (void)returnStationsToCaller:(NSMutableArray*)stations
{
    id <GetStationsHandlerDelegate> strongDelegate = self.delegate;
    
    if ([strongDelegate respondsToSelector:@selector(returnStationsFromHandler:stations:)]) {
        
        [strongDelegate returnStationsFromHandler:self stations:stations];
    }
}

@end
