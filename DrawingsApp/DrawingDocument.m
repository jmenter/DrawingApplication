
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
    // Insert code here to write your document to data of the specified type. If outError != NULL, ensure that you create and set an appropriate error if you return nil.
    // Alternatively, you could remove this method and override -fileWrapperOfType:error:, -writeToURL:ofType:error:, or -writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
    [NSException raise:@"UnimplementedMethod" format:@"%@ is unimplemented", NSStringFromSelector(_cmd)];
    return nil;
}


- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError {
    // Insert code here to read your document from the given data of the specified type. If outError != NULL, ensure that you create and set an appropriate error if you return NO.
    // Alternatively, you could remove this method and override -readFromFileWrapper:ofType:error: or -readFromURL:ofType:error: instead.
    // If you do, you should also override -isEntireFileLoaded to return NO if the contents are lazily loaded.
    [NSException raise:@"UnimplementedMethod" format:@"%@ is unimplemented", NSStringFromSelector(_cmd)];
    return YES;
}


@end
