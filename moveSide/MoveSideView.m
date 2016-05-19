//
//  moveSideView.m
//  moveSide
//
//  Created by G.Z on 16/4/9.
//  Copyright © 2016年 G.Z. All rights reserved.
//

#import "moveSideView.h"
#import "SideCell.h"


@interface MoveSideView ()
{
    
    SideCell *_lastCell;
    CGSize _cellSize;
    CGFloat between,initOffSetX,maxR,beginOffSetX;
}


@end

@implementation MoveSideView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self setData];
        [self UI];
    }
    return self;
}

#pragma mark - collectionviewDelegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    SideCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cee" forIndexPath:indexPath];
    if (indexPath.row == 0) {
        
        cell.transform = CGAffineTransformMakeScale(1.1, 1.1);
        _lastCell = cell;
    }
    cell.indexPath = indexPath;
    cell.backgroundColor = [UIColor yellowColor];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    
    NSIndexPath *indexPath = [self.collectionView indexPathForCell:_lastCell];
    SideCell *panView = _lastCell;
    SideCell *preView = (SideCell *)[self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row - 1 inSection:0]];
    SideCell *lastView = (SideCell *)[self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row + 1 inSection:0]];
    [self dragScrollview:panView];
    [self dragScrollview:preView];
    [self dragScrollview:lastView];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    beginOffSetX = scrollView.contentOffset.x;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    [self dragScrollviewEnd];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    [self dragScrollviewEnd];
}

#pragma mark - private motheds

- (void)setData {
    
    between = 30;
    maxR = 0.2;
    _cellSize = CGSizeMake(CGRectGetWidth(self.frame) * 0.6, CGRectGetHeight(self.frame) * 0.6);
    initOffSetX = CGRectGetWidth(self.frame) / 2 - _cellSize.width / 2;
}

- (void)UI {
    
    [self addSubview:self.collectionView];
}


- (void)dragScrollview:(SideCell *)cell {
    
    //中心
    CGPoint cellPoint = [self.collectionView convertPoint:cell.center toView:self];
    CGFloat moveBetween = cellPoint.x - self.center.x;
    if (fabs(moveBetween) < 100) {
        
        CGFloat scale = 1 + (maxR * 10) * (0.1 - fabs(moveBetween) / 1000.0f);
        cell.transform = CGAffineTransformMakeScale(scale, scale);
        _lastCell = cell;
    }else {
        cell.transform = CGAffineTransformMakeScale(1, 1);
    }
}

- (void)dragScrollviewEnd {
    
    NSInteger index = [self.collectionView indexPathForCell:_lastCell].row;
    CGFloat moveBetween = _cellSize.width + between;
    CGFloat scMove = self.collectionView.contentOffset.x - beginOffSetX;
    if (fabs(scMove) > moveBetween / 2){
        
    }else if (scMove > 0) {
        index ++;
    }else if (scMove < 0) {
        index --;
    }
    [self.collectionView setContentOffset:CGPointMake(-initOffSetX + index * moveBetween , 0) animated:YES];
}

#pragma mark - setters and getters 

- (UICollectionView *)collectionView {
    
    if (_collectionView == nil) {
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.itemSize = _cellSize;
        flowLayout.minimumInteritemSpacing = between;
        flowLayout.minimumLineSpacing = between;
        _collectionView = [[UICollectionView alloc] initWithFrame:self.frame collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = [UIColor blueColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[SideCell class] forCellWithReuseIdentifier:@"cee"];
        _collectionView.contentInset = UIEdgeInsetsMake(0, initOffSetX, 0, initOffSetX);
        
    }
    return _collectionView;
}

@end
