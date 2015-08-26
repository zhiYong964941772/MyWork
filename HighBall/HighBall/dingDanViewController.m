//
//  dingDanViewController.m
//  HighBall
//
//  Created by imac on 15-8-26.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "dingDanViewController.h"
#import "ziYuan.h"
#import "dingDanViewCell.h"
#import "dingDansViewCell.h"
@interface dingDanViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *MainTableView;
@property (nonatomic,strong)ziYuan *ziYuan;
@end

@implementation dingDanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"提交订单";
    ziYuan *footView = [[ziYuan alloc]init];
    [footView show:300 andHeaderName:@"提交订单"];
    footView.name = self.title;
    [self.view addSubview:footView];
}
//去支付
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"Cell";
    
    if (indexPath.row == 0) {
        dingDansViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (!cell) {
            cell = [[dingDansViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        return cell;
    }
    else{
        
    dingDanViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"dingDanViewCell" owner:self options:nil]lastObject];
    }
        return cell;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   
        return 135;
    
}
@end
