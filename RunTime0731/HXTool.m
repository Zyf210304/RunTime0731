//
//  HXTool.m
//  RunTime0731
//
//  Created by     马世杰 on 2024/7/31.
//

#import "HXTool.h"
#include <objc/runtime.h>

@implementation HXTool

+ (void)HX_methodSwiuzzingWithClass:(Class)cls oriSEL:(SEL)oriSEL swizzingSEl:(SEL)swiSEL {
    
    Method oriMethod = class_getInstanceMethod(cls, oriSEL);
    Method swiMethod = class_getInstanceMethod(cls, swiSEL);
    
    method_exchangeImplementations(oriMethod, swiMethod);
}

@end
