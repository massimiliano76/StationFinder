//
//  Train.h
//  StationFinder
//
//  Created by Takomborerwa Mazarura on 17/11/2017.
//  Copyright © 2017 SuperAwesomeInc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Train : NSObject

@property (nonatomic, readwrite) NSString *lineId;

@property (nonatomic, readwrite) NSString *lineName;

@property (nonatomic, readwrite) NSString *platformName;

@property (nonatomic, readwrite) NSString *destinationName;

@property (nonatomic, readwrite) NSString *expectedArrival;

@property (nonatomic, readwrite) NSString *timeToLive;

- (instancetype)initWithTrainDictionary:(NSDictionary *)trainDictionary;

@end
