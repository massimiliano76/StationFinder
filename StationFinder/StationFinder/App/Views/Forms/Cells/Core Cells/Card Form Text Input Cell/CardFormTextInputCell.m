//
//  CardFormTextInputCell.m
//  Haggle Store
//
//  Created by Takomborerwa Mazarura on 13/05/2016.
//  Copyright © 2016 Mixr. All rights reserved.
//

#import "CardFormTextInputCell.h"

@interface CardFormTextInputCell()

@end

@implementation CardFormTextInputCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (!self) return nil;
    
    self.customCellHeight = 60;
    
    self.spaceToNextCell = 0;
    
    self.mandatory = YES;
    
    [BPFormCell setValidImageName:@"icn-onboarding-tick-green" invalidImageName:nil];
    
    self.backgroundColor = [UIColor clearColor];
    
    self.containerView.backgroundColor = [UIColor clearColor];
    
    [self setupSubviews];
    
    return self;
}

- (void)setupSubviews
{
    [self setupContainerView];
    
    [self setupSeparators];
    
    [self setupTheImageViews];
    
    [self setupTheTextField];
}

- (void)setupSeparators
{
    UIView *superview = self.contentView;
    
    UIView *topSeparator = UIView.new;
    
    topSeparator.backgroundColor = [UIColor clearColor];
    
    [superview addSubview:topSeparator];
    
    [topSeparator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superview.mas_top);
        make.left.equalTo(superview.mas_left);
        make.right.equalTo(superview.mas_right);
        make.height.equalTo(@(1.0/[UIScreen mainScreen].scale));
    }];
    
    UIView *bottomSeparator = UIView.new;
    
    bottomSeparator.backgroundColor = [UIColor clearColor];
    
    [superview addSubview:bottomSeparator];
    
    [bottomSeparator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(superview.mas_bottom);
        make.left.equalTo(superview.mas_left);
        make.right.equalTo(superview.mas_right);
        make.height.equalTo(@(1.0/[UIScreen mainScreen].scale));
    }];
}


- (void)setupContainerView
{
    UIView *superview = self.contentView;
    
    self.containerView = UIView.new;
    
    self.containerView.backgroundColor = kAppWhite;
    
    self.containerView.layer.cornerRadius = 4.0f;
    
    self.containerView.layer.masksToBounds = YES;
    
    [superview addSubview:self.containerView];
    
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(0);
        make.left.equalTo(self.mas_left).offset(12);
        make.right.equalTo(self.mas_right).offset(-12);
        make.bottom.equalTo(self.mas_bottom).offset(-12);
    }];
}

- (void)setupTheImageViews
{
    if (!self.theImageView) {
        
        self.theImageView = UIImageView.new;
        
        self.theImageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self.containerView addSubview:self.theImageView];
        
        [self.theImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.containerView.mas_left).offset(22.5);
            make.centerY.equalTo(self.containerView.mas_centerY);
            make.height.equalTo(@25);
            make.width.equalTo(@25);
        }];
        
        if (self.validationImageView) {
            
            [self.validationImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self.containerView.mas_centerY);
                make.right.equalTo(self.containerView.mas_right).offset(-16.5);
                make.width.equalTo(@14);
                make.height.equalTo(@10);
            }];
        }
    }
}

- (void)setupTheTextField
{
    if (!self.textField) {
        
        self.textField = [self createTextField];
        
        [self.containerView addSubview:self.textField];
        
        [self.textField mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.theImageView.mas_right).offset(12.5);
            make.right.equalTo(self.validationImageView.mas_left).offset(-25);
            make.top.equalTo(self.containerView.mas_top);
            make.bottom.equalTo(self.containerView.mas_bottom);
            make.centerY.equalTo(self.containerView.mas_centerY);
        }];
    }
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

@end
