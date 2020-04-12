#import "SquareDecomposer.h"

@implementation SquareDecomposer
- (NSArray <NSNumber*>*)decomposeNumber:(NSNumber*)number {
    NSMutableArray *resultArray = [self decomposer:number remain:[ NSNumber numberWithInteger:[number integerValue] * [number integerValue]]];
    if (resultArray == nil) {
        return nil;
    } else {
        [resultArray removeObject:[resultArray lastObject]];
        return  resultArray;
    }
}

- (NSMutableArray *)decomposer:(NSNumber *)n remain:(NSNumber *)remain {
    NSMutableArray *result = [NSMutableArray array];
    if ([remain integerValue] == 0) {
        [result addObject:n];
        return result;
    }
    for (NSInteger i = [n integerValue] - 1; i > 0; i--) {
        if ([remain integerValue] - i * i >= 0) {
            NSMutableArray *result = [self decomposer:[NSNumber numberWithInteger: i] remain:[NSNumber numberWithInteger:[remain integerValue] - i * i]];
            if (result) {
                [result addObject:n];
                return result;
            }
        }
    }
    return nil;
}
@end
