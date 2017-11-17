//
//  StationsFeedTableViewCell.m
//  StationFinder
//
//  Created by Takomborerwa Mazarura on 16/11/2017.
//  Copyright © 2017 SuperAwesomeInc. All rights reserved.
//

#import "StationsFeedTableViewCell.h"

#import "CoreStationInfoView.h"

NSString * const kStationsFeedTableViewCellID           = @"StationsFeedTableViewCellId";
NSString * const kStationsFeedTableViewCellCellNibName  = @"StationsFeedTableViewCellNibName";

@interface StationsFeedTableViewCell ()

@property (nonatomic, strong) CoreStationInfoView *coreStationInfoView;

@end

@implementation StationsFeedTableViewCell

#pragma mark - Configure View (Private)

- (id)initWithStyle:(UITableViewCellStyle)style
    reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (!self) return nil;
    
    [self setupView];
    
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self setupView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void)setupView
{
    [self setupMainView];
    
    [self setupSubviews];
}

- (void)setupMainView
{
    [self setBackgroundColor:[UIColor clearColor]];
}

- (void)setupSubviews
{
    [self setupCoreStationInfoView];
}

- (void)setupCoreStationInfoView
{
    self.coreStationInfoView = [[CoreStationInfoView alloc] initWithFrame:self.frame];
    
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
