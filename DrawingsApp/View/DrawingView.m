
#import "DrawingView.h"

@interface DrawingView ()
@property (nonatomic, weak) NSArray<NSBezierPath *> *paths;
@end
@implementation DrawingView

#pragma mark - Init and Lifecycle

- (BOOL)isFlipped; { return YES; }

- (instancetype)init; { return (self = [super init]) ? [self commonInit] : nil; }
- (instancetype)initWithCoder:(NSCoder *)coder; { return (self = [super initWithCoder:coder]) ? [self commonInit] : nil; }
- (instancetype)initWithFrame:(NSRect)frameRect; { return (self = [super initWithFrame:frameRect]) ? [self commonInit] : nil; }

- (instancetype)commonInit;
{
    self.wantsLayer = YES;
    self.layer.backgroundColor = NSColor.grayColor.CGColor;
    NSLog(@"drawing view init");
    return self;
}

- (void)mouseDown:(NSEvent *)event;
{
    [self.drawingDelegate beginPathWithPoint:[self locationForEvent:event]];
}

- (void)mouseDragged:(NSEvent *)event;
{
    [self.drawingDelegate addToPathWithPoint:[self locationForEvent:event]];
}

- (void)mouseUp:(NSEvent *)event;
{
    [self.drawingDelegate addToPathWithPoint:[self locationForEvent:event]];
}

- (NSPoint)locationForEvent:(NSEvent *)event;
{
    return [self convertPoint:event.locationInWindow fromView:self.superview];
}

- (void)drawPaths:(NSArray<NSBezierPath *> *)paths;
{
    self.paths = paths;
    self.needsDisplay = YES;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    for (NSBezierPath *path in self.paths) {
        [path.strokeColor setStroke];
        [path stroke];
    }
}

@end
