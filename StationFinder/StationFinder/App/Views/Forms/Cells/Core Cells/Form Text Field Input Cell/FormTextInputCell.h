//
//  FormTextInputCell.h
//  Mixr
//
//  Created by Takomborerwa Mazarura on 11/07/2015.
//  Copyright (c) 2015 Takomborerwa. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BPFormInputCell.h"

#import "BPFormFloatInputTextFieldCell.h"

@interface FormTextInputCell : BPFormInputCell

@property (nonatomic, strong) UITextField *textField;

@property (nonatomic, strong) UILabel *label;

@property (nonatomic, copy) NSString *nameImageActive;

@property (nonatomic, copy) NSString *nameImageInactive;

@end
