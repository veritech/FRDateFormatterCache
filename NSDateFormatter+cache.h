//
//  NSDateFormatter+cache.h
//
//  Created by Jonathan Dalrymple on 25/11/2013.
//  Copyright (c) 2014 Float-Right Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (FRDateFormatter_cache)

/**
 *  Format a date as a string. The date formatter is cached
 *  @param  aFormat A String format
 *  @param  aDate A Date to format
 *  @return The formatted string
 */
+ (NSString *)stringWithFormat:(NSString *)aFormat
                          date:(NSDate *)aDate;

/**
 *  Format a date as a string. The date formatter is cached
 *  @param  aFormat A String format
 *  @param  aDateString A Date to string to parse
 *  @return The date parsed with the format string
 */
+ (NSDate *)dateWithFormat:(NSString *)aFormat
                    string:(NSString *)aDateString;

/**
 *  Format a date as a string. The date formatter is cached
 *  @param  aFormat A String format
 *  @param  aDate A Date to format
 *  @param  usingLocalisation A BOOL value indicates wether the formatter should use device's locale settings
 *  @return The formatted string
 */
+ (NSString *)stringWithFormat:(NSString *)aFormat
                          date:(NSDate *)aDate
             usingLocalisation:(BOOL)usingLocalisation;
@end
