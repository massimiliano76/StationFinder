//
//  TubeStation.h
//  StationFinder
//
//  Created by Takomborerwa Mazarura on 16/11/2017.
//  Copyright © 2017 SuperAwesomeInc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TubeStation : NSObject

@property (nonatomic, readwrite) NSInteger distance;

@property (nonatomic, readwrite) NSString *name;

@property (nonatomic, readwrite) NSString *stationId;

@property (nonatomic, readwrite) NSMutableArray *facilities;

- (instancetype)initWithStationDictionary:(NSDictionary *)stationDictionary;

@end
