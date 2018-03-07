//
//  Facility.h
//  StationFinder
//
//  Created by Takomborerwa Mazarura on 17/11/2017.
//  Copyright © 2017 SuperAwesomeInc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Facility : NSObject

@property (nonatomic, readwrite) NSString *value;

@property (nonatomic, readwrite) NSString *name;

@property (nonatomic, readwrite) NSString *category;

@property (nonatomic, readwrite) NSString *type;

- (instancetype)initWithFacilityDictionary:(NSDictionary *)facilityDictionary;

@end
