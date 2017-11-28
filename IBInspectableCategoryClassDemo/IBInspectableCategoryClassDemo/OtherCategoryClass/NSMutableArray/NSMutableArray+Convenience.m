//
//  NSMutableArray+Convenience.m
//  Copyright © 2017 datt. All rights reserved.
//

#import "NSMutableArray+Convenience.h"

@implementation NSMutableArray(Convenience)
- (void)moveObjectAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex
{
    if (fromIndex < toIndex) {
        toIndex--; // Optional
    }
    
    id object = [self objectAtIndex:fromIndex];
    [self removeObjectAtIndex:fromIndex];
    [self insertObject:object atIndex:toIndex];
}
@end
