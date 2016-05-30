//
//  ViewController.m
//  TEST001
//
//  Created by admin on 16/5/30.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(copy,nonatomic)NSString *startStr; // 2016-05-29 17:30:00
@property(copy,nonatomic)NSString *endStr;  //  2016-05-29 17:40:00

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _startStr = @"2016-05-30 16:10:00";
    _endStr = @"2016-05-30 16:30:00";
    
    
    NSLog(@"====%d",[self calWithStartStr:_startStr endStr:_endStr]);
}
-(BOOL)calWithStartStr:(NSString *)startStr endStr:(NSString *)endStr{

    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *nowDate = [NSDate date];
    //satrt  开始时间
    NSDate *startDate = [dateFormatter dateFromString:startStr];
    CGFloat startTime = (CGFloat)[startDate timeIntervalSinceDate:nowDate];
    //end 结束时间
    NSDate *endDate = [dateFormatter dateFromString:endStr];
    CGFloat endTime = (CGFloat)[endDate timeIntervalSinceDate:nowDate];
    
    //pre_30   时间差的30%
    CGFloat pre_30 = (endTime-startTime)*0.3;
    
    NSLog(@"startTime--%f\n-endTime--%f",startTime,endTime);
    NSLog(@"---%f",pre_30);

    
    
    
    //开始时间到1970
    CGFloat start_TimeStamp = (CGFloat)[startDate timeIntervalSince1970];
//    CGFloat end_TimeStamp = (CGFloat)[endDate timeIntervalSince1970];
    //现在距离1970
    CGFloat now_TimeStamp = (CGFloat)[nowDate timeIntervalSince1970];
    
    NSLog(@"==%f\n++++%f",start_TimeStamp,now_TimeStamp);
    
    
    //如果当前的时间>开始时间+pre_30 返回YES
    if (start_TimeStamp+pre_30<now_TimeStamp) {
        return YES;
    }
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
