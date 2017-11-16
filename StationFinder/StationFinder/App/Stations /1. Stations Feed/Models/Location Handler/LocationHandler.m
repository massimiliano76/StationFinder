//
//  LocationHandler.m
//  StationFinder
//
//  Created by Takomborerwa Mazarura on 16/11/2017.
//  Copyright © 2017 SuperAwesomeInc. All rights reserved.
//

#import "LocationHandler.h"

@interface LocationHandler () <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocation *defaultLocation; // Center of London

@end

@implementation LocationHandler

- (id)init
{
    if (self = [super init]) {
        
        [self setupLocationManager];
        
        [self setTheDefaultLocation];
    }
    
    return self;
}

- (void)setupLocationManager
{
    if (!self.locationManager) {
        
        self.locationManager                    = [[CLLocationManager alloc] init];
        
        self.locationManager.delegate           = self;
    
        self.locationManager.desiredAccuracy    = kCLLocationAccuracyBest;
    }
}

- (void)setTheDefaultLocation
{
   self.defaultLocation = [[CLLocation alloc] initWithLatitude:51.507351051 longitude:-0.12775800];
}

- (void)beingCollectingUsersLocation
{
    [self.locationManager startUpdatingLocation];
}

- (void)stopCollectingUsersLocation
{
    [self.locationManager stopUpdatingLocation];
}

- (CLLocation*)getHandlerDefaultLocation
{
    return self.defaultLocation;
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    [self stopCollectingUsersLocation];
    
    NSLog(@"Failed To Collect Location With Error: %@", error);

    NSString *message = [NSString stringWithFormat:@"We were unable to collect your location. So the default London Location is being used: %@", error];
    
    [self returnErrorToCaller:message];

    [self sendBackLocation:self.defaultLocation];
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    [self stopCollectingUsersLocation];
    
    NSLog(@"New Location Collected: %@", newLocation);
    
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
    
        [self handleAndSendLocationToCaller:currentLocation];
    
    }else{
        
        [self sendBackLocation:self.defaultLocation];
    }
}

#pragma mark - Supporting Methods

- (void)handleAndSendLocationToCaller:(CLLocation *)currentLocation
{
    CLGeocoder *geocoder = [[CLGeocoder alloc] init] ;
 
    [geocoder reverseGeocodeLocation:currentLocation
                   completionHandler:^(NSArray *placemarks, NSError *error)
     {
         if (error){
             
             NSLog(@"Failed To Collect City Info With CLGeocoder ... error: %@", error);
             
             [self sendBackLocation:self.defaultLocation];
             
         }else{
             
             CLPlacemark *placemark = [placemarks objectAtIndex:0];
             
             NSLog(@"Country Name: %@", placemark.ISOcountryCode);
             
             NSLog(@"City Name: %@", placemark.locality);
             
             if ([placemark.locality isEqualToString:@"London"] && [placemark.ISOcountryCode isEqualToString:@"GB"]) {
                 
                 [self sendBackLocation:currentLocation];
             
             }else{

                 [self sendBackLocation:self.defaultLocation];
             }
         }
     }];
}

#pragma mark - Location Handler Delegate Method Calls

- (void)sendBackLocation:(CLLocation*)currentLocation
{
    id <LocationHandlerDelegate> strongDelegate = self.delegate;
    
    if ([strongDelegate respondsToSelector:@selector(returnLocationFromLocationHandler:location:)]) {
        
        [strongDelegate returnLocationFromLocationHandler:self location:currentLocation];
    }
}

- (void)returnErrorToCaller:(NSString *)errorMessage
{
    id <LocationHandlerDelegate> strongDelegate = self.delegate;
    
    if ([strongDelegate respondsToSelector:@selector(returnErrorFromLocationHandler:errorMessage:)]) {
        
        [strongDelegate returnErrorFromLocationHandler:self errorMessage:errorMessage];
    }
}

@end
