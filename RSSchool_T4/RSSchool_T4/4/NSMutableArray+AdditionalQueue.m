//
//  NSMutableArray+AdditionalQueue.m
//  RSSchool_T4
//
//  Created by Tatyana Shut on 4/12/20.
//  Copyright © 2020 iOSLab. All rights reserved.
//

#import "NSMutableArray+AdditionalQueue.h"

@implementation NSMutableArray (AdditionalQueue)
- (id) deque {
    id head = [self objectAtIndex:0];
    if (head != nil) {
        [[head retain] autorelease];
        [self removeObjectAtIndex:0];
    }
    return head;
}

- (void) enqueue:(id)obj {
    [self addObject:obj];
}

- (bool) isEmpty {
    return [self count] == 0;
}
@end
