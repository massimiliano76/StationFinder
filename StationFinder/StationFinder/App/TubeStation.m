//
//  TubeStation.m
//  StationFinder
//
//  Created by Takomborerwa Mazarura on 16/11/2017.
//  Copyright © 2017 SuperAwesomeInc. All rights reserved.
//

#import "TubeStation.h"

@implementation TubeStation

#pragma mark - Init Object 

- (instancetype)initWithStationDictionary:(NSDictionary *)stationDictionary
{
    self = [super init];
    
    if (self)
    {
        if (stationDictionary.allKeys.count > 0) {
         
            [self setBasicVariablesWithStationDictionary:stationDictionary];
        }
    }
    
    return self;
}

- (void)setBasicVariablesWithStationDictionary:(NSDictionary *)stationDictionary
{
    self.distance       = [stationDictionary[@"distance"] integerValue];
    
    self.staionNaptanId = stationDictionary[@"naptanId"];
    
    self.name           = stationDictionary[@"commonName"];

}

- (void)setFacilitiesArrayWithStationDictionary:(NSDictionary *)stationDictionary
{
    
}

@end
