//
//  dingDansViewCell.m
//  HighBall
//
//  Created by imac on 15-8-26.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "dingDansViewCell.h"
#define UIFrame [[UIScreen mainScreen]bounds]
#define color(r) [UIColor r]
@interface dingDansViewCell(){
    UILabel *chuxing;
    UILabel *num;
    UILabel *wei;
    UIImageView *image;
    UILabel *cheng;
    UILabel *ming;
    UIButton *tianjia;
    
    
}
@end
@implementation dingDansViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel *chu = [self labelWithLabel:17 WithColor:color(blackColor) Withx:10 Withy:10 WithWidth:65 WithHeight:30 WithText:@"出行人"];
        chuxing = chu;
        [self.contentView addSubview:chu];
        UILabel *nums = [self labelWithLabel:16 WithColor:color(blueColor) Withx:80 Withy:10 WithWidth:20 WithHeight:30 WithText:@"1"];
        num = nums;
        [self.contentView addSubview:nums];
        UILabel *zi = [self labelWithLabel:17 WithColor:color(blackColor) Withx:95 Withy:10 WithWidth:20 WithHeight:30 WithText:@"位"];
        wei = zi;
        [self.contentView addSubview:zi];
        
        UIImageView *xian = [self imageViewWithimageX:0 WithY:chu.frame.size.height+20 WithWidth:UIFrame.size.width WithHeight:1 WithBackGroundColor:color(grayColor)];
        image = xian;
        [self.contentView addSubview:xian];
        UILabel *chengren = [self labelWithLabel:17 WithColor:color(blueColor) Withx:10 Withy:xian.frame.origin.y+11 WithWidth:50 WithHeight:30 WithText:@"成人"];
        cheng = chengren;
        [self.contentView addSubview:chengren];
        
        
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
