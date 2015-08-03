//
//  WQCalendarDay.m
//  WQCalendar
//



#import "CalendarDayModel.h"

@implementation CalendarDayModel


//公共的方法
+ (CalendarDayModel *)calendarDayWithYear:(NSUInteger)year month:(NSUInteger)month day:(NSUInteger)day
{
    CalendarDayModel *calendarDay = [[CalendarDayModel alloc] init];//初始化自身
    calendarDay.year = year;//年
    calendarDay.month = month;//月
    calendarDay.day = day;//日

    return calendarDay;
}


//返回当前天的NSDate对象
- (NSDate *)date
{
    NSDateComponents *c = [[NSDateComponents alloc] init];
    c.year = self.year;
    c.month = self.month;
    c.day = self.day;
    return [[NSCalendar currentCalendar] dateFromComponents:c];
}

//返回当前天
-(NSString *)daya
{
    NSDate *date=[self date];
    NSString *day=[date dateFromDay:date];
    return day;
}

-(NSString *)montha
{
    NSDate *date=[self date];
    NSString *month=[date dateFromMonth:date];
    return month;
}
//返回当前月


//返回当前天的NSString对象
- (NSString *)toString
{
    NSDate *date = [self date];
    NSString *string = [date stringFromDate:date];
    return string;
}


//返回星期
- (NSString *)getWeek
{

    NSDate *date = [self date];
    
    NSString *week_str = [date compareIfTodayWithDate];

    return week_str;
}

//判断是不是同一天
- (BOOL)isEqualTo:(CalendarDayModel *)day
{
    BOOL isEqual = (self.year == day.year) && (self.month == day.month) && (self.day == day.day);
    return isEqual;
}

@end
