
#import "DrawingContent.h"

@interface DrawingContent ()
@property (nonatomic) NSMutableArray <NSBezierPath *> *paths;
@end
@implementation DrawingContent

- (instancetype)init;
{
    if (!(self = [super init])) { return nil;}
    self.paths = NSMutableArray.new;
    self.pathsController = [[NSArrayController alloc] initWithContent:self.paths];
    NSLog(@"content initialized");

    return self;
}

@end

