//
//  AirFilghtView.m
//  HighBall
//
//  Created by imac on 15-7-28.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "AirFilghtView.h"
#import "AirFight.h"
#import "AirTime.h"
@interface AirFilghtView()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *MainTableView;//自定义lefttable
@property (weak, nonatomic) IBOutlet UITableView *secondTableView;//righttable
@property (strong,nonatomic) NSArray *allFight;//接收所有的数据
@end
@implementation AirFilghtView
- (NSArray *)allFight{
    if (!_allFight) {
        _allFight = [AirFight allFight];
    }
    return _allFight;
}
//加载xib
+ (id)view{
    return [[[NSBundle mainBundle]loadNibNamed:@"AirFilghtView" owner:self options:nil]lastObject];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.MainTableView) {
        return self.allFight.count;
    }else{
        NSInteger selectedRow = [self.MainTableView indexPathForSelectedRow].row;
        AirTime *time = self.allFight[selectedRow];
        NSArray *subArray = time.time;
        return subArray.count;
        
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.MainTableView) {
        static NSString *cellID = @"leftCell";
        UITableViewCell *leftCell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (!leftCell) {
            leftCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
    
    AirTime *time = self.allFight[indexPath.row];
        leftCell.textLabel.text = time.name;
        return leftCell;
}else{
        static NSString *cellID = @"rightCell";
        UITableViewCell *rightCell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (!rightCell) {
            rightCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        }
        NSInteger selectedRow = [self.MainTableView indexPathForSelectedRow].row;
        AirTime *time = self.allFight[selectedRow];
        NSArray *subArray = time.time;
        rightCell.textLabel.text = subArray[indexPath.row];
        return rightCell;
    }
    
    return nil;

}
//响应点击事件的应对
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.MainTableView) {
        [self.secondTableView reloadData];
    }else{
        NSInteger selectedLeftRow = [self.MainTableView indexPathForSelectedRow].row;
        NSInteger selectedRightRow = [self.secondTableView indexPathForSelectedRow].row;
        AirTime *time = self.allFight[selectedLeftRow];
        NSString *sub = time.time[selectedRightRow];
        
        
//        [[NSNotificationCenter defaultCenter]postNotificationName:@"AirFight" object:nil userInfo:@{@"TRSelectedCategory":time, @"TRSelectedSubCategoryName": sub}];
        
        
        
        
    }
 }
//设置cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.MainTableView) {
        return 70;
    }
    else{
        return 44;
    }
}
- (IBAction)getButton:(UIBarButtonItem *)sender {
    NSLog(@"确定");
}
//确定按钮
//取消按钮
- (IBAction)cancelButton:(UIBarButtonItem *)sender {
    NSLog(@"取消");
}







@end
