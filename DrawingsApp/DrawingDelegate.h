
#ifndef DrawingDelegate_h
#define DrawingDelegate_h

@import Cocoa;

@protocol DrawingDelegate <NSObject>

- (void)beginPathWithPoint:(NSPoint)point;
- (void)addToPathWithPoint:(NSPoint)point;

@end

#endif /* DrawingDelegate_h */
