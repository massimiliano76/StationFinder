//
//  FormViewController.h
//  Impulse
//
//  Created by Takomborerwa Mazarura on 11/07/2015.
//  Copyright (c) 2015 Takomborerwa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"

typedef NS_ENUM(NSInteger, BPFormKeyboardMode) {
    BPFormKeyboardModeAuto      = -1,
    BPFormKeyboardModeDontMove  = 0,
    BPFormKeyboardModeMove      = 1
};

@class BPFormCell;

@interface FormViewController : UIViewController

<UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate, UITextViewDelegate>

/**
 *  This value will determine how high the view will move when a offer is being typed
 *   in a text field within the table view
 **/
@property (nonatomic, assign) BOOL isCreateHaggleOffer;

/**
 *  The table view
 */
@property (nonatomic, strong) UITableView *tableView;

/**
 *  Array of arrays of BPFormCell objects. Each element from the ```formCells``` array is a section, having an array of cells.
 */
@property (nonatomic, strong) NSArray *formCells;

/**
 *  Set this to use a custom height for headers
 */
@property (nonatomic, assign) CGFloat customSectionHeaderHeight;

/**
 *  Set this to use a custom height for footers
 */
@property (nonatomic, assign) CGFloat customSectionFooterHeight;

/**
 *  Set this to manually specify if the form should try to adjust it's size for the keyboard.
 *
 *  By default the form will check if it is in a popover, and let the popover adjust it's size instead of the form view itself.
 */
@property (nonatomic) BPFormKeyboardMode keyboardMode;

/**
 *  Set the header title for a specified section
 *
 *  @param inHeaderTitle the header title
 *  @param inSection     the section
 */
- (void)setHeaderTitle:(NSString *)inHeaderTitle forSection:(int)inSection;

/**
 *  Set the footer title for a specified section
 *
 *  @param inFooterTitle the title
 *  @param inSection     the section
 */
- (void)setFooterTitle:(NSString *)inFooterTitle forSection:(int)inSection;

/**
 *  Checks all the form cells if they are valid
 *
 *  @return YES if all the cells are valid
 */
- (BOOL)allCellsAreValid;

/**
 *  Will return the cell that contains the UI element that is first responder or nil, if none found
 *
 *  @return the cell (or nil)
 */
- (BPFormCell *)cellContainingFirstResponder;

- (void)updateNextButtonIfNeeded;


@end
