//
//  JoinModel.h
//  WYDThoughts
//
//  Created by 王远东 on 2018/5/30.
//  Copyright © 2018年 wangyuandong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JoinModel : NSObject

@property (nonatomic, copy) NSString *join_type;//    0:速搭,1:约饭,2:拼卡
@property (nonatomic, copy) NSString *join_img_url;
@property (nonatomic, copy) NSString *join_topic;
@property (nonatomic, copy) NSString *join_long_address;
@property (nonatomic, copy) NSString *join_short_address;
@property (nonatomic, assign) NSUInteger join_date;
@property (nonatomic, copy) NSString *join_consume_type;
@property (nonatomic, copy) NSString *join_consume;
@property (nonatomic, copy) NSString *join_id;
@property (nonatomic, copy) NSString *join_promise_money;
@property (nonatomic, copy) NSString *join_punish_money;
@property (nonatomic, copy) NSString *join_desc;
@property (nonatomic, copy) NSString *order_discount;//折扣
@property (nonatomic, copy) NSString *order_uid;
@property (nonatomic, copy) NSString *city;

@end
