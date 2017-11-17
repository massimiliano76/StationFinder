//
//  CoreStationInfoView.h
//  StationFinder
//
//  Created by Takomborerwa Mazarura on 17/11/2017.
//  Copyright © 2017 SuperAwesomeInc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoreStationInfoView : UIView

#pragma mark - Variables

@property (nonatomic, strong) UIView *containerView;

@property (nonatomic, strong) UILabel *stationName;

@property (nonatomic, strong) UILabel *distance;

#pragma mark - Methods

- (void)configureForNil;

- (void)configureWithStation:(TubeStation*)station;

- (void)configureWithTrainTime:(TubeStation*)station;

@end
