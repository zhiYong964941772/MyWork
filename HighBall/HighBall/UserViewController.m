//
//  UserViewController.m
//  HighBall
//
//  Created by imac on 15-7-29.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "UserViewController.h"
#import "AFNetworking.h"

@interface UserViewController ()<UIActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundView;
@property (assign,nonatomic)BOOL isFullScreen;
@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isFullScreen = YES;
    }
- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
//创建提示功能模块，调用系统功能。
- (IBAction)photoImage:(UIButton *)sender {
    UIActionSheet *action;
    //判断是否支持相机的功能
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        action = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"照相" otherButtonTitles:@"从相册选择", nil];
    }else{
        
         action = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"取消" otherButtonTitles:@"从相册选择", nil];
    }
    action.tag = 255;
    [action showInView:self.view];//功能显示的位置
 }
//功能视图显示是调用的方法
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    /*
     buttonIndex是功能模块的按钮的位置 */
    
    if (actionSheet.tag == 255) {
        NSUInteger sourceType = 0;
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            switch (buttonIndex) {
                case 0:
                    return;
                    break;
                    case 1:
                    sourceType = UIImagePickerControllerSourceTypeCamera;
                    break;
                    case 2:
                    sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                    break;
            }
        }else{
            if (buttonIndex == 0) {
                return;
            }else{
                sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
            }
            
            
        }
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];//创建图片采集类
        imagePickerController.delegate = self;
        imagePickerController.allowsEditing = YES;
        imagePickerController.sourceType = sourceType;
        [self presentViewController:imagePickerController animated:YES completion:nil];
    }
    
    
    
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self saveImage:image WithName:@"currentImage.png"];
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]stringByAppendingPathComponent:@"currentImage.png"];
    UIImage *savedImage = [[UIImage alloc]initWithContentsOfFile:fullPath];
    self.isFullScreen = NO;
    [self.userImage setImage:savedImage];
    self.userImage.tag = 100;
    
    
    
    
}
//点击cancel的时候调用的方法
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:nil];
}
//
- (void)saveImage:(UIImage *)image WithName:(NSString *)name{
    NSData *imageData = UIImageJPEGRepresentation(image, 0.5);
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]stringByAppendingPathComponent:name];
    [imageData writeToFile:fullPath atomically:NO];
    
    
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    self.isFullScreen = !self.isFullScreen;
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self.view];
    CGPoint imagePoint = self.userImage.frame.origin;
    if (imagePoint.x <= touchPoint.x&& imagePoint.x+self.userImage.frame.size.width>=touchPoint.x && imagePoint.y<=touchPoint.y) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:1];
    }if (self.isFullScreen) {
        self.userImage.frame = CGRectMake(0, 0, 320, 480);
    }else{
        self.userImage.frame = CGRectMake(0, 0, 60, 60);
    }
    [UIView commitAnimations];
    
    
}
@end
