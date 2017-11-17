//
//  CardFormTextInputCell.h
//  Haggle Store
//
//  Created by Takomborerwa Mazarura on 13/05/2016.
//  Copyright © 2016 Mixr. All rights reserved.
//

#import "FormTextInputCell.h"

#import "BPFormInputCell.h"

#import "BPFormFloatInputTextFieldCell.h"

@interface CardFormTextInputCell : BPFormInputCell

@property (nonatomic, strong) UIView *containerView;

@property (nonatomic, strong) UIImageView *theImageView;

@property (nonatomic, strong) UITextField *textField;

@property (nonatomic, strong) UILabel *label;

@property (nonatomic, copy) NSString *nameImageActive;

@property (nonatomic, copy) NSString *nameImageInactive;

- (void)setupTheTextField;

- (void)setupTheImageViews;

- (void)setupContainerView;

@end
