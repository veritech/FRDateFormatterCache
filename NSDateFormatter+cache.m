//
//  NSDateFormatter+cache.m
//
//  Created by Jonathan Dalrymple on 25/11/2013.
//  Copyright (c) 2014 Float-right Ltd. All rights reserved.
//

#import "NSDateFormatter+cache.h"

@implementation NSDateFormatter (FRDateFormatter_cache)

+ (NSCache *)FRDateFormatter_cache
{
    static NSCache *cache;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = [[NSCache alloc] init];
    });
    
    return cache;
}

+ (NSString *)cacheKeyWithFormat:(NSString *)format
                        timezone:(NSString *)timezone
                          locale:(NSString *)locale {
    return [NSString stringWithFormat:@"FRDateFormatter-%@-%@-%@",format,timezone,locale];
}

#pragma mark - Dates to Strings
+ (NSString *)stringWithFormat:(NSString *)aFormat
                          date:(NSDate *)aDate {
    return [self stringWithFormat:aFormat
                         timezone:nil
                           locale:nil
                             date:aDate];
}

+ (NSString *)stringWithFormat:(NSString *)aFormat
                      timezone:(NSString *)timezoneName
                        locale:(NSString *)localeIdentifier
                          date:(NSDate *)aDate {
    NSDateFormatter *dateFormatter;
    NSString *key = [self cacheKeyWithFormat:aFormat
                                    timezone:timezoneName
                                      locale:localeIdentifier];
    
    if (!(dateFormatter = [[self FRDateFormatter_cache] objectForKey:key])) {
        dateFormatter = [[NSDateFormatter alloc] init];
        
        dateFormatter.dateFormat = aFormat;
        
        if (timezoneName) {
            dateFormatter.timeZone = [NSTimeZone timeZoneWithName:timezoneName];
        }
        
        if (localeIdentifier) {
            dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:localeIdentifier];
        }
        
        [[self FRDateFormatter_cache] setObject:dateFormatter
                                         forKey:key];
    }
    return [dateFormatter stringFromDate:aDate];
}

#pragma mark - Strings to dates
+ (NSDate *)dateWithFormat:(NSString *)aFormat
                    string:(NSString *)aDateString {
    return [self dateWithFormat:aFormat
                       timezone:nil
                         locale:nil
                         string:aDateString];
}

+ (NSDate *)dateWithFormat:(NSString *)aFormat
                  timezone:(NSString *)timezoneName
                    locale:(NSString *)localeIdentifier
                    string:(NSString *)aDateString {
    NSDateFormatter *dateFormatter;
    NSString *key = [self cacheKeyWithFormat:aFormat
                                    timezone:timezoneName
                                      locale:localeIdentifier];
    
    if (!(dateFormatter = [[self FRDateFormatter_cache] objectForKey:key])) {
        dateFormatter = [[NSDateFormatter alloc] init];
        
        dateFormatter.dateFormat = aFormat;
        
        if (timezoneName) {
            dateFormatter.timeZone = [NSTimeZone timeZoneWithName:timezoneName];
        }
        
        if (localeIdentifier) {
            dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:localeIdentifier];
        }
        
        [[self FRDateFormatter_cache] setObject:dateFormatter
                                         forKey:key];
    }
    
    return [dateFormatter dateFromString:aDateString];
}

@end
