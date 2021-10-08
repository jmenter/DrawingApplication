
@import Cocoa;
#import "DrawingDelegate.h"

@interface DrawingView : NSView

@property (nonatomic, weak) id <DrawingDelegate> drawingDelegate;

- (void)drawPaths:(NSArray <NSBezierPath *> *)paths;

@end

