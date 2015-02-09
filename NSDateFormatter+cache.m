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

+ (NSString *)stringWithFormat:(NSString *)aFormat
                          date:(NSDate *)aDate
{
    
    NSDateFormatter *dateFormatter;
    
    if (!(dateFormatter = [[self FRDateFormatter_cache] objectForKey:aFormat])) {
        dateFormatter = [[NSDateFormatter alloc] init];
        
        [dateFormatter setDateFormat:aFormat];
        
        [[self FRDateFormatter_cache] setObject:dateFormatter
                                         forKey:aFormat];
    }
    
    return [dateFormatter stringFromDate:aDate];
}

+ (NSDate *)dateWithFormat:(NSString *)aFormat
                    string:(NSString *)aDateString
{

    NSDateFormatter *dateFormatter;
    
    if (!(dateFormatter = [[self FRDateFormatter_cache] objectForKey:aFormat])) {
        dateFormatter = [[NSDateFormatter alloc] init];
        
        [dateFormatter setDateFormat:aFormat];
        
        [[self FRDateFormatter_cache] setObject:dateFormatter
                                         forKey:aFormat];
    }
    
    return [dateFormatter dateFromString:aDateString];
}

+ (NSString *)stringWithFormat:(NSString *)aFormat
                          date:(NSDate *)aDate
             usingLocalisation:(BOOL)usingLocalisation
{
    
    NSDateFormatter *dateFormatter;
    
    if (!(dateFormatter = [[self FRDateFormatter_cache] objectForKey:aFormat])) {
        dateFormatter = [[NSDateFormatter alloc] init];
        
        [dateFormatter setDateFormat:aFormat];
        
        if (!usingLocalisation) {
            [dateFormatter setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US"]];
        }
        
        [[self FRDateFormatter_cache] setObject:dateFormatter
                                         forKey:aFormat];
    }
    
    return [dateFormatter stringFromDate:aDate];
}

@end
