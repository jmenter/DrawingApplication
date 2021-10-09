
#import "DrawingDocument.h"
#import "DrawingContent.h"
#import "DrawingViewController.h"

@interface DrawingDocument ()
@property (nonatomic) DrawingContent *content;
@property (nonatomic) DrawingViewController *contentViewController;
@end

@implementation DrawingDocument

- (instancetype)init;
{
    if (!(self = [super init])) { return nil; }

    self.content = DrawingContent.new;
    NSLog(@"document initialized");
    return self;
}

+ (BOOL)autosavesInPlace; { return YES; }

- (void)makeWindowControllers;
{
    NSStoryboard *main = [NSStoryboard storyboardWithName:@"Main" bundle:nil];
    NSWindowController *windowController =[main instantiateControllerWithIdentifier:@"Drawing Window Controller"];

    [self addWindowController:windowController];
    windowController.contentViewController.representedObject = self.content;
    self.contentViewController = (DrawingViewController *)windowController.contentViewController;
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError {
    return self.content.data;
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError {
    return [self.content read:data];
}


@end
