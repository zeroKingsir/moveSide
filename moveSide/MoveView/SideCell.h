//
//  SideCell.h
//  test
//
//  Created by G.Z on 16/4/8.
//  Copyright © 2016年 G.Z. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SideCell : UICollectionViewCell

@property(nonatomic,strong)NSIndexPath *indexPath;
@property(nonatomic,assign)BOOL isMid;
@property(nonatomic,strong)NSMutableArray *mutArr;
@property(nonatomic,strong)UIImageView  *imageView;
- (void)reloadCellWithArr:(NSMutableArray *)arr;

@end
