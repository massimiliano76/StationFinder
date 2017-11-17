//
//  FacilityCollectionViewCell.h
//  StationFinder
//
//  Created by Takomborerwa Mazarura on 17/11/2017.
//  Copyright © 2017 SuperAwesomeInc. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString * const kFacilityCollectionViewCellID;
extern NSString * const kFacilityCollectionViewCellNibName;

@interface FacilityCollectionViewCell : UICollectionViewCell

#pragma mark - Variables

@property (weak, nonatomic) IBOutlet UILabel *facilityNameLabel;

#pragma mark - Methods

- (void)configureForLoading;

- (void)configureForSelected:(BOOL)isSelected;

- (void)configureWithFacility:(Facility*)facility;

@end
