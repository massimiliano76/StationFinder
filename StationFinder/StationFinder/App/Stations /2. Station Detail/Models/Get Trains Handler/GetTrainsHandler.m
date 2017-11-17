//
//  GetTrainsHandler.m
//  TrainFinder
//
//  Created by Takomborerwa Mazarura on 17/11/2017.
//  Copyright © 2017 SuperAwesomeInc. All rights reserved.
//

#import "GetTrainsHandler.h"

@implementation GetTrainsHandler

/**
 Method getNextFewTrainsFromStationWithId collects
 next few trains stations based on a given station Id
 
 Example:https://api.tfl.gov.uk/stoppoint?lat=51.5226620&lon=-0.0856340&radius=600&stoptypes=NaptanMetroStation&useStopPointHierarchy=false
 
 See:
 api documentation: https://api.tfl.gov.uk/stoppoint/940GZZLUODS/Arrivals
 search api call: "Gets the list of arrival predictions for the given stop point id ... GET /StopPoint/{id}/Arrivals"

 @param stationId id of the train station
 */
- (void)getNextFewTrainsFromStationWithId:(NSString*)stationId
{
    if ([stationId length] > 0) {
    
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
     
        NSString *urlString = [NSString stringWithFormat:@"%@/stoppoint/%@/Arrivals", BASE_API_URL, stationId];
        
        [manager GET:urlString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject){
            
            NSArray *resultsArray           = responseObject;
            
            NSMutableArray *resultsFinal    = [self createTrainsArray:resultsArray];
            
            [self returnTrainsToCaller:resultsFinal];
            
        }failure:^(NSURLSessionTask *operation, NSError *error) {
            
            NSLog(@"Error: %@", error);
            
            NSString *errorMessage = [self createErrorMessageWithError:error];
            
            [self returnErrorToCaller:errorMessage];
        }];
    }
}

#pragma mark - Supporting Methods

- (NSMutableArray*)createTrainsArray:(NSArray*)results
{
    NSMutableArray *trainsArray = [[NSMutableArray alloc] init];

    for (NSDictionary *trainDictionary in results) {
        
        Train *station = [[Train alloc] initWithTrainDictionary:trainDictionary];
        
        [trainsArray addObject:station];
    }
    
    return trainsArray;
}

- (NSString *)createErrorMessageWithError:(NSError*)error
{
    NSString *errorMessage = @"Error";
    
    if (error) {
        
        errorMessage = [NSString stringWithFormat:@"Error: %@", error];
    }
    
    return errorMessage;
}
#pragma mark - Train Handler Delegate Method Calls

- (void)returnTrainsToCaller:(NSMutableArray*)trains
{
    id <GetTrainsHandlerDelegate> strongDelegate = self.delegate;
    
    if ([strongDelegate respondsToSelector:@selector(returnTrainsFromHandler:trains:)]) {
        
        [strongDelegate returnTrainsFromHandler:self trains:trains];
    }
}

- (void)returnErrorToCaller:(NSString *)errorMessage
{
    id <GetTrainsHandlerDelegate> strongDelegate = self.delegate;
    
    if ([strongDelegate respondsToSelector:@selector(returnErrorFromTrainsFromHandler:errorMessage:)]) {
        
        [strongDelegate returnErrorFromTrainsFromHandler:self errorMessage:errorMessage];
    }
}

@end
