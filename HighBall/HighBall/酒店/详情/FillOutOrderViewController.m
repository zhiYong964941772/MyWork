//
//  FillOutOrderViewController.m
//  HighBall
//
//  Created by imac on 15-7-4.
//  Copyright (c) 2015年 YM. All rights reserved.
//
#define numbers @[@"1间",@"2间",@"3间",@"4间",@"5间",@"6间"]

#import "FillOutOrderViewController.h"
#import "JKAlertDialog.h"
#import "PayWayViewController.h"
#import "YMNumbers.h"
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>


@interface FillOutOrderViewController ()<ABPeoplePickerNavigationControllerDelegate>
@property(nonatomic,strong)NSArray *numbersArr;


- (IBAction)numberSpeces:(id)sender;
- (IBAction)addressBooks:(id)sender;
- (IBAction)leavePay:(id)sender;
- (IBAction)definiteDetailed:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *paySuccessView;
@property (weak, nonatomic) IBOutlet UILabel *prices;

@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *phoneLable;

@end

@implementation FillOutOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(fillOut:) name:@"fillOut" object:nil];
    self.title=@"订单选择";
}

-(void)initValue
{
    self.nameLable.text=@"朱晓旭";
    self.phoneLable.text=@"15946632548";
}

-(void)fillOut:(NSNotification *)noti
{
    NSString *number=[noti.userInfo objectForKey:@"number"];
    self.numberSpece.text=number;
    NSUserDefaults *ud=[NSUserDefaults standardUserDefaults];
    [ud setObject:number forKey:@"spespe"];
    [ud synchronize];
    NSLog(@"gdfsjgjdfjs=%@",[ud objectForKey:@"spespe"]);
}

- (IBAction)numberSpeces:(id)sender {
    YMNumbers *view=[[YMNumbers alloc]init];
    view.numbersArr=numbers;
    UIColor *color=[UIColor colorWithRed:0.0/255 green:136.0/255 blue:254.0/255 alpha:1];
  CGFloat w = view.frame.size.width;
    CGFloat h = view.frame.size.height;

    JKAlertDialog *alert=[[JKAlertDialog alloc]initWithTitle:@"房间数选择" message:@"" color:color andBoolen:YES AlertsWidth:w AlertsHeight:h];
    alert.contentView=view;
    [alert show];
}

- (IBAction)addressBooks:(id)sender {
    NSLog(@"addressBooks");
    ABPeoplePickerNavigationController *peoplePicker = [[ABPeoplePickerNavigationController alloc] init];
    peoplePicker.peoplePickerDelegate = self;
    [self presentViewController:peoplePicker animated:YES completion:nil];
}

- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker didSelectPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier {
    ABMultiValueRef phone = ABRecordCopyValue(person, kABPersonPhoneProperty);
    long index = ABMultiValueGetIndexForIdentifier(phone,identifier);
    NSString *phoneNO = (__bridge NSString *)ABMultiValueCopyValueAtIndex(phone, index);
    phoneNO = [phoneNO stringByReplacingOccurrencesOfString:@"-" withString:@""];
    NSLog(@"%@", phoneNO);
    self.phoneLable.text=phoneNO;
}

- (IBAction)leavePay:(id)sender {
    NSLog(@"leavePay");
    PayWayViewController *vc=[[PayWayViewController alloc]initWithNibName:@"PayWayViewController" bundle:nil];
    vc.payName=@"广州国德大舅袋米";
    vc.payPrice=@"2400";
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)definiteDetailed:(id)sender {
    NSLog(@"definiteDetailed");
}
@end
