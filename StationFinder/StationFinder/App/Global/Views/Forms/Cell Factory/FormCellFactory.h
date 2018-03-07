//
//  FormCellFactory.h
//  Impulse
//
//  Created by Takomborerwa Mazarura on 11/07/2015.
//  Copyright (c) 2015 Takomborerwa. All rights reserved.
//

#import <Foundation/Foundation.h>

/** Core Cells **/
#import "FormTextInputCell.h"
#import "CardFormTextInputCell.h"

/** Station Detail Cells **/
#import "CoreStationInfoFormTableViewCell.h"
#import "NextTrainsFormTableViewCell.h"
#import "StationFacilitiesFormTableViewCell.h"

@interface FormCellFactory : NSObject

@property (nonatomic, weak) id <UITextFieldDelegate> delegate;

#pragma mark - Core Cells

- (CardFormTextInputCell*)cardFormTextInputCell;

#pragma mark - Station Detail Cells

- (CoreStationInfoFormTableViewCell*)coreStationInfoFormTableViewCell;

- (NextTrainsFormTableViewCell*)nextTrainsFormTableViewCell;

- (StationFacilitiesFormTableViewCell*)stationFacilitiesFormTableViewCell;

@end

