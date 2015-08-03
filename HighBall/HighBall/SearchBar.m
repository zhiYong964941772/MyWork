//
//  SearchBar.m
//  weibo
//
//  Created by apple on 15/7/16.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "SearchBar.h"
#import "UIView+Extension.h"
@implementation SearchBar
+ (instancetype)searchBar{
    return [[self alloc]init];
    
}
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
    self.font = [UIFont systemFontOfSize:15];
    self.placeholder = @"";
    self.background = [UIImage imageNamed:@"searchbar_textfield_background"];
    UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed: @"searchbar_textfield_search_icon"]];
    image.width = 30;
    image.height = 30;
    image.contentMode = UIViewContentModeCenter;
    self.leftView = image;
    self.leftViewMode = UITextFieldViewModeAlways;
    
        
        
    }
    return self;
}
@end
