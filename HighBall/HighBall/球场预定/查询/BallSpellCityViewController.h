//
//  BallSpellCityViewController.h
//  HighBall
//
//  Created by imac on 15-6-16.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BallSpellCityViewController;
@interface BallSpellCityViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{

    IBOutlet UITableView *mainTable;
    NSInteger endSection;
    NSInteger didSection;
    BOOL ifOpen;
}
@property (nonatomic,retain)NSMutableArray *array;
@end
