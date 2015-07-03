// NSArray+OTForgivingFoundation.m
// 
// Copyright (c) 2015 Oleksii Taran
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "NSArray+OTForgivingFoundation.h"
#import <JRSwizzle/JRSwizzle.h>

@implementation NSArray (OTForgivingFoundation)

+ (void)load
{
    [self jr_swizzleClassMethod:@selector(arrayWithObjects:count:) withClassMethod:@selector(OTForgivingFoundation_arrayWithObjects:count:) error:NULL];
}

+ (instancetype)OTForgivingFoundation_arrayWithObjects:(const id [])objects count:(NSUInteger)cnt
{
    id nonNilObjects[cnt];
    
    NSUInteger nonNilCount = 0;
    NSUInteger idx = 0;
    while (idx != cnt) {
        id obj = objects[idx++];
        if (obj) {
            nonNilObjects[nonNilCount++] = obj;
        }
    }
    
    return [self OTForgivingFoundation_arrayWithObjects:nonNilObjects count:nonNilCount];
}

@end
