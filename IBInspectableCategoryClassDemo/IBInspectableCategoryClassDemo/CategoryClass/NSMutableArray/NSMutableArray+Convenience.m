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
- (void)shuffle {
    
    NSUInteger count = [self count];
    
    for (NSUInteger i = 0; i < count; ++i) {
        NSUInteger remainingCount = count - i;
        NSUInteger exchangeIndex = i + arc4random_uniform((u_int32_t)remainingCount);
        [self exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
    }
}
@end
