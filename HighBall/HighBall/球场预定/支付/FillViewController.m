//
//  FillViewController.m
//  HighBall
//
//  Created by imac on 15-7-6.
//  Copyright (c) 2015年 YM. All rights reserved.
//
#define numbers @[@"1",@"2",@"3",@"4"]
#import "FillViewController.h"
#import "CourselInfo.h"
#import "BallSpellAPI.h"
#import "JKAlertDialog.h"
#import "BallSpellAPI.h"
#import "BallSpellPrice.h"
#import "OrderTableViewController.h"
#import "FillTableViewCell.h"

@interface FillViewController ()
{
    bool btnBoor;
}
@property (weak, nonatomic) IBOutlet UILabel *nickLable;
@property (weak, nonatomic) IBOutlet UILabel *dateLable;
@property (weak, nonatomic) IBOutlet UILabel *timeLable;

- (IBAction)rule:(id)sender;
- (IBAction)numberAction:(UIButton *)sender;
- (IBAction)delegate:(id)sender;
- (IBAction)payAction:(id)sender;
- (IBAction)lijiPayAction:(id)sender;
- (IBAction)paySucceefOrderAction:(id)sender;
- (IBAction)defeatedOrderAction:(id)sender;
- (IBAction)orderAction:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *nameText;
@property (weak, nonatomic) IBOutlet UITextField *phoneText;

@property (weak, nonatomic) IBOutlet UIButton *numberP;
@property (weak, nonatomic) IBOutlet UILabel *priceLable;

@property(nonatomic,strong)BallSpellPrice *ballSpellPrice;
@property(nonatomic,strong)NSArray *numbersPerson;
@property(nonatomic,strong)NSString *numberPerson;
@property(nonatomic,strong)NSString *date;
@property(nonatomic,strong)NSString *time;
@property(nonatomic,strong)NSString *price;

@property (strong, nonatomic) IBOutlet UIView *ruleView;
@property (strong, nonatomic) IBOutlet UIView *delegateView;
@property (strong, nonatomic) IBOutlet UIView *payView;
@property (strong, nonatomic) IBOutlet UIView *paySucceedView;
@property (strong, nonatomic) IBOutlet UIView *defeatedView;
@property (strong, nonatomic) IBOutlet UIView *moneyNotHaveView;

@property (weak, nonatomic) IBOutlet UILabel *payNickLable;
@property (weak, nonatomic) IBOutlet UILabel *payDateTimeLable;
@property (weak, nonatomic) IBOutlet UILabel *payPriceLable;
@property (weak, nonatomic) IBOutlet UILabel *orderHowlLable;
@end

@implementation FillViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //适配IOS7
    if (([[[UIDevice currentDevice]systemVersion]doubleValue]>=7.0)) {
        self.navigationController.navigationBar.translucent=NO;
    }
    btnBoor=YES;
    self.numbersPerson=numbers;
    [self initValue];
    [self initLod];
    
}

-(void)initValue
{
    NSString *date=[[NSUserDefaults standardUserDefaults]objectForKey:@"date"];
    NSString *time=[[NSUserDefaults standardUserDefaults]objectForKey:@"time"];
    self.date=date;
    self.time=time;
    self.dateLable.text=self.date;
    self.timeLable.text=self.time;
    self.nickLable.text=self.nick;
    
    self.numberPerson=@"4";
    [self.numberP setTitle:self.numberPerson forState:UIControlStateNormal];
    
    [BallSpellAPI requestByCoursePriceID:self.courseID andCallback:^(id obj) {
        NSLog(@"%@",obj);
        self.ballSpellPrice=obj;
        self.price=self.ballSpellPrice.price;
        self.priceLable.text=[NSString stringWithFormat:@"金额：¥%@",self.price];
    }];
}

-(void)initLod
{
    self.title=@"订单填写";
    
    
}



//订单规则
- (IBAction)rule:(id)sender {
    //订单规则
    UIColor *color=[UIColor colorWithRed:0.0/255 green:136.0/255 blue:254.0/255 alpha:1];
    CGFloat w = self.ruleView.frame.size.width;
    CGFloat h = self.ruleView.frame.size.height;
    JKAlertDialog *alert=[[JKAlertDialog alloc]initWithTitle:@"订单规则" message:@"" color:color andBoolen:YES AlertsWidth:w AlertsHeight:h];
    alert.contentView=self.ruleView;
    [alert show];
}

//协议
- (IBAction)delegate:(id)sender {
    UIColor *color=[UIColor colorWithRed:254.0/255 green:0.0/255 blue:0.0/255 alpha:1];
    CGFloat w = self.delegateView.frame.size.width;
    CGFloat h = self.delegateView.frame.size.height;
    JKAlertDialog *alert=[[JKAlertDialog alloc]initWithTitle:@"协议" message:@"" color:color andBoolen:YES AlertsWidth:w AlertsHeight:h];
    alert.contentView=self.delegateView;
    [alert show];
}

//打球人数显示
- (IBAction)numberAction:(UIButton *)sender {
    if (btnBoor==YES) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(sender.frame.origin.x, sender.frame.origin.y+sender.frame.size.height, sender.frame.size.width, 100)];
        _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.backgroundColor=[UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1];
        [self.view addSubview:_tableView];
        btnBoor=NO;
    }else
    {
        btnBoor=YES;
        _tableView.hidden=YES;
    }
}

#pragma mark - datasoue/delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.numbersPerson.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellName=@"FillTableViewCell";
    FillTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (!cell) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"FillTableViewCell" owner:self options:nil]lastObject];
    }
    cell.number=self.numbersPerson[indexPath.row];
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 25;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *number=nil;
    NSUserDefaults *ud=[NSUserDefaults standardUserDefaults];
    switch (indexPath.row) {
        case 0:
        {
            [self.numberP setTitle:@"1" forState:UIControlStateNormal];
            number=@"1";
            [ud setValue:number forKey:@"numberPerson"];
            [ud synchronize];
            self.numberPerson=number;
            btnBoor=YES;
            _tableView.hidden=YES;
        }
            break;
        case 1:
        {
            [self.numberP setTitle:@"2" forState:UIControlStateNormal];
            number=@"2";
            [ud setValue:number forKey:@"numberPerson"];
            [ud synchronize];
            self.numberPerson=number;
            btnBoor=YES;
            _tableView.hidden=YES;
        }
            break;
        case 2:
        {
            [self.numberP setTitle:@"3" forState:UIControlStateNormal];
            number=@"3";
            [ud setValue:number forKey:@"numberPerson"];
            [ud synchronize];
            self.numberPerson=number;
            btnBoor=YES;
            _tableView.hidden=YES;
        }
            break;
        case 3:
        {
            [self.numberP setTitle:@"4" forState:UIControlStateNormal];
            number=@"4";
            [ud setValue:number forKey:@"numberPerson"];
            [ud synchronize];
            self.numberPerson=number;
            btnBoor=YES;
            _tableView.hidden=YES;
        }
            break;
        default:
            break;
    }
}

//点击支付按钮，弹出支付列表
- (IBAction)payAction:(id)sender {
    self.payNickLable.text=self.nick;
    self.payDateTimeLable.text=[NSString stringWithFormat:@"打球时间:%@ %@",self.date,self.time];
    self.payPriceLable.text=[NSString stringWithFormat:@"金额:¥ %@",self.price];
    UIColor *color=[UIColor colorWithRed:0.0/255 green:136.0/255 blue:254.0/255 alpha:1];
    CGFloat w = self.payView.frame.size.width;
    CGFloat h = self.payView.frame.size.height;
    JKAlertDialog *alert=[[JKAlertDialog alloc]initWithTitle:@"订单支付" message:@"" color:color andBoolen:YES AlertsWidth:w AlertsHeight:h];
    alert.contentView=self.payView;
    [alert show];
}

- (IBAction)lijiPayAction:(id)sender {
    //进入判断用户的余额是否足够，够就进入订单提交，不够就弹出提示，让用户取充值，跳转到充值页面
    if(/* DISABLES CODE */ (YES)){
        [BallSpellAPI sendOrdergolfCourseID:self.courseID andBookDate:self.date andBookTime:self.time andUserID:@"3" andNumberOFGroups:self.numberPerson andTotalPrice:self.price andCallback:^(id obj) {
            NSString *orderID=obj;
            if (orderID!=nil) {
                //支付成功
                self.payView.superview.superview.hidden=YES;
                self.orderHowlLable.text=orderID;
                UIColor *color=[UIColor colorWithRed:0.0/255 green:136.0/255 blue:254.0/255 alpha:1];
                CGFloat w = self.paySucceedView.frame.size.width;
                CGFloat h = self.paySucceedView.frame.size.height;
                JKAlertDialog *alert=[[JKAlertDialog alloc]initWithTitle:@"温馨提示" message:@"" color:color andBoolen:NO AlertsWidth:w AlertsHeight:h];
                alert.contentView=self.paySucceedView;
                [alert show];
            }else
            {
                self.payView.superview.superview.hidden=YES;
                //支付失败
                UIColor *color=[UIColor redColor];
                CGFloat w = self.defeatedView.frame.size.width;
                CGFloat h = self.defeatedView.frame.size.height;
                JKAlertDialog *alert=[[JKAlertDialog alloc]initWithTitle:@"温馨提示" message:@"" color:color andBoolen:NO AlertsWidth:w AlertsHeight:h];
                alert.contentView=self.defeatedView;
                [alert show];
            }
        }];
    }else{
        //余额不足
        UIColor *color=[UIColor colorWithRed:0.0/255 green:136.0/255 blue:254.0/255 alpha:1];
        CGFloat w = self.moneyNotHaveView.frame.size.width;
        CGFloat h = self.moneyNotHaveView.frame.size.height;
        JKAlertDialog *alert=[[JKAlertDialog alloc]initWithTitle:@"温馨提示" message:@"" color:color andBoolen:NO AlertsWidth:w AlertsHeight:h];
        alert.contentView=self.moneyNotHaveView;
        [alert show];
    }
}

- (IBAction)paySucceefOrderAction:(id)sender {
    NSLog(@"123456789支付成功");
    self.paySucceedView.superview.superview.hidden=YES;
    OrderTableViewController *vc=[[OrderTableViewController alloc]initWithNibName:@"OrderTableViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)defeatedOrderAction:(id)sender {
    NSLog(@"123456789支付失败");
    self.defeatedView.superview.superview.hidden=YES;
    OrderTableViewController *vc=[[OrderTableViewController alloc]initWithNibName:@"OrderTableViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)orderAction:(id)sender {
    self.moneyNotHaveView.superview.superview.hidden=YES;
    NSLog(@"123456789余额不足跳转进入充值页面");
}

/*手机号码验证 MODIFIED BY HELENSONG*/
-(BOOL) isValidateMobile:(NSString *)mobile
{
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    //    NSLog(@"phoneTest is %@",phoneTest);
    return [phoneTest evaluateWithObject:mobile];
}

//键盘收起事件
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    btnBoor=YES;
    _tableView.hidden=YES;
    [self.view endEditing:YES];
}


@end
