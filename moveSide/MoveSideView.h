//
//  moveSideView.h
//  moveSide
//
//  Created by G.Z on 16/4/9.
//  Copyright © 2016年 G.Z. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoveSideView : UIView<UICollectionViewDataSource,UICollectionViewDelegate>

@property(nonatomic,strong)UICollectionView *collectionView;

@end
