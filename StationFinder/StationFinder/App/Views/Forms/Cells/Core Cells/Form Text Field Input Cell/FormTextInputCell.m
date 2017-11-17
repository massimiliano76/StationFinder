//
//  FormTextInputCell.m
//  Mixr
//
//  Created by Takomborerwa Mazarura on 11/07/2015.
//  Copyright (c) 2015 Takomborerwa. All rights reserved.
//

#import "FormTextInputCell.h"

@interface FormTextInputCell()
@property (nonatomic, strong) UIImageView *theImageView;
@end

@implementation FormTextInputCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) return nil;
    
    self.customCellHeight = 45;
    self.spaceToNextCell = 0;
    self.mandatory = YES;
    [BPFormCell setValidImageName:@"icn-onboarding-tick-green" invalidImageName:nil];
    [self setupSubviews];
    
    return self;
}

- (void)setupSubviews
{
    UIView *superview = self.contentView;
    
    self.theImageView = UIImageView.new;
    self.theImageView.contentMode = UIViewContentModeScaleAspectFit;
    [superview addSubview:self.theImageView];
    
    self.textField = [self createTextField];
    [superview addSubview:self.textField];
    
    UIView *topSeparator = UIView.new;
    topSeparator.backgroundColor = kAppMediumLightGray;
    [superview addSubview:topSeparator];
    
    [topSeparator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superview.mas_top);
        make.left.equalTo(superview.mas_left);
        make.right.equalTo(superview.mas_right);
        make.height.equalTo(@(1.0/[UIScreen mainScreen].scale));
    }];
    
    [self.theImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(superview.mas_left).offset(18);
        make.centerY.equalTo(superview.mas_centerY);
        make.height.equalTo(@25);
        make.width.equalTo(@25);
    }];
    
    [self.validationImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(superview.mas_centerY);
        make.right.equalTo(superview.mas_right).offset(-16.5);
        make.width.equalTo(@14);
        make.height.equalTo(@10);
    }];
    
    [self.textField mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.theImageView.mas_right).offset(25);
        make.right.equalTo(self.validationImageView.mas_left).offset(-25);
        make.top.equalTo(superview.mas_top);
        make.bottom.equalTo(superview.mas_bottom);
        make.centerY.equalTo(superview.mas_centerY);
    }];
}

- (UITextField *)createTextField
{
    UITextField *textField = UITextField.new;
    
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textField.textColor = kAppDarkGray;
    textField.font = font(kAppFontRegular, 19);
    textField.textColor = kAppDarkGray;
    textField.backgroundColor = [UIColor clearColor];
    
    return textField;
}

- (void)updateAccordingToValidationState
{
    [super updateAccordingToValidationState];
    
    switch (self.validationState) {
        case BPFormValidationStateValid:
            self.theImageView.image = [UIImage imageNamed:self.nameImageActive];
            break;
        case BPFormValidationStateInvalid:
            self.theImageView.image = [UIImage imageNamed:self.nameImageInactive];
            break;
        case BPFormValidationStateNone:
            self.theImageView.image = [UIImage imageNamed:self.nameImageInactive];
            break;
    }
}

@end
