//
//  NSString+Utility.h
//  IBInspectableCategoryClassDemo
//
//  Created by datt on 20/03/18.
//  Copyright © 2018 datt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(Utility)


#pragma mark - Validations

- (BOOL)isNull ;
- (BOOL)isEmpty ;
- (BOOL)isEmail ;
- (BOOL)isStartsWithACapitalLetter;

#pragma mark -

- (NSString *)trimWhitespace ;
- (NSUInteger)numberOfWords ;
- (NSString *)reverseString ;
- (NSString *)concat:(NSString *)string ;
- (BOOL)contains:(NSString *)string ;
+ (NSString *)truncateString:(NSString *) string toCharacterCount:(NSUInteger) count ;

#pragma mark - Date Format

- (NSDate *)dateFromFormat: (NSString *)formatter ;


@end
