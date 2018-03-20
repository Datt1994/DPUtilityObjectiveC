//
//  NSString+Utility.m
//  IBInspectableCategoryClassDemo
//
//  Created by datt on 20/03/18.
//  Copyright © 2018 datt. All rights reserved.
//

#import "NSString+Utility.h"

@implementation NSString(Utility)

#pragma mark - Validations

- (BOOL)isNull {
    
    if(self == nil || [self isKindOfClass:[NSNull class]] || [self isEmpty]) {
        return YES;
    }
    
    return NO;
}

- (BOOL)isEmpty {
    return [[self trimWhitespace] isEqualToString:@""];
}


- (BOOL)isEmail {
    
    //Create a regex string
    NSString *stricterFilterString =
    @"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"
    @"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
    @"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
    @"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
    @"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
    @"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
    @"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])" ;
    //Create predicate with format matching your regex string
    
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", stricterFilterString];
    //return true if email address is valid
    return [emailTest evaluateWithObject:self];
    
}

- (BOOL)isStartsWithACapitalLetter {
    
    unichar firstCharacter = [self characterAtIndex:0];
    return [[NSCharacterSet uppercaseLetterCharacterSet]
            characterIsMember:firstCharacter];
    
}

#pragma mark -

- (NSString *)trimWhitespace {
    return [self stringByTrimmingCharactersInSet:
            [NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSUInteger)numberOfWords {
    __block NSUInteger count = 0;
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                             options:NSStringEnumerationByWords|NSStringEnumerationSubstringNotRequired
                          usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                              count++;
                          }];
    return count;
}

- (NSString *)reverseString {
    
    NSMutableString *reversedString = [NSMutableString stringWithCapacity:[self length]];
    
    [self enumerateSubstringsInRange:NSMakeRange(0,[self length])
                             options:(NSStringEnumerationReverse | NSStringEnumerationByComposedCharacterSequences)
                          usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                              [reversedString appendString:substring];
                          }];
    
    
    return reversedString;
}

- (NSString *)concat:(NSString *)string {
    
    if (!string) {
        return self;
    }
    
    return [NSString stringWithFormat:@"%@%@",self, string];
}

- (BOOL)contains:(NSString *)string {
    
    if (string) {
        NSRange range = [self rangeOfString:string];
        return (range.location != NSNotFound);
        
    }else {
        return NO;
    }
    
}


+ (NSString *)truncateString:(NSString *) string toCharacterCount:(NSUInteger) count {
    
    NSRange range = { 0, MIN(string.length, count) };
    range = [string rangeOfComposedCharacterSequencesForRange: range];
    NSString *trunc = [string substringWithRange: range];
    
    if (trunc.length < string.length) {
        trunc = [trunc stringByAppendingString: @"..."];
    }
    
    return trunc;
    
} // truncateString


#pragma mark - Date Format

- (NSDate *)dateFromFormat: (NSString *)formatter {
    
    //    debug(@"dateString %@",dateString);
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    [dateFormatter setDateFormat:formatter];
    
    NSDate *dateFromString = [dateFormatter dateFromString:self];
    return dateFromString;
}


@end
