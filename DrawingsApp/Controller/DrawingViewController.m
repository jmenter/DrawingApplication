
#import "DrawingViewController.h"
#import "DrawingDelegate.h"
#import "DrawingView.h"

@interface DrawingViewController () <DrawingDelegate>
@property (nonatomic, weak) NSBezierPath *currentPath;
@property (weak) IBOutlet DrawingView *drawingView;
@property (nonatomic, readwrite) NSString *pathCount;

@end

@implementation DrawingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.drawingView.drawingDelegate = self;
    NSLog(@"view did load");
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    self.content = representedObject;
    [self tellViewToRedraw];
}

#pragma mark - DrawingDelegate

- (void)beginPathWithPoint:(NSPoint)point;
{
    NSBezierPath *path = NSBezierPath.new;
    path.lineWidth = self.currentLineWeight;
    path.strokeColor = self.currentDrawingColor;
    [path moveToPoint:point];
    [self.content.pathsController addObject:path];

    self.pathCount = self.content.pathsController.formattedCount;
    self.currentPath = path;
    [self tellViewToRedraw];
}

- (void)addToPathWithPoint:(NSPoint)point;
{
    [self.currentPath lineToPoint:point];
    [self tellViewToRedraw];
}

- (void)tellViewToRedraw;
{
    [self.drawingView drawPaths:self.content.pathsController.arrangedObjects];

}

@end
