//
//  ViewController.m
//  RunTime0731
//
//  Created by     马世杰 on 2024/7/31.
//

#import "ViewController.h"
#include <objc/runtime.h>
#import "HXTool.h"

@interface ViewController ()

@end

void hx_zuyu(id self, SEL _cmd) {
    NSLog(@"zuyu666");
}

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = UIColor.orangeColor;
    
//    [self registerClass];
    [self changeMethoed];
    
    
}



- (void)changeMethoed {
    
    NSArray *array = [NSArray arrayWithObjects:@1, @2, @3, @4, nil];
    NSLog(@"%@", array[4]);
    
//    Method oriMethod = class_getInstanceMethod([self class], @selector(viewWillAppear:));
//    Method swiMethod = class_getInstanceMethod([self class], @selector(hx_viewWillAppear:));
//    
//    method_exchangeImplementations(oriMethod, swiMethod);
}

- (void)registerClass {
    //注册一个类
    Class zuyu = objc_allocateClassPair([NSObject class], "Zuyu", 0);
    class_addIvar(zuyu, "ahuaAge", sizeof(id), log2(sizeof(id)), @encode(id));
    class_addIvar(zuyu, "ahuaShengao", sizeof(id), log2(sizeof(id)), @encode(id));
    class_addMethod(zuyu, @selector(hx_zuyu), (IMP)hx_zuyu, "v@:");
    //    NSLog(@"%s", @encode(id));
    //    NSLog(@"%s%s%s", @encode(void), @encode(id), @encode(SEL));
    objc_registerClassPair(zuyu);
    
    
    id zy = [[zuyu alloc] init];
    [zy setValue:@"18" forKey:@"ahuaAge"];
    [zy performSelector:@selector(hx_zuyu)];
    NSLog(@"%@", [zy valueForKey:@"ahuaAge"]);

}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"0000");
}

-(void)hx_viewWillAppear:(BOOL)animated {
    NSLog(@"1111");
}



@end
