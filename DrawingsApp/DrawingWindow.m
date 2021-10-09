
#import "DrawingWindow.h"

@implementation DrawingWindow

- (instancetype)initWithContentRect:(NSRect)contentRect styleMask:(NSWindowStyleMask)style backing:(NSBackingStoreType)backingStoreType defer:(BOOL)flag;
{
    if (!(self = [super initWithContentRect:contentRect styleMask:style backing:backingStoreType defer:flag])) { return nil; }

    NSLog(@"window init");
    return self;
}

@end
