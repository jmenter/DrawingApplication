
#import "DrawingContent.h"

@interface DrawingContent ()
@property (nonatomic) NSMutableArray <NSBezierPath *> *paths;
@end
@implementation DrawingContent

+ (BOOL)supportsSecureCoding; { return YES; }

- (instancetype)init;
{
    if (!(self = [super init])) { return nil;}
    self.paths = NSMutableArray.new;
    self.pathsController = [[NSArrayController alloc] initWithContent:self.paths];
    NSLog(@"content initialized");

    return self;
}

- (NSData *)data;
{
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self requiringSecureCoding:YES error:nil];
    return data;
}

- (BOOL)read:(NSData *)data;
{
    NSError *error;
    NSArray *classes = @[[self class], NSMutableArray.class, NSString.class, NSBezierPath.class];
    DrawingContent *decoded = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithArray:classes] fromData:data error:&error];
    self.title = decoded.title;
    self.paths = decoded.paths;
    self.pathsController = [[NSArrayController alloc] initWithContent:self.paths];
    return !error;
}

- (void)encodeWithCoder:(nonnull NSCoder *)coder;
{
    [coder encodeObject:self.paths forKey:NSStringFromSelector(@selector(paths))];
    [coder encodeObject:self.title forKey:NSStringFromSelector(@selector(title))];
}

- (instancetype)initWithCoder:(nonnull NSCoder *)coder;
{
    if (!(self = [super init])) { return nil;}
    self.title = [coder decodeObjectForKey:NSStringFromSelector(@selector(title))];
    self.paths = [coder decodeObjectForKey:NSStringFromSelector(@selector(paths))] ?: NSMutableArray.new;
    self.pathsController = [[NSArrayController alloc] initWithContent:self.paths];
    NSLog(@"content decoded");

    return self;
}

@end

