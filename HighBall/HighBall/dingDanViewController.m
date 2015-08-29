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
#define UIFrame [[UIScreen mainScreen]bounds]
#import "dingDanView.h"
#import "PayWayViewController.h"
#import "xinZengViewController.h"

@interface dingDanViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *MainTableView;
@property (nonatomic,strong)ziYuan *ziYuan;
@property (nonatomic,strong)dingDanView *ding;
@property (nonatomic,strong)dingDanViewCell *cell;
@property (nonatomic,strong)xinZengViewController *xinZeng;
@property (nonatomic,strong)NSString *names;
@property (nonatomic,strong)NSString *phones;
@end

@implementation dingDanViewController
void (^changCellBlock)(NSString *name,NSString *phone);
- (xinZengViewController *)xinZeng{
    if (_xinZeng == nil) {
        _xinZeng = [[xinZengViewController alloc]initWithNibName:@"xinZengViewController" bundle:nil];
        _xinZeng.nameAndPhone = changCellBlock;
    }
    return _xinZeng;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"提交订单";
    
    
    ziYuan *footView = [[ziYuan alloc]init];
    [footView show:300 andHeaderName:@"提交订单"];
    footView.name = self.title;
    [self.view addSubview:footView];
    self.ding = [[dingDanView alloc]initWithFrame:CGRectMake(0, 0, UIFrame.size.width, 100)];
    
    self.MainTableView.tableHeaderView = self.ding;
    [self.ding.tabel registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [self.ding.tabel registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell3"];
    self.ding.tabel.delegate = self;
    self.ding.tabel.dataSource =self;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(dingDan) name:@"dingDan123" object:nil];

}
//去支付
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    changCellBlock = ^(NSString *name,NSString *phone){
        self.names = name;
        self.phones = phone;
    };
    [self.MainTableView reloadData];
}
- (void)dingDan{
    PayWayViewController *pay = [[PayWayViewController alloc]initWithNibName:@"PayWayViewController" bundle:nil];
    [self.navigationController pushViewController:pay animated:YES];
   
    
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.ding.tabel) {
        return 5;
    }else{
        return 15;
    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"Cell2";
   
    
    
    if (tableView == self.ding.tabel) {
        if (indexPath.row<4) {
            
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
            
        }
            cell.textLabel.text = self.names;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
        else {
            UITableViewCell *cell3 = [tableView dequeueReusableCellWithIdentifier:@"Cell3"];
            if (cell3==nil) {
                cell3 = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell3"];
            }
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(self.ding.tabel.frame.size.width-30, 7, 20, 30);
            [button setImage:[UIImage imageNamed:@"iconfont-tianjiayuangong"] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(abc) forControlEvents:UIControlEventTouchUpInside];
            [cell3.contentView addSubview:button];
        
        cell3.textLabel.text = self.names;
       cell3.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell3;
        }}
    
    
    else{
    dingDanViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        self.cell = cell;
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"dingDanViewCell" owner:self options:nil]lastObject];
    }
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, UIFrame.size.width, 20)];
        image.backgroundColor = [UIColor grayColor];
        [cell.contentView addSubview:image];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.name.text = self.names;
        cell.phone.text = self.phones;
        return cell;}
    
    }
    
- (void)abc{
   
    [self.navigationController pushViewController:self.xinZeng animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.ding.tabel) {
        return 44;
    }else{
        return 155;
    }
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"dingDan123" object:nil];
    
}
@end
