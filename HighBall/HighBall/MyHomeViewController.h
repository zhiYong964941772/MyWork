//
//  MyHomeViewController.h
//  golf
//
//  Created by MyMac on 15/4/30.
//  Copyright (c) 2015年 yuma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SKSTableView.h"
@interface MyHomeViewController : UIViewController<SKSTableViewDelegate>
@property (weak, nonatomic) IBOutlet SKSTableView *tableView;

@end
