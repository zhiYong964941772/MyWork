//
//  longShopViewController.m
//  HighBall
//
//  Created by imac on 15-8-4.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "longShopViewController.h"
#import "TableViewCell.h"
#import "parameterTableViewCell.h"
@interface longShopViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *shopMaintable;
@property (weak, nonatomic) IBOutlet UITableView *shopsecondtable;

@end

@implementation longShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.shopMaintable.delegate = self;
    self.shopMaintable.dataSource = self;
    self.shopsecondtable.delegate =self;
    self.shopsecondtable.dataSource = self;
    self.title = @"商品详情";
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.shopMaintable) {
        return 5;
    }
    else{
        return 5;
    }
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.shopMaintable) {
        TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"TableViewCell" owner:self options:nil]lastObject];
        }
        UIImage *image = [UIImage imageNamed:@"0abb46c72c730df531d8331830de35ee.jpg"];
        
        cell.authorImage.image =image;
        cell.authorImage.frame = CGRectMake(0, 0, 200, 200);
        return cell;
    }
    else{
        parameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"parameter"];
        if (!cell) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"parameterTableViewCell" owner:self options:nil]lastObject];
        }
        cell.Mainlabel.text = @"主体";
        cell.secondlabel.text = @"高大上";
        
        return cell;
    }
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.shopMaintable) {
        return 200;
    }
    else{
        return 40;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
- (IBAction)shopButton:(UIButton *)sender {
    if (sender.tag == 0) {
        self.shopsecondtable.hidden = YES;
    }else{
        self.shopsecondtable.hidden = NO;
    }
    
    
    
    
    
    
    
    
}


@end
