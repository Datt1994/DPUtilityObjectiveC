//
//  NSDate+Utility.h
//  IBInspectableCategoryClassDemo
//
//  Created by datt on 20/03/18.
//  Copyright © 2018 datt. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
Date formats:
===============

MMM d, ''yy             Nov 4, '12
'Week' w 'of 52'        Week 45 of 52
'Day' D 'of 365'        Day 309 of 365
m 'minutes past' h      9 minutes past 8
h:mm a                  8:09 PM
HH:mm:ss's'             20:09:00s
HH:mm:ss:SS             20:09:00:00
h:mm a zz               8:09 PM CST
h:mm a zzzz             8:09 PM Central Standard Time
yyyy-MM-dd HH:mm:ss Z    2012-11-04 20:09:00 -0600

**/

#define DATE_FORMAT_YYYY_MM_DD_HH_MM_SS     @"yyyy-MM-dd HH:mm:ss"      //e.g. 1990-07-24 15:23:10
#define DATE_FORMAT_YYYY_MM_DD              @"yyyy-MM-dd"               //e.g. 1990-07-24

#define DATE_FORMAT_DD_MM_YYYY              @"dd-MM-yyyy"               //e.g. 24-07-1990
#define DATE_FORMAT_DD_MMM_YYYY             @"dd-MMM-yyyy"              //e.g. 24-Jul-1990
#define DATE_FORMAT_DD_MM_YYYY_HH_MM_12H    @"dd-MM-yyyy hh:mm a"       //e.g. 24-07-1990 05:20 AM
#define DATE_FORMAT_DD_MM_YYYY_HH_MM_SS     @"dd-MM-yyyy HH:mm:ss"      //e.g. 24-07-1990 15:20
#define DATE_FORMAT_DD_MM_YYYY_HH_MM_SS_12H @"dd-MM-yyyy hh:mm:ss a"    //e.g. 24-07-1990 05:20 AM

#define DATE_FORMAT_MM_DD_YYYY              @"MM-dd-yyyy"               //e.g. 07-24-1990
#define DATE_FORMAT_MMM_DD_YYYY             @"MMM dd, yyyy"             //e.g. Jul 24, 1990
#define DATE_FORMAT_MMMM_DD                 @"MMMM dd"                  //e.g. July 24
#define DATE_FORMAT_MMMM                    @"MMMM"                     //e.g. July, November
#define DATE_FORMAT_MMM_DD_YYYY_HH_MM_SS    @"MMM dd, yyyy hh:mm:ss a"  //e.g. Jul 24, 2014 05:20:50 AM
#define DATE_FORMAT_MMM_DD_YYYY_HH_MM_12H   @"MMM dd, yyyy hh:mm a"     //e.g. Jul 24, 2014 05:20 AM

#define DATE_FORMAT_HH_MM_SS                @"HH:mm:ss"                 //e.g. 15:20:50

#define DATE_FORMAT_E                       @"E"                        //e.g. Tue
#define DATE_FORMAT_EEEE                    @"EEEE"                     //e.g. Tuesday

#define DATE_FORMAT_QQQ                     @"QQQ"                      //e.g. Q1,Q2,Q3,Q4
#define DATE_FORMAT_QQQQ                    @"QQQQ"                     //e.g. 4th quarter






#define D_MINUTE     60
#define D_HOUR       3600
#define D_DAY        86400
#define D_WEEK       604800
#define D_YEAR       31556926

@interface NSDate(Utility)

+ (NSCalendar *) currentCalendar; // avoid bottlenecks

// Relative dates from the current date
+ (NSDate *) dateTomorrow;
+ (NSDate *) dateYesterday;
+ (NSDate *) dateWithDaysFromNow: (NSInteger) days;
+ (NSDate *) dateWithDaysBeforeNow: (NSInteger) days;
+ (NSDate *) dateWithHoursFromNow: (NSInteger) dHours;
+ (NSDate *) dateWithHoursBeforeNow: (NSInteger) dHours;
+ (NSDate *) dateWithMinutesFromNow: (NSInteger) dMinutes;
+ (NSDate *) dateWithMinutesBeforeNow: (NSInteger) dMinutes;

// Short string utilities
- (NSString *) stringWithDateStyle: (NSDateFormatterStyle) dateStyle timeStyle: (NSDateFormatterStyle) timeStyle;
- (NSString *) stringWithFormat: (NSString *) format;
@property (nonatomic, readonly) NSString *shortString;
@property (nonatomic, readonly) NSString *shortDateString;
@property (nonatomic, readonly) NSString *shortTimeString;
@property (nonatomic, readonly) NSString *mediumString;
@property (nonatomic, readonly) NSString *mediumDateString;
@property (nonatomic, readonly) NSString *mediumTimeString;
@property (nonatomic, readonly) NSString *longString;
@property (nonatomic, readonly) NSString *longDateString;
@property (nonatomic, readonly) NSString *longTimeString;

// Comparing dates
- (BOOL) isEqualToDateIgnoringTime: (NSDate *) aDate;

- (BOOL) isToday;
- (BOOL) isTomorrow;
- (BOOL) isYesterday;

- (BOOL) isSameWeekAsDate: (NSDate *) aDate;
- (BOOL) isThisWeek;
- (BOOL) isNextWeek;
- (BOOL) isLastWeek;

- (BOOL) isSameMonthAsDate: (NSDate *) aDate;
- (BOOL) isThisMonth;
- (BOOL) isNextMonth;
- (BOOL) isLastMonth;

- (BOOL) isSameYearAsDate: (NSDate *) aDate;
- (BOOL) isThisYear;
- (BOOL) isNextYear;
- (BOOL) isLastYear;

- (BOOL) isEarlierThanDate: (NSDate *) aDate;
- (BOOL) isLaterThanDate: (NSDate *) aDate;

- (BOOL) isInFuture;
- (BOOL) isInPast;

- (BOOL)isYearLeapYear ;

- (NSInteger)numnerOfDaysInCurrentYear ;

// Date roles
- (BOOL) isTypicallyWorkday;
- (BOOL) isTypicallyWeekend;

// Adjusting dates
- (NSDate *) dateByAddingYears: (NSInteger) dYears;
- (NSDate *) dateBySubtractingYears: (NSInteger) dYears;
- (NSDate *) dateByAddingMonths: (NSInteger) dMonths;
- (NSDate *) dateBySubtractingMonths: (NSInteger) dMonths;
- (NSDate *) dateByAddingDays: (NSInteger) dDays;
- (NSDate *) dateBySubtractingDays: (NSInteger) dDays;
- (NSDate *) dateByAddingHours: (NSInteger) dHours;
- (NSDate *) dateBySubtractingHours: (NSInteger) dHours;
- (NSDate *) dateByAddingMinutes: (NSInteger) dMinutes;
- (NSDate *) dateBySubtractingMinutes: (NSInteger) dMinutes;

// Date extremes
- (NSDate *) dateAtStartOfDay;
- (NSDate *) dateAtEndOfDay;

// Retrieving intervals
- (NSInteger) minutesAfterDate: (NSDate *) aDate;
- (NSInteger) minutesBeforeDate: (NSDate *) aDate;
- (NSInteger) hoursAfterDate: (NSDate *) aDate;
- (NSInteger) hoursBeforeDate: (NSDate *) aDate;
- (NSInteger) daysAfterDate: (NSDate *) aDate;
- (NSInteger) daysBeforeDate: (NSDate *) aDate;
- (NSInteger) distanceInDaysToDate:(NSDate *)anotherDate;

#pragma mark -

- (NSDate *)dateByTruncatingTime ;


// Decomposing dates
@property (readonly) NSInteger nearestHour;
@property (readonly) NSInteger hour;
@property (readonly) NSInteger minute;
@property (readonly) NSInteger seconds;
@property (readonly) NSInteger day;
@property (readonly) NSInteger month;
@property (readonly) NSInteger weekOfMonth;
@property (readonly) NSInteger weekOfYear;
@property (readonly) NSInteger weekday;
@property (readonly) NSInteger nthWeekday; // e.g. 2nd Tuesday of the month == 2
@property (readonly) NSInteger year;


@end
