//
//  xinZengViewController.m
//  HighBall
//
//  Created by imac on 15-8-26.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "xinZengViewController.h"
#import "credentialsViewController.h"
@interface xinZengViewController ()
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *phoneNum;
@property (weak, nonatomic) IBOutlet UILabel *credentialsName;
@property (weak, nonatomic) IBOutlet UITextField *credentials;
@end

@implementation xinZengViewController
void(^credentialsName)(NSString *credential);
- (void)viewDidLoad {
    [super viewDidLoad];
     [self initWithCredentials];
   }
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    credentialsName = ^(NSString *credential){
        self.credentialsName.text = credential;
    };

}
- (void)initWithCredentials{
    self.credentialsName.text = self.credentials.text;
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(BtnBlock)];
    self.navigationItem.rightBarButtonItem = rightBtn;
   
}
- (void)BtnBlock{
    self.nameAndPhone(self.name.text,self.phoneNum.text);
        [self.navigationController popViewControllerAnimated:YES];
    
    
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];

}
- (IBAction)credentials:(UIButton *)sender {
    credentialsViewController *Cvc = [[credentialsViewController alloc]initWithNibName:@"credentialsViewController" bundle:nil];
    Cvc.blockOfcredential = credentialsName;
    [self.navigationController pushViewController:Cvc animated:YES];
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    
    
}
@end
