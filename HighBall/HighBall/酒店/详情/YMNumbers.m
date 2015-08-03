//
//  YMNumbers.m
//  HighBall
//
//  Created by imac on 15-7-7.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "YMNumbers.h"

@interface YMNumbers()

@end

@implementation YMNumbers

-(instancetype)init
{
    self=[super init];
    if (self) {
        self.frame=CGRectMake(0, 0, 260, 250);
        UITableView *tableView=[[UITableView alloc]initWithFrame:self.frame];
        tableView.dataSource=self;
        tableView.delegate=self;
        [self addSubview:tableView];
    }
    return self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.numbersArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndentifier=@"UITableViewCell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    cell.textLabel.text=self.numbersArr[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"fillOut" object:nil userInfo:@{@"number":self.numbersArr[indexPath.row]}];
    self.superview.superview.hidden=YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
