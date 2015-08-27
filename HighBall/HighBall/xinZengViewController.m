//
//  xinZengViewController.m
//  HighBall
//
//  Created by imac on 15-8-26.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "xinZengViewController.h"

@interface xinZengViewController ()
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *phoneNum;
@property (weak, nonatomic) IBOutlet UILabel *credentialsName;

@property (weak, nonatomic) IBOutlet UITextField *credentials;
@end

@implementation xinZengViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initWithCredentials];
}
- (void)initWithCredentials{
    self.credentialsName.text = self.credentials.text;
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(BtnBlock)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
}
- (void)BtnBlock{
    
    self.credentialsBlock(self.name.text,self.phoneNum.text,self.credentials.text);
 
    
}
-(void)credentialsNameWithBlock:(credentialsName)credentials{
    credentials = self.credentialsBlock;
    
    
}
- (IBAction)credentials:(UIButton *)sender {
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    
    
}
@end
