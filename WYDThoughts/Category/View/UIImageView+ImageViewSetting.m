//
//  UIImageView+ImageViewSetting.m
//  WYDThoughts
//
//  Created by 王远东 on 2018/5/30.
//  Copyright © 2018年 wangyuandong. All rights reserved.
//

#import "UIImageView+ImageViewSetting.h"

@implementation UIImageView (ImageViewSetting)

- (void)initImageViewSetting{
    self.contentMode = UIViewContentModeScaleAspectFill;
    self.clipsToBounds = YES;
    self.userInteractionEnabled = YES;
}

@end
