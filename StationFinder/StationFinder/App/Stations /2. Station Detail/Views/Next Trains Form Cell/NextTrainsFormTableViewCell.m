//
//  NextTrainsFormTableViewCell.m
//  StationFinder
//
//  Created by Takomborerwa Mazarura on 17/11/2017.
//  Copyright © 2017 SuperAwesomeInc. All rights reserved.
//

#import "NextTrainsFormTableViewCell.h"

#import "CoreStationInfoView.h"

#import "GetTrainsHandler.h"

#import "TrainTableViewCell.h"

@interface NextTrainsFormTableViewCell () <
    UITableViewDelegate,
    UITableViewDataSource,
    GetTrainsHandlerDelegate>
{
    CGFloat cellHeight;
    
    CGFloat tableViewCellHeight;
    
    NSInteger maxNumberOfCells;
    
    NSInteger seconds;
    
    NSTimer *timer;
}

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *trainsArray;

@property (nonatomic, strong) TubeStation *station;

@property (nonatomic, strong) GetTrainsHandler *getTrainsHandler;

@end

@implementation NextTrainsFormTableViewCell

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
    maxNumberOfCells        = 3;
    
    tableViewCellHeight     = 100;
 
    cellHeight              = (tableViewCellHeight * maxNumberOfCells) + (GenericDistance * 3) + 35;
    
    self.mandatory          = YES;
    
    self.spaceToNextCell    = 5;
    
    self.customCellHeight   = cellHeight;
    
    [self setupHandlers];
}

- (void)setupHandlers
{
    if (!self.getTrainsHandler) {
        
        self.getTrainsHandler = [[GetTrainsHandler alloc] init];
        
        self.getTrainsHandler.delegate = self;
    }
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
    
    [self setupTableView];
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
    
    self.titleLabel.text = @"Next Three Trains From Station";
    
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

- (void)setupTableView
{
    CGRect frame = CGRectMake(0, 0, (ScreenWidth - GenericDistance * 2), (tableViewCellHeight * 3));
    
    self.tableView              = [[UITableView alloc]initWithFrame:frame style:UITableViewStylePlain];
    
    self.tableView.delegate     = self;
    
    self.tableView.dataSource   = self;
    
    self.tableView.clipsToBounds= YES;
    
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    [self.tableView registerNib:[UINib nibWithNibName:kTrainTableViewCellNibName bundle:[NSBundle mainBundle]]
         forCellReuseIdentifier:kTrainTableViewCellID];
    
    [self.containerView addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(GenericDistance);
        make.left.equalTo(self.containerView.mas_left).offset(GenericDistance);
        make.right.equalTo(self.containerView.mas_right).offset(-GenericDistance);
        make.bottom.equalTo(self.containerView.mas_bottom).offset(GenericDistance);
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int count = (int)[self.trainsArray count];
    
    if (count == 0) {
        
        count = 1;
        
    }else if (count > maxNumberOfCells) {
        
        count = (int)maxNumberOfCells;
    }
    
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TrainTableViewCell *feedCell = [[TrainTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kTrainTableViewCellID];
    
    if (feedCell == nil) {
        
        feedCell = [[TrainTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                    reuseIdentifier:kTrainTableViewCellID];
    }
    
    if ([self.trainsArray objectAtIndex:indexPath.row]) {
        
        Train *train = [self.trainsArray objectAtIndex:indexPath.row];
        
        [feedCell configureWithTrain:train];
    
    }else{
    
        [feedCell configureForLoading];
    }
    
    return feedCell;
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger height = tableViewCellHeight;
    
    return height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Collect View Data

- (void)getNextFewTrainsWithStation:(TubeStation*)station
{
    [self.getTrainsHandler getNextFewTrainsFromStationWithId:station.stationId];
}

#pragma mark - Timer

- (void)runReloadTrainsTimer
{
    seconds = 30;
    
    timer   = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                               target:self
                                             selector:@selector(countDownTimer)
                                             userInfo:nil
                                              repeats:YES];
}

- (void)timeoutAndReloadCollectionViewTimer
{
    [timer invalidate];
    
    [self getNextFewTrainsWithStation:self.station];
    
    [self runReloadTrainsTimer];
}

- (void)countDownTimer
{
    if (seconds == 0) {
        
        [self timeoutAndReloadCollectionViewTimer];
        
    }else{
        
        seconds--;
    }
}

#pragma mark - Get Trains Handler Delegate

- (void)returnTrainsFromHandler:(GetTrainsHandler*)handler trains:(NSMutableArray*)trains
{
    if (trains.count > 0) {
        
        [self configureWithTrains:trains];
    }
}

#pragma mark - Configure View

- (void)configureWithTrains:(NSMutableArray*)trains
{
    if (trains) {
        
        self.trainsArray = trains;
        
        [self.tableView reloadData];
    }
}

- (void)configureWithStation:(TubeStation*)station
{
    if (station) {
        
        [self getNextFewTrainsWithStation:station];
        
        [self runReloadTrainsTimer];
    }
}

@end
