//
//  StationsFeedTableViewCell.h
//  StationFinder
//
//  Created by Takomborerwa Mazarura on 16/11/2017.
//  Copyright © 2017 SuperAwesomeInc. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString * const kStationsFeedTableViewCellID;
extern NSString * const kStationsFeedTableViewCellCellNibName;

@interface StationsFeedTableViewCell : UITableViewCell

#pragma mark - Variables

@property (nonatomic, strong) UIView *containerView;

@property (nonatomic, strong) UILabel *stationName;

@property (nonatomic, strong) UILabel *distance;

#pragma mark - Methods

- (void)configureWithStation:(TubeStation*)station;

@end
