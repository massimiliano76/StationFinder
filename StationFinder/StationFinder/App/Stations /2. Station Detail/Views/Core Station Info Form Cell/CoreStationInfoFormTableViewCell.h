//
//  CoreStationInfoFormTableViewCell.h
//  StationFinder
//
//  Created by Takomborerwa Mazarura on 17/11/2017.
//  Copyright © 2017 SuperAwesomeInc. All rights reserved.
//

#import "CardFormTextInputCell.h"

@interface CoreStationInfoFormTableViewCell : CardFormTextInputCell

- (void)configureWithStation:(TubeStation*)station;

@end
