//
//  HXTool.h
//  RunTime0731
//
//  Created by     马世杰 on 2024/7/31.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HXTool : NSObject

+ (void)HX_methodSwiuzzingWithClass:(Class)cls oriSEL:(SEL)oriSEL swizzingSEl:(SEL)swiSEL;

@end

NS_ASSUME_NONNULL_END
