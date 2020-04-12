#import "ArrayCalculator.h"

@implementation ArrayCalculator
+ (NSInteger)maxProductOf:(NSInteger)numberOfItems itemsFromArray:(NSArray *)array {
    array = [self resultOnlyInteger:array];
    if ([array count] == 0) {
        return 0;
    }
    NSInteger maxArrayProduct = 0;
    if (numberOfItems >= [array count]) {
        maxArrayProduct = [self product:array];
        return maxArrayProduct;
    } else {
        NSMutableArray *sortArr = [[NSMutableArray alloc]initWithArray:[self bubbleSort:array]];
        NSArray *tempMaxArr = [[NSArray alloc] initWithArray: [sortArr subarrayWithRange:NSMakeRange(0, numberOfItems)]];
        
        NSMutableArray *restArray = [NSMutableArray new];
        
        for (NSInteger i = numberOfItems; i < [sortArr count]; i++) {
            [restArray addObject:sortArr[i]];
        }
        NSInteger lowestInRestArray = 0;
        NSInteger highestInRestArray = 0;
        NSInteger minPositiveInMaxArray = 0;
        NSInteger maxNegativeInMaxArray = 0;
        
        maxArrayProduct = [self product:tempMaxArr];
        if (maxArrayProduct > 0) {
            return  maxArrayProduct;
        } else {
            BOOL onlyNegative = YES;
            for (NSInteger i = 0; i < [restArray count]; i++) {
                if (restArray[i] >= 0)
                    onlyNegative = NO;
            }
            if (onlyNegative) {
                tempMaxArr = [sortArr subarrayWithRange:NSMakeRange([sortArr count] - numberOfItems - 1, [sortArr count] - 1)];
                maxArrayProduct = [self product:tempMaxArr];
                return  maxArrayProduct;
            } else {
                lowestInRestArray = [self maxMinInArray:NO inArray:restArray];
                highestInRestArray = [self maxMinInArray:YES inArray:restArray];
                minPositiveInMaxArray = [self minPositiveMaxNegative:YES inArray:tempMaxArr];
                maxNegativeInMaxArray = [self minPositiveMaxNegative:NO inArray:tempMaxArr];
                
                NSInteger productWithChangedMinPositive = maxArrayProduct / minPositiveInMaxArray * lowestInRestArray;
                NSInteger productWithChangedMaxNegative = maxArrayProduct / maxNegativeInMaxArray * highestInRestArray;
                
                if (productWithChangedMinPositive < productWithChangedMaxNegative) {
                    maxArrayProduct = productWithChangedMaxNegative;
                    
                } else {
                    maxArrayProduct = productWithChangedMaxNegative;
                }
                return  maxArrayProduct;
            }
        }
        
    }
    return maxArrayProduct;
}

+ (NSArray *)bubbleSort:(NSArray *)array {
    NSMutableArray *arr = [array mutableCopy];
    NSInteger count = arr.count;
    BOOL swapped = YES;
    while (swapped)
    {
        swapped = NO;
        for (NSInteger i = 1; i < count; i++)
        {
            int x = abs([arr[i - 1] intValue]);
            int y = abs([arr[i] intValue]);
            if (x < y)
            {
                [arr exchangeObjectAtIndex:(i-1) withObjectAtIndex:i];
                swapped = YES;
            }
        }
    }
    return arr;
}

+ (NSInteger) maxMinInArray:(BOOL) maxOrMin inArray:(NSMutableArray *)arr {
    NSInteger result = 0;
    for (NSInteger i = 0; i < [arr count]; i++) {
        if (maxOrMin) {
            if (result <= [arr[i] integerValue]) {
                result = [arr[i] integerValue];
            }
        } else {
            if (result >= [arr[i] integerValue]) {
                result = [arr[i] integerValue];
            }
        }
    }
    return result;
}

+ (NSInteger) minPositiveMaxNegative:(BOOL) maxOrMin inArray:(NSArray *)arr {
    NSInteger result = 0;
    for (NSInteger i = 0; i < [arr count]; i++) {
        if (maxOrMin) {
            if ([arr[i] integerValue] > 0) {
                result = [arr[i] integerValue];
            }
        } else {
            if ([arr[i] integerValue] < 0) {
                result = [arr[i] integerValue];
            }
        }
    }
    return result;
}

+ (NSInteger)product:(NSArray *)arr {
    NSInteger result = 1;
    for (id i in arr) {
        result *= [[NSNumber numberWithInteger:[i integerValue]] integerValue];
    }
    return result;
}

+ (NSArray *)resultOnlyInteger:(NSArray *)arr {
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"self isKindOfClass: %@", [NSNumber class]];
    NSArray *numbersArray = [arr filteredArrayUsingPredicate:predicate];
    return numbersArray;
}
@end
