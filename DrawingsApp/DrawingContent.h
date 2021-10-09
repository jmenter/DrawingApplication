
@import Cocoa;

@interface DrawingContent : NSObject <NSCoding, NSSecureCoding>

@property (nonatomic, copy) NSString *title;
@property (nonatomic) NSArrayController *pathsController;

- (NSData *)data;
- (BOOL)read:(NSData *)data;

@end
