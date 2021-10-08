
#import "DrawingAppDelegate.h"

@interface DrawingAppDelegate ()

@end

@implementation DrawingAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification;
{
    NSLog(@"did finish launching");
}


- (void)applicationWillTerminate:(NSNotification *)aNotification;
{
    NSLog(@"will terminate");
}


@end
