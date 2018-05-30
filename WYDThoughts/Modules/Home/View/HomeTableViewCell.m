//
//  HomeTableViewCell.m
//  WYDThoughts
//
//  Created by 王远东 on 2018/5/30.
//  Copyright © 2018年 wangyuandong. All rights reserved.
//

#import "HomeTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "UIImageView+ImageViewSetting.h"
#import "FontMacro.h"
#import "ColorMacro.h"
#import "Masonry.h"

@interface HomeTableViewCell ()

@property (nonatomic, strong) UIView *cellBackgroundView;
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UIImageView *picImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *descLabel;
@property (nonatomic, strong) UILabel *subLabel;

@end


@implementation HomeTableViewCell

#pragma mark - life cycle
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self addSubview:self.cellBackgroundView];
        [_cellBackgroundView addSubview:self.iconImageView];
        [_cellBackgroundView addSubview:self.picImageView];
        [_cellBackgroundView addSubview:self.titleLabel];
        [_cellBackgroundView addSubview:self.descLabel];
        [_cellBackgroundView addSubview:self.subLabel];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_cellBackgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self);
        
    }];
    
    [_picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_cellBackgroundView).offset(9);
        make.top.equalTo(_cellBackgroundView).offset(18);
        make.height.mas_equalTo(90);
        make.width.mas_equalTo(120);
    }];
    
}

#pragma mark - private methods
- (void)buildViewWithViewModel:(HomeTableViewCellViewModel *)viewModel
{
    
}

#pragma mark - getters and setters
- (UIView *)cellBackgroundView
{
    if (_cellBackgroundView == nil) {
        _cellBackgroundView = [[UIView alloc] init];
        _cellBackgroundView.backgroundColor = [UIColor whiteColor];
    }
    return _cellBackgroundView;
}

- (UIImageView *)iconImageView
{
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc] init];
    }
    return _iconImageView;
}

- (UIImageView *)picImageView
{
    if (_picImageView == nil) {
        _picImageView = [[UIImageView alloc] init];
        [_picImageView initImageViewSetting];
    }
    return _picImageView;
}

- (UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:titleFont];
    }
    return _titleLabel;
}

- (UILabel *)descLabel
{
    if (_descLabel == nil) {
        _descLabel = [[UILabel alloc] init];
        _descLabel.font = [UIFont systemFontOfSize:titleFont];
    }
    return _descLabel;
}

- (UILabel *)subLabel
{
    if (_subLabel == nil) {
        _subLabel = [[UILabel alloc] init];
        _subLabel.font = [UIFont systemFontOfSize:contentFont];
        _subLabel.textColor =  textColorGray;
    }
    return _subLabel;
}
@end
