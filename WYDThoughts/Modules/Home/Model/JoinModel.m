//
//  JoinModel.m
//  WYDThoughts
//
//  Created by 王远东 on 2018/5/30.
//  Copyright © 2018年 wangyuandong. All rights reserved.
//

#import "JoinModel.h"
#import "NSObject+BaseModel.h"

@implementation JoinModel

- (void)parseJsonData:(NSDictionary *)dictionary
{
    self.join_id = [dictionary objectForKey:@"id"];
    self.join_img_url = [dictionary objectForKey:@"photo"];
    self.join_short_address = [dictionary objectForKey:@"location"];
    self.join_topic = [dictionary objectForKey:@"topic"];
    self.join_punish_money = [dictionary objectForKey:@"punish_money"];
    self.join_promise_money = [dictionary objectForKey:@"promise_money"];
    self.join_date = [[dictionary objectForKey:@"agree_time"] integerValue];
    self.join_desc = [dictionary objectForKey:@"desc"];
    self.order_discount = [dictionary objectForKey:@"discount"];
    self.city = [dictionary objectForKey:@"city"];
    self.join_long_address = [NSString stringWithFormat:@"%@%@",self.city,self.join_short_address];
    
}

@end
