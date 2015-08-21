










#import "foolView.h"
#import "CKViewController.h"
#import "CKCalendarView.h"
#import "JKAlertDialog.h"
#define Frame [[UIScreen mainScreen]bounds]
#define Color(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
static NSInteger num = 1;//商品的数量

@interface CKViewController ()
@property (nonatomic,strong)foolView *fool;
@property (nonatomic,strong)CKCalendarView *calendar;
@property (nonatomic,strong)UILabel *sum;

@end

@implementation CKViewController

- (id)init {
    self = [super init];
    if (self) {
       
        
        CKCalendarView *calendar = [[CKCalendarView alloc] initWithStartDay:startMonday];
        CGRect frame = [[UIScreen mainScreen]bounds];
        calendar.frame = CGRectMake(frame.size.width/2-calendar.frame.size.width/2-5, 10, 330, 200);
        NSLog(@"%@",CGSizeCreateDictionaryRepresentation(calendar.frame.size));
        UIView *backgrouView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Frame.size.width, calendar.frame.size.height+164)];
        backgrouView.backgroundColor = [UIColor whiteColor];
        [backgrouView addSubview:calendar];
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, Frame.size.height-calendar.frame.size.height-90, Frame.size.width, 135)];
        self.fool = [[foolView alloc]init];
        [self.fool show];
        
        view.backgroundColor = [UIColor whiteColor];
        [self initWithView:view];
       
        [self.view addSubview:view];
        
        [self.view addSubview:backgrouView];
        [self.view addSubview:self.fool];
        self.view.backgroundColor = Color(230,230,230);
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = @"选择日期／人数";
    [[NSNotificationCenter defaultCenter]postNotificationName:@"title" object:nil userInfo:@{@"name":self.title}];
}
/**
 *  配置界面的控件
 *
 *  @param view
 */
- (void)initWithView:(UIView*)view{
    
    
    UILabel *one = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, view.frame.size.width, 30)];
    one.font = [UIFont fontWithName:@"黑色－粗体" size:17];
    one.text = @"选择出行人数";
    [view addSubview:one];
    
    
    
    //减少
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(10,25 , 30, 30);
    [btn1 setImage:[UIImage imageNamed:@"iconfont-14052230"] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(jiaAndjian:) forControlEvents:UIControlEventTouchUpInside];
    [btn1 setTag:0];
    [view addSubview:btn1];
    
    
    
    //显示
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(btn1.frame.origin.x+btn1.frame.size.width-4, 27, 25, 25)];
    self.sum = label;
    label.backgroundColor = [UIColor blueColor];
    label.font = [UIFont systemFontOfSize:15];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"1";
    [view addSubview:label];
    
    
    
    //增加
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(label.frame.origin.x + 20, 25, 30, 30);
    [btn2 setImage:[UIImage imageNamed:@"iconfont-14052229"] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(jiaAndjian:) forControlEvents:UIControlEventTouchUpInside];
    [btn2 setTag:1];
    [view addSubview:btn2];
    //分割线
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, btn2.frame.origin.y+btn2.frame.size.height+10, Frame.size.width-20, 1)];
    imageView.backgroundColor = [UIColor grayColor];
    [view addSubview:imageView];
    
    /**
     注意事项
     */
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(10, imageView.frame.origin.y+5,150 , 20)];
    label2.text = @"最少1人起订";
    label2.font = [UIFont systemFontOfSize:13];
    label2.textColor = Color(134,134,134);
    [view addSubview:label2];
    UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(10, label2.frame.origin.y+20, 150, 20)];
    label3.text = @"儿童价标准：2 - 12岁";
    label3.font = [UIFont systemFontOfSize:13];
    label3.textColor = Color(134,134,134);
    [view addSubview:label3];
    UILabel *label4 = [[UILabel alloc]initWithFrame:CGRectMake(10, label3.frame.origin.y+20, 300, 20)];
    label4.text = @"0 - 2岁的儿童不接受在线预定，请联系客服下单";
    label4.font = [UIFont systemFontOfSize:13];
    label4.textColor = Color(134,134,134);
    [view addSubview:label4];
}
/**
 *  人数变化而产生的费用
 *
 *  @param sender
 */
-(void)jiaAndjian:(UIButton*)sender{
    /**
     *  创建监听事件，时刻注意数量的变化
     */
        switch (sender.tag) {
        case 0:
            if (num >1) {
                num--;
            }
                [[NSNotificationCenter defaultCenter]postNotificationName:@"num" object:nil userInfo:@{@"num":[NSString stringWithFormat:@"%ld",(long)num]}];
            self.sum.text = [NSString stringWithFormat:@"%ld",(long)num];
            
            break;
            
       case 1:
            num++;
            
[[NSNotificationCenter defaultCenter]postNotificationName:@"num" object:nil userInfo:@{@"num":[NSString stringWithFormat:@"%ld",(long)num]}];
            self.sum.text = [NSString stringWithFormat:@"%ld",(long)num];
            

            break;
    }
    
    
    
    
}
    

    

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end