//
//  NSStream+BoundPair.h
//
//  Extracted From: SimpleURLConnections sample project WWDC 2012
//  Written by: DTS
//  Copyright:  Copyright (c) 2009-2012 Apple Inc. All Rights Reserved.
//

#import <Foundation/Foundation.h>

// A category on NSStream that provides a nice, Objective-C friendly way to create
// bound pairs of streams.

@interface NSStream (BoundPairAdditions)

+ (void)createBoundInputStream:(NSInputStream **)inputStreamPtr outputStream:(NSOutputStream **)outputStreamPtr bufferSize:(NSUInteger)bufferSize;

@end
