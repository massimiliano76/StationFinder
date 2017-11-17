//
//  VariableUtils.h
//  Mixr
//
//  Created by Takomborerwa Mazarura on 07/01/2016.
//  Copyright © 2016 Mixr. All rights reserved.
//

#import <Foundation/Foundation.h>

/** Colour Scheme Colours **/

#define kAppWhite ([UIColor colorFromHexString:@"FFFFFF"])

#define kAppBlack ([UIColor colorFromHexString:@"000000"])

#define kAppDarkGray ([UIColor colorFromHexString:@"333333"])

#define kAppLightGray ([UIColor colorFromHexString:@"F3F3F3"])

#define kAppMediumLightGray ([UIColor colorFromHexString:@"E8E6E3"])

#define kAppUltraLightGray ([UIColor colorFromHexString:@"FAFAFA"])

#define kAppMainBlue ([UIColor colorFromHexString:@"42B0F9"])

#define kAppGreen ([UIColor colorFromHexString:@"96D35F"])

/** Fonts **/

// Light

static NSString * const kAppFontLight = @"FuturaBT-Light";
static NSString * const kAppFontLightItalic = @"FuturaBT-LightItalic";
static NSString * const kAppFontCondensedLight = @"Futura-CondensedLight";

// Regular

static NSString * const kAppFontRegular = @"Futura";

// Medium

static NSString * const kAppFontMedium = @"FuturaBT-Medium";
static NSString * const kAppFontMediumItalic = @"FuturaBT-MediumItalic";
static NSString * const kAppFontMediumCondensed = @"FuturaBT-MediumCondensed";

// Book

static NSString * const kAppFontBook = @"FuturaBT-Book";
static NSString * const kAppFontBookItalic = @"FuturaBT-BookItalic";

// Bold

static NSString * const kAppFontBold = @"Futura-Bold";
static NSString * const kAppFontBoldItalic = @"Futura-BoldItalic";
static NSString * const kAppFontCondensedBold = @"Futura-CondensedExtraBold";

// Heavy

static NSString * const kAppFontExtraHeavy = @"FuturaBT-Heavy";
static NSString * const kAppFontExtraHeavyItalic = @"FuturaBT-HeavyItalic";

// Black

static NSString * const kAppFontExtraBlack = @"FuturaBT-ExtraBlack";
static NSString * const kAppFontExtraBlackCondensedItalic = @"FuturaBT-ExtraBlackCondItalic";


// Helventica

static NSString * const kHelveticaNeueRegular = @"HelveticaNeue";

static NSString * const kHelveticaNeueMedium = @"HelveticaNeue-Medium";
static NSString * const kHelveticaNeueMediumItalic = @"HelveticaNeue-MediumItalic";

static NSString * const kHelveticaNeueLight = @"HelveticaNeue-Light";
static NSString * const kHelveticaNeueLightItalic = @"HelveticaNeue-LightItalic";

static NSString * const kHelveticaNeueUltraLight = @"HelveticaNeue-UltraLight";
static NSString * const kHelveticaNeueUltraLightItalic = @"HelveticaNeue-UltraLightItalic";

static NSString * const kHelveticaNeueThin = @"HelveticaNeue-Thin";
static NSString * const kHelveticaNeueThinItalic = @"HelveticaNeue-ThinItalic";

static NSString * const kHelveticaNeueBold = @"HelveticaNeue-Bold";
static NSString * const kHelveticaNeueBoldItalic = @"HelveticaNeue-BoldItalic";

static NSString * const kHelveticaNeueCondensedBlack = @"HelveticaNeue-CondensedBlack";
static NSString * const kHelveticaNeueCondensedBold = @"HelveticaNeue-CondensedBold";

#define font(_name_, _size_) ((UIFont *)[UIFont fontWithName:(NSString *)(_name_) size:(CGFloat)(_size_)])

/** String: Identifier **/
#define DEVICE_IDENTIFIER ( ( IS_IPAD ) ? DEVICE_IPAD : ( IS_IPHONE ) ? DEVICE_IPHONE , DEVICE_SIMULATOR )

/** String: iPhone **/
#define DEVICE_IPHONE @"iPhone"

/** String: iPad **/
#define DEVICE_IPAD @"iPad"

/** String: Device Model **/
#define DEVICE_MODEL ( [[UIDevice currentDevice ] model ] )

/** String: Localized Device Model **/
#define DEVICE_MODEL_LOCALIZED ( [[UIDevice currentDevice ] localizedModel ] )

/** String: Device Name **/
#define DEVICE_NAME ( [[UIDevice currentDevice ] name ] )

/** Double: Device Orientation **/
#define DEVICE_ORIENTATION ( [[UIDevice currentDevice ] orientation ] )

/** String: Simulator **/
#define DEVICE_SIMULATOR @"Simulator"

/** BOOL: Detect if device is an iPad **/
#define IS_IPAD ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )

/** BOOL: Detect if device is an iPhone or iPod **/
#define IS_IPHONE ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone )

/** BOOL: Detect if device is an iPhone 4 **/
#define IS_IPHONE_4 ( IS_IPHONE ? CGSizeEqualToSize([[UIScreen mainScreen] preferredMode].size,CGSizeMake(640, 960)) ? YES : NO : NO )

/** BOOL: Detect if device is an iPhone 5 **/
#define IS_IPHONE_5 ( IS_IPHONE ? CGSizeEqualToSize([[UIScreen mainScreen] preferredMode].size,CGSizeMake(640, 1136)) ? YES : NO : NO )

/** BOOL: Detect if device is an iPhone 6 **/
#define IS_IPHONE_6 ( IS_IPHONE ? CGSizeEqualToSize([[UIScreen mainScreen] preferredMode].size,CGSizeMake(750, 1334)) ? YES : NO : NO )

/** BOOL: Detect if device is an iPhone 6 Plus **/
#define IS_IPHONE_6_PLUS ( IS_IPHONE ? CGSizeEqualToSize([[UIScreen mainScreen] preferredMode].size,CGSizeMake(1242, 2208)) ? YES : NO : NO )

/** BOOL: Detect if device is an iPhone X **/
#define IS_IPHONE_X ( IS_IPHONE ? CGSizeEqualToSize([[UIScreen mainScreen] preferredMode].size,CGSizeMake(1125, 2436)) ? YES : NO : NO )

/** BOOL: IS_RETINA **/
#define IS_RETINA ( [[UIScreen mainScreen] respondsToSelector:@selector(scale)] && [[UIScreen mainScreen] scale] == 2 )

/** BOOL: Detect if device is the Simulator **/
#define IS_SIMULATOR ( TARGET_IPHONE_SIMULATOR )

#define ApplicationDelegate                 ((AppDelegate *)[[UIApplication sharedApplication] delegate])
#define UserDefaults                        [NSUserDefaults standardUserDefaults]
#define NotificationCenter                  [NSNotificationCenter defaultCenter]
#define SharedApplication                   [UIApplication sharedApplication]
#define Bundle                              [NSBundle mainBundle]
#define MainScreen                          [UIScreen mainScreen]
#define ShowNetworkActivityIndicator()      [UIApplication sharedApplication].networkActivityIndicatorVisible = YES
#define HideNetworkActivityIndicator()      [UIApplication sharedApplication].networkActivityIndicatorVisible = NO
#define NetworkActivityIndicatorVisible(x)  [UIApplication sharedApplication].networkActivityIndicatorVisible = x
#define NavBar                              self.navigationController.navigationBar
#define TabBar                              self.tabBarController.tabBar
#define NavBarHeight                        self.navigationController.navigationBar.bounds.size.height
#define TabBarHeight                        self.tabBarController.tabBar.bounds.size.height
#define ScreenWidth                         [[UIScreen mainScreen] bounds].size.width
#define GenericDistance                     12
#define ScreenHeight                        [[UIScreen mainScreen] bounds].size.height
#define SliderImageViewHeight               ScreenHeight / 10 * 8.0
#define SliderImageViewWidth                ScreenWidth / 10 * 8.0
#define TouchHeightDefault                  44
#define TouchHeightSmall                    32
#define ViewWidth(v)                        v.frame.size.width
#define ViewHeight(v)                       v.frame.size.height
#define ViewX(v)                            v.frame.origin.x
#define ViewY(v)                            v.frame.origin.y
#define SelfViewWidth                       self.view.bounds.size.width
#define SelfViewHeight                      self.view.bounds.size.height
#define RectX(f)                            f.origin.x
#define RectY(f)                            f.origin.y
#define RectWidth(f)                        f.size.width
#define RectHeight(f)                       f.size.height
#define RectSetWidth(f, w)                  CGRectMake(RectX(f), RectY(f), w, RectHeight(f))
#define RectSetHeight(f, h)                 CGRectMake(RectX(f), RectY(f), RectWidth(f), h)
#define RectSetX(f, x)                      CGRectMake(x, RectY(f), RectWidth(f), RectHeight(f))
#define RectSetY(f, y)                      CGRectMake(RectX(f), y, RectWidth(f), RectHeight(f))
#define RectSetSize(f, w, h)                CGRectMake(RectX(f), RectY(f), w, h)
#define RectSetOrigin(f, x, y)              CGRectMake(x, y, RectWidth(f), RectHeight(f))
#define DATE_COMPONENTS                     NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit
#define TIME_COMPONENTS                     NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit
#define RGB(r, g, b)                        [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define RGBA(r, g, b, a)                    [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define HEXCOLOR(c)                         [UIColor colorWithRed:((c>>16)&0xFF)/255.0 green:((c>>8)&0xFF)/255.0 blue:(c&0xFF)/255.0 alpha:1.0];

#define DEGREES_TO_RADIANS(angle) (angle / 180.0 * M_PI)
