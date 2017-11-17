//
//  StationFacilitiesFormTableViewCell.m
//  StationFinder
//
//  Created by Takomborerwa Mazarura on 17/11/2017.
//  Copyright © 2017 SuperAwesomeInc. All rights reserved.
//

#import "StationFacilitiesFormTableViewCell.h"

#import "FacilityCollectionViewCell.h"

@interface StationFacilitiesFormTableViewCell () <
    UICollectionViewDelegate,
    UICollectionViewDataSource>
{
    NSInteger currentSelectedIndex;
    
    CGFloat cellHeight;
    
    CGFloat collectionViewHeight;
}

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;

@property (nonatomic, strong) NSMutableArray *facilitiesArray;

@property (nonatomic, strong) TubeStation *station;

@end

@implementation StationFacilitiesFormTableViewCell

- (id)init
{
    self = [super init];
    
    if (!self) return nil;
    
    [self setupVariables];
    
    [self setupMainView];
    
    [self initializeSubviews];
    
    return self;
}

#pragma mark - Setup Variables

- (void)setupVariables
{
    currentSelectedIndex    = -1;
    
    collectionViewHeight    = 200;
    
    cellHeight              = collectionViewHeight + (GenericDistance * 3) + 35;
    
    self.mandatory          = YES;
    
    self.spaceToNextCell    = 5;
    
    self.customCellHeight   = cellHeight;
}

#pragma mark - Setup View Appearance

- (void)setupMainView
{
    self.backgroundColor    = [UIColor clearColor];
    
    self.nameImageActive    = @"";
    
    self.nameImageInactive  = @"";
    
    self.clipsToBounds      = YES;
    
    self.textField.enabled  = NO;
    
    self.textField.hidden   = YES;
}

- (void)initializeSubviews
{
    [self setupContainerView];
    
    [self setupTitleLabel];
    
    [self setupCollectionView];
}

- (void)setupContainerView
{
    self.containerView = UIView.new;
    
    self.containerView.backgroundColor = kAppWhite;
    
    self.containerView.clipsToBounds    = YES;
    
    self.containerView.layer.masksToBounds = YES;
    
    self.containerView.layer.cornerRadius = 4.0f;
    
    [self addSubview:self.containerView];
    
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(0);
        make.left.equalTo(self.mas_left).offset(GenericDistance);
        make.right.equalTo(self.mas_right).offset(-GenericDistance);
        make.bottom.equalTo(self.mas_bottom).offset(-GenericDistance);
    }];
}
- (void)setupTitleLabel
{
    self.titleLabel = UILabel.new;
    
    self.titleLabel.textColor = kAppDarkGray;
    
    self.titleLabel.text = @"Station Facilites";
    
    self.titleLabel.font = font(kAppFontBold, 12);
    
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    
    self.titleLabel.numberOfLines = 2;
    
    self.titleLabel.minimumScaleFactor = 0.5;
    
    self.titleLabel.adjustsFontSizeToFitWidth = YES;
    
    [self.containerView addSubview:self.titleLabel];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.containerView.mas_top).offset(GenericDistance * 1.5);
        make.left.equalTo(self.containerView.mas_left).offset(GenericDistance);
        make.right.equalTo(self.containerView.mas_right).offset(-GenericDistance);
    }];
}

- (void)setupCollectionView
{
    CGRect frame = CGRectMake(0, 0, (ScreenWidth - GenericDistance * 2), collectionViewHeight);
    
    self.flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    self.flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.flowLayout.estimatedItemSize = CGSizeMake(1, 50);
    
    self.flowLayout.minimumInteritemSpacing = 2.0f;
    
    self.flowLayout.minimumLineSpacing      = 2.0f;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:self.flowLayout];
    
    self.collectionView.showsVerticalScrollIndicator = YES;
    
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
    self.collectionView.backgroundColor = [UIColor clearColor];
    
    self.collectionView.clipsToBounds = YES;
    
    [self.collectionView setDataSource:self];
    
    [self.collectionView setDelegate:self];
    
    [self.containerView addSubview:self.collectionView];
    
    [self registerCollectionViewCells];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(GenericDistance);
        make.left.equalTo(self.containerView.mas_left).offset(GenericDistance);
        make.right.equalTo(self.containerView.mas_right).offset(-GenericDistance);
        make.bottom.equalTo(self.containerView.mas_bottom).offset(-GenericDistance);
    }];
}

- (void)registerCollectionViewCells
{
    [self.collectionView registerClass:[FacilityCollectionViewCell class]
            forCellWithReuseIdentifier:kFacilityCollectionViewCellID];
    
    [self.collectionView registerNib:[UINib nibWithNibName:kFacilityCollectionViewCellNibName bundle:[NSBundle mainBundle]]
          forCellWithReuseIdentifier:kFacilityCollectionViewCellID];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    int count = (int)self.facilitiesArray.count;
    
    if (count == 0) {
        
        count = 1;
    }
    
    return count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FacilityCollectionViewCell *cell = (FacilityCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kFacilityCollectionViewCellID forIndexPath:indexPath];
    
    if (cell == nil) {
        
        cell =  [[FacilityCollectionViewCell alloc] init];
    }
    
    NSInteger index = indexPath.row;
    
    if (self.facilitiesArray.count > 0) {
        
        Facility *facility = [self.facilitiesArray objectAtIndex:index];
        
        [cell configureWithFacility:facility];
        
        if (currentSelectedIndex == index) {
            
            [self updateCellWithSelectedCell:indexPath];
        }
    }
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.facilitiesArray.count > 0) {
        
        [self updateCellWithSelectedCell:indexPath];
        
        Facility *facility = [self.facilitiesArray objectAtIndex:indexPath.row];
        
        [self sendSelectedFacilityBack:facility];
    }
}

- (void)updateCellWithSelectedCell:(NSIndexPath*)indexPath
{
    // 1. Deselect the currently selected cell
    
    if (currentSelectedIndex > -1) {
    
        NSIndexPath *oldSelectedIndexPath = [NSIndexPath indexPathForRow:currentSelectedIndex inSection:0];
        
        FacilityCollectionViewCell *cell = (FacilityCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:oldSelectedIndexPath];
        
        [cell configureForSelected:NO];
        
    }
        
    // 2. Update the 'currentSelectedIndex' and select the new cell
    
    currentSelectedIndex = indexPath.row;
    
    FacilityCollectionViewCell *cell = (FacilityCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    
    [cell configureForSelected:YES];
}

- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout*)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    
    return 2.0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout*)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    
    return 10.0;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout*)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section {

    return UIEdgeInsetsMake(0,0,0,0);
}

#pragma mark - Configure View With Data

- (void)configureWithStation:(TubeStation*)station
{
    if (station && self.collectionView) {
        
        self.facilitiesArray = station.facilities;
        
        [self.collectionView  reloadData];
    }
}

#pragma mark - Delegate Method Call

- (void)sendSelectedFacilityBack:(Facility*)facility
{
    id <StationFacilitiesFormTableViewCellDelegate> strongDelegate = self.delegate;
    
    if ([strongDelegate respondsToSelector:@selector(sendSelectedFaciltyToCaller:facility:)]) {
        
        [strongDelegate sendSelectedFaciltyToCaller:self facility:facility];
    }
}

@end
