//
//  SideModel.h
//  moveSide
//
//  Created by G.Z on 16/4/9.
//  Copyright © 2016年 G.Z. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface SideModel : NSObject

@property(nonatomic,assign) CGFloat maxR;
@property(nonatomic,assign) CGSize cellSize;
@property(nonatomic,assign) CGFloat between;
@property(nonatomic,assign) CGFloat initOffSetX;

@end
