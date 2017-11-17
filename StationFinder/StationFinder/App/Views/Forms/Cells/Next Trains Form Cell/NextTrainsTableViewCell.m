//
//  NextTrainsTableViewCell.m
//  StationFinder
//
//  Created by Takomborerwa Mazarura on 17/11/2017.
//  Copyright © 2017 SuperAwesomeInc. All rights reserved.
//
//  In the future this should be a table view ... i should have just done that the first time round smh ... i really hate how much i repeated myself

#import "NextTrainsTableViewCell.h"

#import "CoreStationInfoView.h"

@interface NextTrainsTableViewCell ()
{
    CGFloat cellHeight;
    
    CGFloat trainViewHeight;
}

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) CoreStationInfoView *trainOne;

@property (nonatomic, strong) CoreStationInfoView *trainTwo;

@property (nonatomic, strong) CoreStationInfoView *trainThree;

@end

@implementation NextTrainsTableViewCell

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
    cellHeight              = 275;
    
    trainViewHeight         = 75;
    
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
    [self setupContainerView];
    
    [self setupTitleLabel];
    
    [self setupTrainOne];
    
    [self setupTrainTwo];
    
    [self setupTrainThree];
}

- (void)setupContainerView
{
    self.containerView = UIView.new;
    
    self.containerView.backgroundColor = kAppWhite;
    
    self.containerView.clipsToBounds = YES;
    
    self.containerView.layer.masksToBounds = YES;
    
    self.containerView.layer.cornerRadius = 4.0f;
    
    [self addSubview:self.containerView];
    
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(0);
        make.left.equalTo(self.mas_left).offset(GenericDistance);
        make.right.equalTo(self.mas_right).offset(-GenericDistance);
        make.bottom.equalTo(self.mas_bottom).offset(-GenericDistance);
    }];
}
- (void)setupTitleLabel
{
    self.titleLabel = UILabel.new;
    
    self.titleLabel.textColor = kAppDarkGray;
    
    self.titleLabel.text = @"Next 3 Trains From Station";
    
    self.titleLabel.font = font(kAppFontBold, 12);
    
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    
    self.titleLabel.numberOfLines = 2;
    
    self.titleLabel.minimumScaleFactor = 0.5;
    
    self.titleLabel.adjustsFontSizeToFitWidth = YES;
    
    [self addSubview:self.titleLabel];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.containerView.mas_top).offset(GenericDistance);
        make.left.equalTo(self.containerView.mas_left).offset(GenericDistance);
        make.right.equalTo(self.containerView.mas_right).offset(-GenericDistance);
    }];
}

- (void)setupTrainOne
{
    self.trainOne = [[CoreStationInfoView alloc] initWithFrame:self.frame];
    
    [self.trainOne configureForNil];
    
    [self addSubview:self.trainOne];
    
    [self.trainOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(GenericDistance / 2);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.height.equalTo(@(trainViewHeight));
    }];
}

- (void)setupTrainTwo
{
    self.trainTwo = [[CoreStationInfoView alloc] initWithFrame:self.frame];
    
    [self.trainTwo configureForNil];
    
    [self addSubview:self.trainTwo];
    
    [self.trainTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.trainOne.mas_bottom).offset(GenericDistance / 2);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.height.equalTo(@(trainViewHeight));
    }];
}

- (void)setupTrainThree
{
    self.trainThree = [[CoreStationInfoView alloc] initWithFrame:self.frame];
    
    [self.trainThree configureForNil];
    
    [self addSubview:self.trainThree];
    
    [self.trainThree mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.trainTwo.mas_bottom).offset(GenericDistance / 2);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.height.equalTo(@(trainViewHeight));
    }];
}

#pragma mark - Configure View

- (void)configureWithStation:(TubeStation*)station
{
    if (station) {
        
    }
}


@end
