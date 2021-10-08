
#import "NSBezierPath+Extras.h"
#import <objc/runtime.h>

@implementation NSBezierPath (Extras)

@dynamic strokeColor;

- (void)setStrokeColor:(NSColor *)color;
{
    objc_setAssociatedObject(self, @selector(strokeColor), color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)strokeColor;
{
    return objc_getAssociatedObject(self, @selector(strokeColor));
}

@end
