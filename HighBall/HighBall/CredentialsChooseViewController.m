//
//  CredentialsChooseViewController.m
//  HighBall
//
//  Created by imac on 15-7-10.
//  Copyright (c) 2015年 YM. All rights reserved.
//
#define credentials @[@"身份证",@"护照",@"台胞证",@"回乡证",@"军人证",@"港澳通行证",@"户口簿",@"出生证明",@"其他证"]
#import "CredentialsChooseViewController.h"

@interface CredentialsChooseViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property(nonatomic,strong)NSArray *credentialsArr;
@end

@implementation CredentialsChooseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableview.delegate=self;
    self.tableview.dataSource=self;
    self.credentialsArr=credentials;
    
    self.title=@"可选列表";
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.credentialsArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIndentifer=@"Cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIndentifer];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifer];
    }
    UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(20, 12, 200, 20)];
    lable.text=self.credentialsArr[indexPath.row];
    [cell.contentView addSubview:lable];
    
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, cell.contentView.frame.size.height-1, cell.contentView.frame.size.width, 1)];
    imageView.backgroundColor=[UIColor grayColor];
    [cell.contentView addSubview:imageView];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.delegate CredentialsChooseViewController:self returnInput:self.credentialsArr[indexPath.row]];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
