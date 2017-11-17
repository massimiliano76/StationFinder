//
//  CoreStationInfoFormTableViewCell.m
//  StationFinder
//
//  Created by Takomborerwa Mazarura on 17/11/2017.
//  Copyright © 2017 SuperAwesomeInc. All rights reserved.
//

#import "CoreStationInfoFormTableViewCell.h"

#import "CoreStationInfoView.h"

@interface CoreStationInfoFormTableViewCell ()
{
    CGFloat cellHeight;
}

@property (nonatomic, strong) CoreStationInfoView *coreStationInfoView;

@end

@implementation CoreStationInfoFormTableViewCell

- (id)init
{
    self = [super init];
    
    if (!self) return nil;
    
    [self setupVariables];
    
    [self setupMainView];
    
    [self initializeSubviews];
    
    return self;
}

#pragma mark - Setup Variables

- (void)setupVariables
{
    cellHeight              = 100;
    
    self.mandatory          = YES;
    
    self.spaceToNextCell    = 5;
    
    self.customCellHeight   = cellHeight;
}

- (void)setupMainView
{
    self.backgroundColor    = [UIColor clearColor];
    
    self.nameImageActive    = @"";
    
    self.nameImageInactive  = @"";
    
    self.clipsToBounds      = YES;
    
    self.textField.enabled  = NO;
    
    self.textField.hidden   = YES;
}

- (void)initializeSubviews
{
    [self setupCoreStationInfoView];
}

- (void)setupCoreStationInfoView
{
    CGRect frame = CGRectMake(0, 0, self.frame.size.width, cellHeight);
    
    self.coreStationInfoView = [[CoreStationInfoView alloc] initWithFrame:frame];
    
    [self addSubview:self.coreStationInfoView];
    
    [self.coreStationInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(self.mas_bottom);
    }];
}

#pragma mark - Configure View

- (void)configureWithStation:(TubeStation*)station
{
    if (station && self.coreStationInfoView) {
        
        [self.coreStationInfoView configureWithStation:station];
    }
}

@end
