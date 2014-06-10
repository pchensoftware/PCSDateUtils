//====================================================================================================
// Author: Peter Chen
// Created: 6/10/14
// Copyright 2014 pchensoftware
//====================================================================================================

#import <Foundation/Foundation.h>

#define NSYearMonthDayHourMinuteCalendarUnit (NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit)
#define NSYearMonthDayHourCalendarUnit       (NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit)
#define NSYearMonthDayCalendarUnit           (NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit)
#define NSYearMonthCalendarUnit              (NSYearCalendarUnit|NSMonthCalendarUnit)

@interface NSDate (PCSUtils)

- (NSDate *)roundTo15Minutes;
- (NSDate *)roundTo30Minutes;
- (NSDate *)roundToMinutes:(int)minutes;
- (BOOL)isInPast;
- (BOOL)isBeforeDate:(NSDate *)date;
- (BOOL)isAfterDate:(NSDate *)date;
- (BOOL)isToday;
- (BOOL)isYesterday;
- (BOOL)isEqualToDateIgnoringTime:(NSDate *)date;

@end
