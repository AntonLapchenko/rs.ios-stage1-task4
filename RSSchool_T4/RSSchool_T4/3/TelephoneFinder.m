#import "TelephoneFinder.h"

@implementation TelephoneFinder
- (NSArray <NSString*>*)findAllNumbersFromGivenNumber:(NSString*)number {
    NSMutableArray *resultArray = [NSMutableArray new];
    if ([number hasPrefix:@"-"]) {
        return nil;
    }
    for (NSInteger i = 0; i < number.length; i ++) {
        unichar test = [number characterAtIndex:i];
        NSMutableArray *arrayOfNeighbours = [[self arrayOfAdjacentNumbers: [NSString stringWithFormat: @"%C", test]] mutableCopy];
        for (NSInteger j = 0; j < arrayOfNeighbours.count; j++) {
            NSString *phoneNumber = [number stringByReplacingCharactersInRange:NSMakeRange(i, 1) withString:arrayOfNeighbours[j]];
            [resultArray addObject:phoneNumber];
        }
    }
    return resultArray;
}

-(NSArray*)arrayOfAdjacentNumbers:(NSString*)num{
    if ([num  isEqual: @"0"])
        return @[@"8"];
    if ([num isEqual: @"1"])
        return @[@"2",@"4"];
    if ([num isEqual: @"2"]){
        return @[@"1",@"3",@"5"];
    }
    if ([num isEqual: @"3"]){
        return @[@"2",@"6"];
    }
    if ([num isEqual: @"4"]){
        return @[@"1",@"5",@"7"];
    }
    if ([num isEqual: @"5"]){
        return @[@"2",@"4",@"6",@"8"];
    }
    if ([num isEqual: @"6"]){
        return @[@"3",@"5",@"9"];
    }
    if ([num isEqual: @"7"]){
        return @[@"4",@"8"];
    }
    if ([num isEqual: @"8"]){
        return @[@"5",@"7",@"9",@"0"];
    }
    if ([num isEqual: @"9"]){
        return @[@"6",@"8"];
    }
    return nil;
}
@end
