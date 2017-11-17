//
//  Facility.m
//  StationFinder
//
//  Created by Takomborerwa Mazarura on 17/11/2017.
//  Copyright © 2017 SuperAwesomeInc. All rights reserved.
//

#import "Facility.h"

@implementation Facility

#pragma mark - Init Object

- (instancetype)initWithFacilityDictionary:(NSDictionary *)facilityDictionary
{
    self = [super init];
    
    if (self)
    {
        if (facilityDictionary.allKeys.count > 0) {
            
            [self setBasicVariablesWithFacilityDictionary:facilityDictionary];
        }
    }
    
    return self;
}

- (void)setBasicVariablesWithFacilityDictionary:(NSDictionary *)facilityDictionary
{
    self.value      = facilityDictionary[@"value"];
    
    self.key        = facilityDictionary[@"key"];
    
    self.category   = facilityDictionary[@"category"];
    
    self.type       = facilityDictionary[@"type"];
}

@end
