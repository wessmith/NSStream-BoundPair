//
//  NSStream+BoundPair.h
//
//  Modified by Wes Smith: 8-24-12
//
//  Extracted From: SimpleURLConnections sample project WWDC 2012
//  Written by: DTS
//  Copyright:  Copyright (c) 2009-2012 Apple Inc. All Rights Reserved.
//

#import "NSStream+BoundPair.h"
#include <CFNetwork/CFNetwork.h>

@implementation NSStream (BoundPair)

+ (void)createBoundInputStream:(NSInputStream **)inputStreamPtr outputStream:(NSOutputStream **)outputStreamPtr bufferSize:(NSUInteger)bufferSize
{
    CFReadStreamRef     readStream;
    CFWriteStreamRef    writeStream;
    
    assert( (inputStreamPtr != NULL) || (outputStreamPtr != NULL) );
    
    readStream = NULL;
    writeStream = NULL;

    CFStreamCreateBoundPair(
                            NULL,
                            ((inputStreamPtr  != nil) ? &readStream : NULL),
                            ((outputStreamPtr != nil) ? &writeStream : NULL),
                            (CFIndex) bufferSize
                            );
    
    if (inputStreamPtr != NULL) {
        *inputStreamPtr  = CFBridgingRelease(readStream);
    }
    if (outputStreamPtr != NULL) {
        *outputStreamPtr = CFBridgingRelease(writeStream);
    }
}

@end

