//
//  ViewController.m
//  moveSide
//
//  Created by G.Z on 16/4/9.
//  Copyright © 2016年 G.Z. All rights reserved.
//

#import "ViewController.h"
#import "MoveSideView.h"

#import "SideCell.h"
#import "WLColView.h"
#import "NowCell.h"
#define SCREEN_W self.view.frame.size.width
#define SCREEN_H self.view.frame.size.height




@interface ViewController ()<WLColViewDataSource,WLColViewDelegate>

@property(nonatomic,strong)UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    MoveSideView *sideView = [[MoveSideView alloc] initWithFrame:self.view.bounds];
//    [self.view addSubview:sideView];
    
    
    WLColView *vi = [[WLColView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 150)];
    [self.view addSubview:vi];
    
    SideModel *sideModel = [[SideModel alloc] init];
    sideModel.cellSize = CGSizeMake(CGRectGetWidth(vi.frame) * 0.3, CGRectGetHeight(vi.frame) * 0.6);
    sideModel.between = 30;
    sideModel.maxR = 0.2;
    sideModel.initOffSetX = CGRectGetWidth(vi.frame) / 2 - sideModel.cellSize.width / 2;
    vi.sideModel = sideModel;
    vi.dataSource = self;
    vi.delegate = self;
    [vi.collectionView registerClass:[NowCell class] forCellWithReuseIdentifier:@"cee"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - colViewDataSource 

- (NSInteger)colView:(WLColView *)colView collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 10;
}

- (SideCell *)colView:(WLColView *)colView collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NowCell *cell = (NowCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cee" forIndexPath:indexPath];
    cell.dic = nil;
    return cell;
}

- (void)colView:(WLColView *)colView collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"%ld",indexPath.row);
}






@end
