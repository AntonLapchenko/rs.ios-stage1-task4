#import "SquareDecomposer.h"

@implementation SquareDecomposer
- (NSArray <NSNumber*>*)decomposeNumber:(NSNumber*)number {
    NSMutableArray *result = [NSMutableArray new];
    [result addObjectsFromArray:[self decomposer:[number integerValue] and:[number integerValue] * [number integerValue]]];
    if (result == nil) {
        return nil;
    } else {
        return result;
    }
}

-(NSMutableArray*)decomposer:(NSInteger)n and:(NSInteger)remain{
    if (remain == 0) {
        return nil;
    }
    for (NSInteger i = n - 1; i > 0; i--) {
        if ((remain - i * i) >= 0) {
            NSMutableArray *result = [[NSMutableArray alloc] initWithArray:[self decomposer: i and:(remain - i * i)]];
            if (result != nil) {
                [result addObject:[NSNumber numberWithInteger:n]];
                return result;
            }
        }
    }
    return nil;
}
@end
