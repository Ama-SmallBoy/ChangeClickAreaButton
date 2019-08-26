//
//  CustomButton.m
//  事件响应以及事件传递
//
//  Created by a on 2019/8/20.
//  Copyright © 2019年 TeenageBeaconFireGroup. All rights reserved.
//

#import "CustomButton.h"

@implementation CustomButton

//点击的位置，所在的View,也就是点击的View
-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{

    if (self.alpha>0.01 && self.userInteractionEnabled && !self.hidden) {
        
        if ([self pointInside:point withEvent:event]) {
            //NSEnumerationReverse倒序遍历
            __block UIView * hit = nil;
            [self.subviews enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                //TODO:此处需要做：将坐标转换到当前子视图中的坐标：使用的方法：convertPoint:toView:
                CGPoint vonvertPoint = [self convertPoint:point toView:obj];
                //调用子视图的hitTest方法。
                hit = [obj hitTest:vonvertPoint withEvent:event];
                if (hit) {
                    *stop = YES;
                }
            }];
            
            if (hit) {
                return hit;
            }else{
                return self;
            }
            
        }else{
            return nil;
        }
    }else{
        return nil;
    }
}
// 点击的位置是否在该页面中
-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    
    CGFloat x1 = point.x;
    CGFloat y1 = point.y;
    
    //获取该控件的中心点：
    
    CGFloat x2 = self.frame.size.width / 2.0;
    CGFloat y2 = self.frame.size.height / 2.0;

    double dis = sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2));
    
    if (dis <= self.frame.size.width/2) {
         return YES;
    }else{
        return NO;
    }
   
}

@end
