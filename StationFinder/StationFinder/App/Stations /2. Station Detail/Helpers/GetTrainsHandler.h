//
//  GetTrainsHandler.h
//  StationFinder
//
//  Created by Takomborerwa Mazarura on 17/11/2017.
//  Copyright © 2017 SuperAwesomeInc. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GetTrainsHandlerDelegate;

@interface GetTrainsHandler : NSObject

#pragma mark - Variables

@property (nonatomic, strong) id <GetTrainsHandlerDelegate> delegate;

#pragma mark - Methods

- (void)getNearbyTubeStationsWithLocationInfo:(NSInteger)radius
                                     latitude:(NSString*)latitude
                                    longitude:(NSString*)longitude;

@end

@protocol GetTrainsHandlerDelegate  <NSObject>

@required

- (void)returnTrainsFromHandler:(GetTrainsHandler*)handler trains:(NSMutableArray*)trains;

@optional

- (void)returnErrorFromTrainsFromHandler:(GetTrainsHandler*)handler errorMessage:(NSString*)errorMessage;

@end
