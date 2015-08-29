//
//  credentialsViewController.m
//  HighBall
//
//  Created by imac on 15-8-29.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "credentialsViewController.h"
#define UIFrame [[UIScreen mainScreen]bounds]
@interface credentialsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *credentialsTableView;
@property (nonatomic,strong)NSArray *allCredentials;
@property (nonatomic,strong)UIButton *btn;
@end

@implementation credentialsViewController
static NSString *Id = @"Cell";
- (NSArray *)allCredentials{
    if (!_allCredentials) {
        _allCredentials = @[@"身份证",@"护照",@"台胞证",@"回乡证",@"军人证",@"港澳通行证",@"户口本",@"出生证明",@"其他"];
    }
    return _allCredentials;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"选择证件";
    [self.credentialsTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:Id];
  }
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.allCredentials.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Id];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Id];
    }
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btn = btn;
    btn.frame = cell.frame;
    [btn addTarget:self action:@selector(selected:) forControlEvents:UIControlEventTouchUpInside];
    btn.userInteractionEnabled = YES;
    [cell.contentView addSubview:btn];
    cell.textLabel.text = self.allCredentials[indexPath.row];
    return cell;
    
    
    
}
- (void)selected:(UIButton *)sender{
    if (sender.selected == NO) {
        [sender setBackgroundColor:[UIColor blueColor]];
        sender.selected = !sender.selected;
    }
    else{
        [sender setBackgroundColor:[UIColor whiteColor]];
        sender.selected = !sender.selected;

    }
    
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.btn.selected == NO) {
        self.blockOfcredential(self.allCredentials[indexPath.row]);
        [self.navigationController popViewControllerAnimated:YES];
    }
    
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 42;
}
@end
