
@import Cocoa;
#import "DrawingContent.h"

@interface DrawingViewController : NSViewController

@property (nonatomic) NSColor *currentDrawingColor;
@property (nonatomic) CGFloat currentLineWeight;
@property (nonatomic, readonly) NSString *pathCount;

@property (nonatomic, weak) DrawingContent *content;

@end

