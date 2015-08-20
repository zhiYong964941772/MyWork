#import "CKViewController.h"
#import "CKCalendarView.h"
#define Frame [[UIScreen mainScreen]bounds]
@interface CKViewController ()
@property (nonatomic,strong)UIView *landView;
@property (nonatomic,strong)CKCalendarView *calendar;
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
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, Frame.size.height-calendar.frame.size.height-90, Frame.size.width, 100)];
        view.backgroundColor = [UIColor whiteColor];
        [self initWithView:view];
        [self.view addSubview:view];
        
        [self.view addSubview:backgrouView];
        
        self.view.backgroundColor = [UIColor grayColor];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = @"选择日期／人数";
   
}

- (void)initWithView:(UIView*)view{
    UILabel *one = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, view.frame.size.width, 30)];
    one.font = [UIFont fontWithName:@"黑色－粗体" size:17];
    one.text = @"选择出行人数";
    [view addSubview:one];
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(10,35 , 20, 20);
    [btn1 setImage:[UIImage imageNamed:@"iconfont-14052230"] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(jia) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn1];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(btn1.frame.origin.x+btn1.frame.size.width-2, 40, 30, 15)];
    label.backgroundColor = [UIColor blueColor];
    label.font = [UIFont systemFontOfSize:15];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"1";
    [view addSubview:label];
    
}
-(void)jia{
    NSLog(@"0000");
    
    
    
    
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