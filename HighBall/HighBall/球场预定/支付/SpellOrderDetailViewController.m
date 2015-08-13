//
//  SpellOrderDetailViewController.m
//  HighBall
//
//  Created by imac on 15-7-8.
//  Copyright (c) 2015年 YM. All rights reserved.
//
#define peopels @[@"1人",@"2人",@"3人",@"4人",]
#import "SpellOrderDetailViewController.h"
#import "JKAlertDialog.h"


@interface SpellOrderDetailViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *redLable;
@property (weak, nonatomic) IBOutlet UILabel *blueLable;
@property (weak, nonatomic) IBOutlet UIButton *backOrderBtn;
@property (weak, nonatomic) IBOutlet UILabel *orderHaoLable;
@property (weak, nonatomic) IBOutlet UILabel *nickLable;
@property (weak, nonatomic) IBOutlet UILabel *dateLable;
@property (weak, nonatomic) IBOutlet UILabel *peopleLable;
@property (weak, nonatomic) IBOutlet UILabel *phoneLable;
@property (weak, nonatomic) IBOutlet UILabel *priceLable;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (strong, nonatomic) IBOutlet UIView *backOrderview;
@property (weak, nonatomic) IBOutlet UIView *alertView;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSArray *array;
@end

@implementation SpellOrderDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    int num=[self.number intValue];
    if (num==1) {
        self.redLable.hidden=YES;
    }else
    {
        self.blueLable.hidden=YES;
        self.backOrderBtn.hidden=YES;
    }
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    self.array=peopels;
    self.title=@"订单详情";
    [self initUI];
}

-(void)initUI
{
    //直接通过传过来的订单信息得到数据
    self.orderHaoLable.text=@"BGF1455656";
    self.nickLable.text=@"广州陆虎高尔夫球场";
    self.dateLable.text=@"7/19";
    self.peopleLable.text=@"3人";
    self.nameLable.text=@"朱晓旭";
    self.priceLable.text=@"¥5200";
    
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 40)];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitle:@"修改" forState:UIControlStateNormal];
    btn.titleLabel.font=[UIFont systemFontOfSize:15];
    [btn addTarget:self action:@selector(updataAtion) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem=rightItem;
}

//数据修改好之后，点击修改，重新提交修改后的数据
-(void)updataAtion
{
    NSLog(@"1223445656456456456");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma marck - datasouce,delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIndentifer=@"TableCell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIndentifer];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifer];
    }
    cell.textLabel.text=self.array[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.peopleLable.text=self.array[indexPath.row];
    self.alertView.hidden=YES;
    self.contentView.hidden=YES;
}

//退订按钮，数据提交
- (IBAction)backOrderAction:(id)sender {
    UIColor *color=[UIColor colorWithRed:0.0/255 green:136.0/255 blue:254.0/255 alpha:1];
    CGFloat w = self.backOrderview.frame.size.width;
    CGFloat h = self.backOrderview.frame.size.height;
    JKAlertDialog *aler=[[JKAlertDialog alloc]initWithTitle:@"温馨提醒" message:@"" color:color andBoolen:NO AlertsWidth:w AlertsHeight:h];
    aler.contentView=self.backOrderview;
    [aler show];
}
//弹出view的确定按钮
- (IBAction)certainAction:(id)sender {
    self.backOrderview.superview.superview.hidden=YES;
}
//点击重新选择打球人数
- (IBAction)numberChoose:(id)sender {
    self.alertView.hidden=NO;
    self.contentView.hidden=NO;
}

@end
