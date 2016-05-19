//
//  WLColView.h
//  moveSide
//
//  Created by G.Z on 16/4/9.
//  Copyright © 2016年 G.Z. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SideModel.h"

@class WLColView,SideCell;

@protocol WLColViewDataSource <NSObject>

- (NSInteger)colView:(WLColView *)colView collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;

- (SideCell *)colView:(WLColView *)colView collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@protocol WLColViewDelegate <NSObject>

- (void)colView:(WLColView *)colView collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface WLColView : UIView<UICollectionViewDataSource,UICollectionViewDelegate>

@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)SideModel *sideModel;

@property(nonatomic,assign)id<WLColViewDataSource> dataSource;
@property(nonatomic,assign)id<WLColViewDelegate> delegate;


@end
