//
//  FillViewController.h
//  HighBall
//
//  Created by imac on 15-7-6.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FillViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    //下拉列表
    UITableView *_tableView;
    
}

@property(nonatomic,strong)NSString *courseID;
@property(nonatomic,strong)NSString *nick;

@end
