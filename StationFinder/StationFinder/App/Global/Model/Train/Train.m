//
//  Train.m
//  StationFinder
//
//  Created by Takomborerwa Mazarura on 17/11/2017.
//  Copyright © 2017 SuperAwesomeInc. All rights reserved.
//

#import "Train.h"

@implementation Train

#pragma mark - Init Object

- (instancetype)initWithTrainDictionary:(NSDictionary *)trainDictionary
{
    if (self = [super init])
    {
        if (trainDictionary.allKeys.count > 0) {
            
            [self setBasicVariablesWithTrainDictionary:trainDictionary];
        }
    }
    
    return self;
}

- (void)setBasicVariablesWithTrainDictionary:(NSDictionary *)trainDictionary
{
    self.lineId             = trainDictionary[@"lineId"];
    
    self.lineName           = trainDictionary[@"lineName"];
    
    self.platformName       = trainDictionary[@"platformName"];

    self.destinationName    = trainDictionary[@"destinationName"];
    
    self.expectedArrival    = trainDictionary[@"expectedArrival"];
    
    self.timeToLive         = trainDictionary[@"timeToLive"];
}

- (NSString*)getExpectedArrival:(NSString*)date
{
    NSString *expectedArrivalFinal = @"";
    
    if (date) {
        
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        
        dateFormat.dateFormat       = @"MM-dd-yyyy HH:mm";
        
        NSDate *arrrival            = [dateFormat dateFromString:date];
        
        expectedArrivalFinal        = [dateFormat stringFromDate:arrrival];
    }
    
    return expectedArrivalFinal;
}

@end
