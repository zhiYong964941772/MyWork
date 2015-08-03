//
//  InsertPersonViewController.m
//  HighBall
//
//  Created by imac on 15-7-10.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "InsertPersonViewController.h"
#import "CredentialsChooseViewController.h"


@interface InsertPersonViewController ()<CredentialsChooseViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *cardLable;
- (IBAction)credentialsChooseAction:(id)sender;

@end

@implementation InsertPersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"条件选择";
}

-(void)CredentialsChooseViewController:(CredentialsChooseViewController *)sender returnInput:(NSString *)value
{
   self.cardLable.text=value;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setCertificateID:(NSString *)certificateID
{
   _certificateID=certificateID;
   self.cardLable.text=certificateID;
}

- (IBAction)credentialsChooseAction:(id)sender {
   CredentialsChooseViewController *vc=[[CredentialsChooseViewController alloc]initWithNibName:@"CredentialsChooseViewController" bundle:nil];
   vc.delegate=self;
   [self.navigationController pushViewController:vc animated:YES];
}

@end
