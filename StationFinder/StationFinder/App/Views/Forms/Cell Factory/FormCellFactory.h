//
//  FormCellFactory.h
//  Impulse
//
//  Created by Takomborerwa Mazarura on 11/07/2015.
//  Copyright (c) 2015 Takomborerwa. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FormTextInputCell.h"
#import "CardFormTextInputCell.h"

#import "CoreStationInfoFormTableViewCell.h"
#import "NextTrainsTableViewCell.h"

@interface FormCellFactory : NSObject

@property (nonatomic, weak) id <UITextFieldDelegate> delegate;

#pragma mark - Basic Text Input Cells

- (CardFormTextInputCell*)cardFormTextInputCell;

- (CoreStationInfoFormTableViewCell*)coreStationInfoFormTableViewCell;

- (NextTrainsTableViewCell*)nextTrainsTableViewCell;

@end

