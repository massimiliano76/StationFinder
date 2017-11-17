//
//  StationFacilitiesFormTableViewCell.h
//  StationFinder
//
//  Created by Takomborerwa Mazarura on 17/11/2017.
//  Copyright © 2017 SuperAwesomeInc. All rights reserved.
//

#import "CardFormTextInputCell.h"

@protocol StationFacilitiesFormTableViewCellDelegate;

@interface StationFacilitiesFormTableViewCell : CardFormTextInputCell

#pragma mark - Variables

@property (nonatomic, strong) id <StationFacilitiesFormTableViewCellDelegate> delegate;

#pragma mark - Methods

- (void)configureWithStation:(TubeStation*)station;

@end

@protocol StationFacilitiesFormTableViewCellDelegate <NSObject>

@required

@optional

- (void)sendSelectedFaciltyToCaller:(StationFacilitiesFormTableViewCell*)handler facility:(Facility*)facility;

@end
