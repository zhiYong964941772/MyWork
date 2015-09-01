//
//  dingDanView.m
//  HighBall
//
//  Created by imac on 15-8-27.
//  Copyright (c) 2015年 YM. All rights reserved.
//
#define UIFrame [[UIScreen mainScreen]bounds]
#define color(r) [UIColor r]
#import "dingDanView.h"
@interface dingDanView(){
    UILabel *chuxing;
    UILabel *num;
    UILabel *wei;
    UIImageView *image;
    UILabel *cheng;
    UILabel *ming;
    UIButton *tianjia;
    UIImageView *image2;
    
}
@end

@implementation dingDanView
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        UILabel *chu = [self labelWithLabel:17 WithColor:color(blackColor) Withx:10 Withy:10 WithWidth:65 WithHeight:30 WithText:@"出行人"];
        chuxing = chu;
        [self addSubview:chu];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        UILabel *nums = [self labelWithLabel:16 WithColor:color(blueColor) Withx:80 Withy:10 WithWidth:20 WithHeight:30 WithText:[defaults objectForKey:@"peopleNum"]];
        num = nums;
        [self addSubview:nums];
        UILabel *zi = [self labelWithLabel:17 WithColor:color(blackColor) Withx:95 Withy:10 WithWidth:20 WithHeight:30 WithText:@"位"];
        wei = zi;
        [self addSubview:zi];
        
        UIImageView *xian = [self imageViewWithimageX:0 WithY:chu.frame.size.height+20 WithWidth:UIFrame.size.width WithHeight:1 WithBackGroundColor:color(grayColor)];
        image = xian;
        [self addSubview:xian];
        UILabel *chengren = [self labelWithLabel:17 WithColor:color(blueColor) Withx:10 Withy:xian.frame.origin.y+11 WithWidth:50 WithHeight:30 WithText:@"成人"];
        cheng = chengren;
        [self addSubview:chengren];
        UITableView *tabel = [[UITableView alloc]initWithFrame:CGRectMake(100,xian.frame.origin.y+1 , UIFrame.size.width-100,45 )];
        self.tabel = tabel;
        tabel.userInteractionEnabled = YES;
        [self addSubview:tabel];
       
        [defaults synchronize];
    }
    return self;
}

-(UILabel *)labelWithLabel:(CGFloat)font WithColor:(UIColor *)color Withx:(CGFloat)x Withy:(CGFloat)y WithWidth:(CGFloat)width WithHeight:(CGFloat)height WithText:(NSString *)text{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(x, y, width, height)];
    label.font = [UIFont systemFontOfSize:font];
    label.textColor = color;
    label.text = text;
    
    return label;
    
}
- (UIImageView *)imageViewWithimageX:(CGFloat)x WithY:(CGFloat)y WithWidth:(CGFloat)width WithHeight:(CGFloat)height WithBackGroundColor:(UIColor *)color{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, width, height)];
    imageView.backgroundColor = color;
    return imageView;
    
}


@end
