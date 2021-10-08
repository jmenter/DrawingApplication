
#import "NSArrayController+Extras.h"

@implementation NSArrayController (Extras)

- (NSString *)formattedCount;
{
    return [NSString stringWithFormat:@"%lu", (unsigned long)[self.arrangedObjects count]];
}

@end
