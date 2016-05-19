//
//  SideCell.m
//  test
//
//  Created by G.Z on 16/4/8.
//  Copyright © 2016年 G.Z. All rights reserved.
//

#import "SideCell.h"
#define COUNT 9



@implementation SideCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self setUp];
    }
    return self;
}

#pragma mark -- 属性控件的创建与设置
- (void)setUp{
    
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    
    [self.contentView addSubview:_imageView];
  
}

- (void)reloadCellWithArr:(NSMutableArray *)arr{
    
    self.imageView.image = arr[0];
}
@end
