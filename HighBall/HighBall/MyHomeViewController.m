//
//  MyHomeViewController.m
//  golf
//
//  Created by MyMac on 15/4/30.
//  Copyright (c) 2015年 yuma. All rights reserved.
//

#import "MyHomeViewController.h"
#import "SKSTableViewCell.h"
#import "SKSTableView.h"
//#import "PersonalInfoViewController.h"
//#import "courtOrderTableViewController.h"
//#import "packageOrderTableViewController.h"
//#import "TicketOrdersTableViewController.h"
//#import "HotelOrdersTableViewController.h"
//#import "GoodsOrdersTableViewController.h"
//#import "SelectBallFriendsTableViewController.h"
//#import "TRImagePickerController.h"

@interface MyHomeViewController ()<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (nonatomic, strong) NSMutableArray *contents;
@property(nonatomic,strong)NSMutableArray* muarray;

@end

@implementation MyHomeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"我的";
    [self BuildPageCode];
    
//    NSArray* array = @[@[@[@"全部订单", @"球场订单",@"套餐订单",@"机票订单",@"商品订单",@"酒店订单"]],
//                  @[@[@"我的球友", @"Row0_Subrow1", @"Row0_Subrow2", @"Row0_Subrow3"]]];
    NSArray * array1 = @[@[@"全部订单", @"球场订单",@"套餐订单",@"机票订单",@"商品订单",@"酒店订单"]];
    self.muarray = [[NSMutableArray alloc] initWithObjects:@"我的球友",nil];
    NSMutableArray* array2 = [[NSMutableArray alloc] initWithObjects:self.muarray, nil];
    _contents = [[NSMutableArray alloc] initWithObjects:array1,array2, nil];
   [self.muarray addObject:@"bbbb"];
    
    
}


-(void)BuildPageCode{
    
    
    
    
    self.tableView.SKSTableViewDelegate = self;
    
    UIBarButtonItem* bbi = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem = bbi;
    UILabel* lable = (UILabel*)[self.view viewWithTag:111];
    
    self.navigationController.navigationBar.barTintColor = lable.tintColor;
}

-(void)back{
    
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)onClick:(UIButton *)sender {
    UIActionSheet* action = nil;
    
    switch (sender.tag) {
        case 101:
            action = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"从相册选择", nil];
            [action showInView:self.view];
            break;
            }
    
    
    
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"%d",(int)buttonIndex);
    switch (buttonIndex) {
        case 0:{
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                UIImagePickerController *ipc = [[UIImagePickerController alloc]init];
                [ipc setSourceType:UIImagePickerControllerSourceTypeCamera];
                ipc.delegate = self;
                ipc.allowsEditing = YES;
                [self presentViewController:ipc animated:YES completion:nil];
            }else{
                NSLog(@"这设备没相机");
            }
            
        }
            
            break;
            
        case 1:{
            UIImagePickerController *ipc = [[UIImagePickerController alloc]init];
            [ipc setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
            ipc.delegate = self;
            ipc.allowsEditing = YES;
            ipc.title = @"aaaa";
            ipc.navigationBar.backgroundColor = [UIColor blueColor];
            [self presentViewController:ipc animated:YES completion:nil];
            
            
        }
            break;
    }
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"%d",(int)indexPath.row);
//    NSLog(@"%d",(int)indexPath.section);
//    courtOrderTableViewController* court = nil;
//    packageOrderTableViewController* pack = nil;
//    TicketOrdersTableViewController* ticket = nil;
//    HotelOrdersTableViewController* hotel = nil;
//    GoodsOrdersTableViewController* gotvc = nil;
//    SelectBallFriendsTableViewController* sbftvc = nil;
//    switch (indexPath.section) {
//        case 0:
//            switch (indexPath.row) {
//                case 1:
//                    court = [[courtOrderTableViewController alloc] initWithNibName:@"courtOrderTableViewController" bundle:nil];
//                    [self.navigationController pushViewController:court animated:YES];
//                    break;
//                case 2:
//                    pack = [[packageOrderTableViewController alloc] initWithNibName:@"packageOrderTableViewController" bundle:nil];
//                    [self.navigationController pushViewController:pack animated:YES];
//                    break;
//                case 3:
//                    ticket = [[TicketOrdersTableViewController alloc] initWithNibName:@"TicketOrdersTableViewController" bundle:nil];
//                    [self.navigationController pushViewController:ticket animated:YES];
//                    break;
//                case 4:
//                    gotvc = [[GoodsOrdersTableViewController alloc] initWithNibName:@"GoodsOrdersTableViewController" bundle:nil];
//                    [self.navigationController pushViewController:gotvc animated:YES];
//                    break;
//                case 5:
//                    hotel = [[HotelOrdersTableViewController alloc] initWithNibName:@"HotelOrdersTableViewController" bundle:nil];
//                    [self.navigationController pushViewController:hotel animated:YES];
//                    break;
//            }
//            break;
//        case 1:
//            
//            sbftvc = [[SelectBallFriendsTableViewController alloc] initWithNibName:@"SelectBallFriendsTableViewController" bundle:nil];
//            [self.navigationController pushViewController:sbftvc animated:YES];
//            
//            break;
//    }
//    
//    
//}
//
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    
    UIImage *imagee = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    UIButton* button = (UIButton*)[self.view viewWithTag:101];
    
    [button setImage:imagee forState:UIControlStateNormal];
    
    
    [self dismissViewControllerAnimated:YES completion:nil];

}



//--------------------------------


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.contents count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.contents[section] count];
}

- (NSInteger)tableView:(SKSTableView *)tableView numberOfSubRowsAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.contents[indexPath.section][indexPath.row] count] - 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SKSTableViewCell";
    
    SKSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell)
        cell = [[SKSTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
    cell.textLabel.text = self.contents[indexPath.section][indexPath.row][0];
    
    if ((indexPath.section == 0 && (indexPath.row == 1 || indexPath.row == 0)) || (indexPath.section == 1 && (indexPath.row == 0 || indexPath.row == 2)))
        cell.isExpandable = YES;
    
    else
        cell.isExpandable = NO;
   
    
    
    
    if (indexPath.section == 1) {
        
        cell.isExpandable = NO;
    }
    UIImageView* im = [[UIImageView alloc] initWithFrame:CGRectMake(293, 13, 13, 16)];
    im.image = [UIImage imageNamed:@"箭头"];
    
    
    [cell.contentView addSubview:im];
    return cell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForSubRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"UITableViewCell";
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", self.contents[indexPath.section][indexPath.row][indexPath.subRow]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    UILabel* lable1 = (UIButton*)[self.view viewWithTag:111];
    cell.textLabel.textColor = lable1.tintColor;
    return cell;
}






/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
