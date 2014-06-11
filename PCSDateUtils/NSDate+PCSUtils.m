//====================================================================================================
// Author: Peter Chen
// Created: 6/10/14
// Copyright 2014 pchensoftware
//====================================================================================================

#import "NSDate+PCSUtils.h"


@implementation NSDate (PCSUtils)

- (NSDate *)roundTo15Minutes {
   return [self roundToMinutes:15];
}

- (NSDate *)roundTo30Minutes {
   return [self roundToMinutes:30];
}

- (NSDate *)roundToMinutes:(int)minutes {
   NSDateComponents *components = [[NSCalendar currentCalendar] components:NSYearMonthDayHourMinuteCalendarUnit fromDate:self];
   components.minute = roundf(components.minute / ((float)minutes)) * minutes;
   return [[NSCalendar currentCalendar] dateFromComponents:components];
}

- (NSDate *)removeTime {
   NSDateComponents *components = [[NSCalendar currentCalendar] components:NSYearMonthDayCalendarUnit fromDate:self];
   return [[NSCalendar currentCalendar] dateFromComponents:components];
}

- (BOOL)isInPast {
   return [self isBeforeDate:[NSDate date]];
}

- (BOOL)isBeforeDate:(NSDate *)date {
   return [self compare:date] == NSOrderedAscending;
}

- (BOOL)isAfterDate:(NSDate *)date {
   return [self compare:date] == NSOrderedDescending;
}

- (BOOL)isToday {
   return [self isEqualToDateIgnoringTime:[NSDate date]];
}

- (BOOL)isYesterday {
   return [self isEqualToDateIgnoringTime:[NSDate dateWithTimeIntervalSinceNow:(-24 * 3600)]];
}

- (BOOL)isEqualToDateIgnoringTime:(NSDate *)date {
   NSDateComponents *components1 = [[NSCalendar currentCalendar] components:NSYearMonthDayCalendarUnit fromDate:self];
   NSDateComponents *components2 = [[NSCalendar currentCalendar] components:NSYearMonthDayCalendarUnit fromDate:date];
   return (components1.year == components2.year && components1.month == components2.month && components1.day == components2.day);
}

- (void)getDayBoundsForDate:(NSDate *)date startDate:(NSDate **)startDate endDate:(NSDate **)endDate {
   NSDateComponents *noHourComponents = [[NSCalendar currentCalendar] components:NSYearMonthDayCalendarUnit fromDate:date];
   *startDate = [[NSCalendar currentCalendar] dateFromComponents:noHourComponents];
   *endDate = [*startDate dateByAddingTimeInterval:24*3600];
}

@end
