//
//  TrainTableViewCell.m
//  StationFinder
//
//  Created by Takomborerwa Mazarura on 17/11/2017.
//  Copyright © 2017 SuperAwesomeInc. All rights reserved.
//

#import "TrainTableViewCell.h"

NSString * const kTrainTableViewCellID         = @"TrainTableViewCellId";
NSString * const kTrainTableViewCellNibName    = @"TrainTableViewCellNibName";

@implementation TrainTableViewCell

#pragma mark - Configure View

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
    [self setupContainerView];
    
    [self setupTrainName];
    
    [self setupDestinationName];
    
    [self setupExpectedArrival];
}

- (void)setupContainerView
{
    self.containerView = UIView.new;
    
    self.containerView.clipsToBounds = YES;
    
    self.containerView.backgroundColor = kAppWhite;
    
    self.containerView.layer.borderColor = kAppUltraLightGray.CGColor;

    self.containerView.layer.borderWidth = 1.0f;
    
    self.containerView.layer.masksToBounds = YES;
    
    self.containerView.layer.cornerRadius = 4.0f;
    
    [self addSubview:self.containerView];
    
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(0);
        make.left.equalTo(self.mas_left).offset(0);
        make.right.equalTo(self.mas_right).offset(0);
        make.bottom.equalTo(self.mas_bottom).offset(-GenericDistance);
    }];
}

- (void)setupTrainName
{
    self.trainName = UILabel.new;
    
    self.trainName.textColor = kAppDarkGray;
    
    self.trainName.text = @"Train Name";
    
    self.trainName.font = font(kAppFontBold, 12);
    
    self.trainName.textAlignment = NSTextAlignmentLeft;
    
    self.trainName.numberOfLines = 2;
    
    self.trainName.minimumScaleFactor = 0.5;
    
    self.trainName.adjustsFontSizeToFitWidth = YES;
    
    [self.containerView addSubview:self.trainName];
    
    [self.trainName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.containerView.mas_top).offset(GenericDistance);
        make.left.equalTo(self.containerView.mas_left).offset(GenericDistance);
        make.right.equalTo(self.containerView.mas_right).offset(GenericDistance);
    }];
}

- (void)setupDestinationName
{
    self.destinationName = UILabel.new;
    
    self.destinationName.textColor = kAppDarkGray;
    
    self.destinationName.text = @"Destination";
    
    self.destinationName.font = font(kAppFontRegular, 12);
    
    self.destinationName.textAlignment = NSTextAlignmentLeft;
    
    self.destinationName.numberOfLines = 2;
    
    self.destinationName.minimumScaleFactor = 0.5;
    
    self.destinationName.adjustsFontSizeToFitWidth = YES;
    
    [self.containerView addSubview:self.destinationName];
    
    [self.destinationName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.trainName.mas_bottom).offset(GenericDistance);
        make.left.equalTo(self.containerView.mas_left).offset(GenericDistance);
        make.right.equalTo(self.containerView.mas_right).offset(GenericDistance);
    }];
}

- (void)setupExpectedArrival
{
    self.expectedArrival = UILabel.new;
    
    self.expectedArrival.textColor = kAppDarkGray;
    
    self.expectedArrival.text = @"Expected Arrival";
    
    self.expectedArrival.font = font(kAppFontRegular, 12);
    
    self.expectedArrival.textAlignment = NSTextAlignmentLeft;
    
    self.expectedArrival.numberOfLines = 2;
    
    self.expectedArrival.minimumScaleFactor = 0.5;
    
    self.expectedArrival.adjustsFontSizeToFitWidth = YES;
    
    [self.containerView addSubview:self.expectedArrival];
    
    [self.expectedArrival mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.destinationName.mas_bottom).offset(GenericDistance);
        make.left.equalTo(self.containerView.mas_left).offset(GenericDistance);
        make.right.equalTo(self.containerView.mas_right).offset(GenericDistance);
    }];
}

#pragma mark - Configure View

- (void)configureForLoading
{
    [self configureForNil];
    
    self.trainName.text = @"Loading";
}

- (void)configureForNil
{
    self.trainName.text         = @"";
    
    self.destinationName.text   = @"";
    
    self.expectedArrival.text   = @"";
}

- (void)configureWithTrain:(Train*)train
{
    if (train) {
        
        self.trainName.text         = train.platformName;
        
        self.destinationName.text   = train.destinationName;
        
        self.expectedArrival.text   = train.expectedArrival;
    }
}

@end
