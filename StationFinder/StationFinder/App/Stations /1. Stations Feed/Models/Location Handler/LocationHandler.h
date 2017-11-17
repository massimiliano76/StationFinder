//
//  LocationHandler.h
//  StationFinder
//
//  Created by Takomborerwa Mazarura on 16/11/2017.
//  Copyright © 2017 SuperAwesomeInc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CoreLocation/CoreLocation.h>

@protocol LocationHandlerDelegate;

@interface LocationHandler : NSObject

#pragma mark - Variables

@property (nonatomic, strong) CLLocationManager *locationManager;

@property (nonatomic, strong) id <LocationHandlerDelegate> delegate;

#pragma mark - Methods

- (void)beginCollectingUsersLocation;

- (CLLocation*)getHandlerDefaultLocation;

@end

@protocol LocationHandlerDelegate <NSObject>

@required

- (void)returnLocationFromLocationHandler:(LocationHandler*)handler location:(CLLocation*)location;

@optional

- (void)returnErrorFromLocationHandler:(LocationHandler*)handler errorMessage:(NSString*)errorMessage;

@end
