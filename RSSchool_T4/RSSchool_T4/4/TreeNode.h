//
//  TreeNode.h
//  RSSchool_T4
//
//  Created by Tatyana Shut on 4/12/20.
//  Copyright © 2020 iOSLab. All rights reserved.
//

#ifndef TreeNode_h
#define TreeNode_h

@interface TreeNode: NSObject

@property (nonatomic, retain, readwrite) NSNumber *value;
@property (nonatomic, retain, readwrite) TreeNode *leftSon;
@property (nonatomic, retain, readwrite) TreeNode *rightSon;

-(instancetype)initWithValue:(NSUInteger)value;
@end

#endif /* TreeNode_h */
