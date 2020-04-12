//
//  NSMutableArray+AdditionalQueue.h
//  RSSchool_T4
//
//  Created by Tatyana Shut on 4/12/20.
//  Copyright © 2020 iOSLab. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (AdditionalQueue)
- (id) deque;
- (void) enqueue:(id)obj;
- (bool) isEmpty;
@end

NS_ASSUME_NONNULL_END
