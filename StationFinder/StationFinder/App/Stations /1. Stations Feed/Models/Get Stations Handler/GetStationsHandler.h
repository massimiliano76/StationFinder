//
//  GetStationsHandler.h
//  StationFinder
//
//  Created by Takomborerwa Mazarura on 16/11/2017.
//  Copyright © 2017 SuperAwesomeInc. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GetStationsHandlerDelegate;

@interface GetStationsHandler : NSObject

#pragma mark - Variables

@property (nonatomic, strong) id <GetStationsHandlerDelegate> delegate;

#pragma mark - Methods

- (void)getNearbyTubeStationsWithLocationInfo:(NSInteger)radius
                                     latitude:(NSString*)latitude
                                    longitude:(NSString*)longitude;

@end

@protocol GetStationsHandlerDelegate <NSObject>

@required

- (void)returnStationsFromHandler:(GetStationsHandler*)handler stations:(NSMutableArray*)stations;

- (void)returnErrorFromStationsFromHandler:(GetStationsHandler*)handler errorMessage:(NSString*)errorMessage;

@optional

@end
