//
//  BallSpellDetailsViewController.m
//  HighBall
//
//  Created by imac on 15-4-25.
//  Copyright (c) 2015年 YM. All rights reserved.
//

#import "BallSpellDetailsViewController.h"
#import "BallSpellAPI.h"
#import "CourselInfo.h"

@interface BallSpellDetailsViewController ()<UITextViewDelegate>
@property(nonatomic,strong)CourselInfo *courselInfo;
;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *courseType;
@property (weak, nonatomic) IBOutlet UITextView *featrue;
@property (weak, nonatomic) IBOutlet UITextView *introduction;
@property (weak, nonatomic) IBOutlet UILabel *ballType;
@property (weak, nonatomic) IBOutlet UILabel *courseLength;
@property (weak, nonatomic) IBOutlet UILabel *courseHoles;
@property (weak, nonatomic) IBOutlet UILabel *courseArea;
@property (weak, nonatomic) IBOutlet UILabel *createDate;
@property (weak, nonatomic) IBOutlet UILabel *courseDesign;
@property (weak, nonatomic) IBOutlet UILabel *GreensGrass;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *tel;

@end

@implementation BallSpellDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //适配IOS7
    if (([[[UIDevice currentDevice]systemVersion]doubleValue]>=7.0)) {
        self.navigationController.navigationBar.translucent=NO;
    }
    [self initValue];
    [self initLod];
}

-(void)initValue
{
    //数据请求，得到球场具体信息
    [BallSpellAPI requestByGolfCourseID:self.courselID andCallBack:^(id obj) {
        self.courselInfo=obj;
        //对关联控件进行附值
        self.courseType.text=self.courselInfo.courseType;
        self.featrue.text=self.courselInfo.featrue;
        self.introduction.text=self.courselInfo.introduction;
        self.ballType.text=self.courselInfo.courseType;
        self.courseLength.text=self.courselInfo.courseLength;
        self.courseHoles.text=self.courselInfo.courseHoles;
        self.courseArea.text=self.courselInfo.courseArea;
        self.createDate.text=self.courselInfo.createDate;
        self.courseDesign.text=self.courselInfo.courseDesign;
        self.GreensGrass.text=self.courselInfo.GreensGrass;
        self.address.text=self.courselInfo.address;
        self.tel.text=self.courselInfo.tel;
    }];
}

-(void)initLod
{
    //设置textView的代理，让他不能编辑
    self.featrue.delegate=self;
    self.introduction.delegate=self;
    
    self.title=@"球场详细";
    
    }

- (IBAction)mapAction:(id)sender {
    NSLog(@"123456789");
}

//设置textView不可编辑
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    return NO;
}

-(void)updateViewConstraints
{
    [super updateViewConstraints];
    
}

@end
