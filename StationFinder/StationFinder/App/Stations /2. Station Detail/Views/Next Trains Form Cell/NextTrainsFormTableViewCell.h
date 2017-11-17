//
//  NextTrainsFormTableViewCell.h
//  StationFinder
//
//  Created by Takomborerwa Mazarura on 17/11/2017.
//  Copyright © 2017 SuperAwesomeInc. All rights reserved.
//

#import "CardFormTextInputCell.h"

@protocol NextTrainsFormTableViewCellDelegate;

@interface NextTrainsFormTableViewCell : CardFormTextInputCell

- (void)configureWithStation:(TubeStation*)station;

@end

@protocol NextTrainsFormTableViewCellDelegate <NSObject>

@required

@optional

- (void)trainsReloaded:(NextTrainsFormTableViewCell*)handler;

@end
