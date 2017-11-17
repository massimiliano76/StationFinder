//
//  FormCellFactory.m
//  Impulse
//
//  Created by Takomborerwa Mazarura on 11/07/2015.
//  Copyright (c) 2015 Takomborerwa. All rights reserved.
//

#import "FormCellFactory.h"

@implementation FormCellFactory

#pragma mark - Core Cells

- (CardFormTextInputCell*)cardFormTextInputCell
{
    return [[CardFormTextInputCell alloc] init];
}

#pragma mark - Station Detail Cells

- (CoreStationInfoFormTableViewCell*)coreStationInfoFormTableViewCell
{
    return [[CoreStationInfoFormTableViewCell alloc] init];
}

- (NextTrainsFormTableViewCell*)nextTrainsFormTableViewCell
{
    return [[NextTrainsFormTableViewCell alloc] init];
}

- (StationFacilitiesFormTableViewCell*)stationFacilitiesFormTableViewCell
{
    return [[StationFacilitiesFormTableViewCell alloc] init];
}

@end
