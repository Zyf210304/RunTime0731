//
//  NSArray+HX.m
//  RunTime0731
//
//  Created by     马世杰 on 2024/7/31.
//

#import "NSArray+HX.h"
#import "HXTool.h"
#include <objc/runtime.h>

@implementation NSArray (HX)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [HXTool HX_methodSwiuzzingWithClass:objc_getClass("__NSArrayI") oriSEL:@selector(objectAtIndex:) swizzingSEl:@selector(hx_objectAtIndex:)];
        [HXTool HX_methodSwiuzzingWithClass:objc_getClass("__NSArrayI") oriSEL:@selector(objectAtIndexedSubscript:) swizzingSEl:@selector(hx_objectAtIndexedSubscript:)];
    });
    
}


- (id)hx_objectAtIndexedSubscript:(NSUInteger)index {
    if(index > self.count - 1) {
        NSLog(@"越界了！！！！！！");
        return  nil;
    }
    return  [self hx_objectAtIndexedSubscript:index];
}

- (id)hx_objectAtIndex:(NSUInteger)index {
    if(index > self.count - 1) {
        NSLog(@"越界了！！！！！！");
        return  nil;
    }
    return  [self hx_objectAtIndex:index];
}



@end
