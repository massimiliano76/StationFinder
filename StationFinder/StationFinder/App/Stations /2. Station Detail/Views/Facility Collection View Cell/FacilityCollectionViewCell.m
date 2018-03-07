//
//  FacilityCollectionViewCell.m
//  StationFinder
//
//  Created by Takomborerwa Mazarura on 17/11/2017.
//  Copyright © 2017 SuperAwesomeInc. All rights reserved.
//

#import "FacilityCollectionViewCell.h"

NSString * const kFacilityCollectionViewCellID = @"FacilityCollectionViewCellId";
NSString * const kFacilityCollectionViewCellNibName = @"FacilityCollectionViewCell";

@implementation FacilityCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self){
        
        [self setupMainView];
        
        [self initializeSubviews];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if (self)
        
        [self setupMainView];
    
        [self initializeSubviews];
    
    return self;
}

- (void)awakeFromNib {
    
    [super awakeFromNib];
    
    [self setupMainView];
    
    [self initializeSubviews];
}

#pragma mark - View Configuration (private)

- (void)setupMainView
{
    self.clipsToBounds      = YES;
    
    self.layer.masksToBounds= YES;
    
    self.layer.cornerRadius = 4.0f;
    
    self.layer.borderWidth  = 1.0f;
    
    self.layer.borderColor  = kAppUltraLightGray.CGColor;
    
    self.backgroundColor    = kAppUltraLightGray;
}

- (void)initializeSubviews
{
    [self setupNameLabel];
}

- (void)setupNameLabel
{
    self.facilityNameLabel.textColor = kAppDarkGray;
    
    self.facilityNameLabel.text = @"Facility";
    
    self.facilityNameLabel.font = font(kAppFontRegular, 12);
    
    self.facilityNameLabel.textAlignment = NSTextAlignmentLeft;
    
    self.facilityNameLabel.numberOfLines = 1;
    
    self.facilityNameLabel.adjustsFontSizeToFitWidth = NO;
}

#pragma mark - Configure View With Data

- (void)configureWithFacility:(Facility*)facility
{
    if (facility) {
        
        self.facilityNameLabel.text = facility.name;
    }
}

- (void)configureForLoading
{
    self.facilityNameLabel.text = @"Loading";
}

- (void)configureForSelected:(BOOL)isSelected
{
    if (isSelected) {
        
        self.backgroundColor    = kAppGreen;
        
    }else{
        
        self.backgroundColor    = kAppUltraLightGray;
    }
}
@end
