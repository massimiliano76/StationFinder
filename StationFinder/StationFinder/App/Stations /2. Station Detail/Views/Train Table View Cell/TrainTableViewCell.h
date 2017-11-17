//
//  TrainTableViewCell.h
//  StationFinder
//
//  Created by Takomborerwa Mazarura on 17/11/2017.
//  Copyright © 2017 SuperAwesomeInc. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString * const kTrainTableViewCellID;
extern NSString * const kTrainTableViewCellNibName;

@interface TrainTableViewCell : UITableViewCell

#pragma mark - Variables

@property (nonatomic, strong) UIView *containerView;

@property (nonatomic, strong) UILabel *trainName;

@property (nonatomic, strong) UILabel *destinationName;

@property (nonatomic, strong) UILabel *expectedArrival;

#pragma mark - Methods

- (void)configureForNil;

- (void)configureForLoading;

- (void)configureWithTrain:(Train*)train;

@end
