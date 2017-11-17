//
//  FormCellFactory.m
//  Impulse
//
//  Created by Takomborerwa Mazarura on 11/07/2015.
//  Copyright (c) 2015 Takomborerwa. All rights reserved.
//

#import "FormCellFactory.h"

@implementation FormCellFactory

#pragma mark - Text Input Cells

- (CardFormTextInputCell*)cardFormTextInputCell
{
    return [[CardFormTextInputCell alloc] init];
}

- (CoreStationInfoFormTableViewCell*)coreStationInfoFormTableViewCell
{
    return [[CoreStationInfoFormTableViewCell alloc] init];
}

- (NextTrainsTableViewCell*)nextTrainsTableViewCell
{
    return [[NextTrainsTableViewCell alloc] init];
}

@end
