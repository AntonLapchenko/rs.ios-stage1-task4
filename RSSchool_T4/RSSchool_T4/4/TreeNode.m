//
//  TreeNode.m
//  RSSchool_T4
//
//  Created by Tatyana Shut on 4/12/20.
//  Copyright © 2020 iOSLab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TreeNode.h"

@implementation TreeNode: NSObject

-(instancetype)initWithValue:(NSUInteger)value {
    self = [super init];
    if (self) {
        _value = [NSNumber numberWithUnsignedInteger:value];
        _leftSon = nil;
        _rightSon = nil;
    }
    return self;
}

@end
