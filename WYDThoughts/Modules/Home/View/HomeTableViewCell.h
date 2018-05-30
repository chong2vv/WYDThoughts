//
//  HomeTableViewCell.h
//  WYDThoughts
//
//  Created by 王远东 on 2018/5/30.
//  Copyright © 2018年 wangyuandong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeTableViewCellViewModel.h"

@interface HomeTableViewCell : UITableViewCell

- (void) buildViewWithViewModel:(HomeTableViewCellViewModel *)viewModel;

@end
