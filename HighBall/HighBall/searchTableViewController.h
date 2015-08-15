//
//  searchTableViewController.h
//  HighBall
//
//  Created by imac on 15-8-15.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface searchTableViewController : UITableViewController{
    NSInteger endSection;
    NSInteger didSection;
    BOOL ifOpen;

}
@property (nonatomic,retain)NSMutableArray *array;
@end
