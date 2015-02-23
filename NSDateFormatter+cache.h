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
 *  @param  timezoneName The timezone name ie. UTC
 *  @param  localeIdentifier The locale identifier ie. en_US
 *  @param  aDate A Date to format
 *  @return The formatted string
 */
+ (NSString *)stringWithFormat:(NSString *)aFormat
                      timezone:(NSString *)timezoneName
                        locale:(NSString *)localeIdentifier
                          date:(NSDate *)aDate;

/**
 *  Parse a string into a date, the date formatter is cached
 *  @param  aFormat A String format
 *  @param  aDateString A Date to string to parse
 *  @return The date parsed with the format string
 */
+ (NSDate *)dateWithFormat:(NSString *)aFormat
                    string:(NSString *)aDateString;

/**
 *  Parse a string into a date, the date formatter is cached
 *  @param  aFormat A String format
 *  @param  timezoneName The timezone name ie. UTC
 *  @param  localeIdentifier The locale identifier ie. en_US
 *  @param  aDateString A Date to string to parse
 *  @return The date parsed with the format string
 */
+ (NSDate *)dateWithFormat:(NSString *)aFormat
                  timezone:(NSString *)timezoneName
                    locale:(NSString *)localeIdentifier
                    string:(NSString *)aDateString;

@end
