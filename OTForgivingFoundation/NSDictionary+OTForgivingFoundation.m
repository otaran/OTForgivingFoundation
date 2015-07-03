// NSDictionary+OTForgivingFoundation.m
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

#import "NSDictionary+OTForgivingFoundation.h"
#import <JRSwizzle/JRSwizzle.h>

@implementation NSDictionary (OTForgivingFoundation)

+ (void)load
{
    [NSDictionary jr_swizzleClassMethod:@selector(dictionaryWithObjects:forKeys:count:) withClassMethod:@selector(OTForgivingFoundation_dictionaryWithObjects:forKeys:count:) error:NULL];
}

+ (instancetype)OTForgivingFoundation_dictionaryWithObjects:(const id [])objects forKeys:(const id<NSCopying> [])keys count:(NSUInteger)cnt
{
    id nonNilKeys[cnt];
    id nonNilObjects[cnt];
    
    NSUInteger nonNilCount = 0;
    NSUInteger idx = 0;
    while (idx != cnt) {
        id key = keys[idx];
        id obj = objects[idx];
        
        ++idx;
        
        if (obj) {
            nonNilKeys[nonNilCount] = key;
            nonNilObjects[nonNilCount] = obj;
            ++nonNilCount;
        }
    }
    
    return [self OTForgivingFoundation_dictionaryWithObjects:nonNilObjects forKeys:nonNilKeys count:nonNilCount];
}

@end
