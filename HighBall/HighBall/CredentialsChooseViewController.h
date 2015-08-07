//
//  CredentialsChooseViewController.h
//  HighBall
//
//  Created by imac on 15-7-10.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InsertPersonViewController.h"
@class CredentialsChooseViewController;
@protocol CredentialsChooseViewControllerDelegate <NSObject>

-(void)CredentialsChooseViewController:(CredentialsChooseViewController *)sender returnInput:(NSString *)value;

@end

@interface CredentialsChooseViewController : UIViewController

@property(nonatomic,strong)id <CredentialsChooseViewControllerDelegate> delegate;


@end
