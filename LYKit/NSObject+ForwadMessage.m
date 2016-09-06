//
//  NSObject+ForwadMessage.m
//  JavaScriptCoreTest
//
//  Created by 李言 on 16/9/5.
//  Copyright © 2016年 李言. All rights reserved.
//

#import "NSObject+ForwadMessage.h"
#import <objc/runtime.h>
@implementation NSObject (ForwadMessage)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL systemSel = @selector(forwardInvocation:);
        SEL swizzSel = @selector(sw_forwardInvocation:);
        [self exchangeTwoMethod:systemSel swizzMethod:swizzSel];
        
        SEL systemSels = @selector(methodSignatureForSelector:);
        SEL swizzSels = @selector(sw_methodSignatureForSelector:);
        [self exchangeTwoMethod:systemSels swizzMethod:swizzSels];
    });
}

+ (void)exchangeTwoMethod:(SEL)systemSel swizzMethod:(SEL)swizzSel{
    Method systemMethod = class_getInstanceMethod([self class], systemSel);
    Method swizzMethod = class_getInstanceMethod([self class], swizzSel);
    
    BOOL isAdd = class_addMethod([self class], systemSel, method_getImplementation(swizzMethod), method_getTypeEncoding(swizzMethod));
    if (isAdd) {
        class_replaceMethod([self class], swizzSel, method_getImplementation(systemMethod), method_getTypeEncoding(systemMethod));
    }else{
        method_exchangeImplementations(systemMethod, swizzMethod);
    }
}

-(void)sw_forwardInvocation:(NSInvocation *)invocation
{
    
    if (!self) {
        [self doesNotRecognizeSelector: [invocation selector]];
    }
    [invocation invokeWithTarget: self];
}

-(NSMethodSignature*)sw_methodSignatureForSelector:(SEL)selector
{
    NSMethodSignature *signature = [self sw_methodSignatureForSelector:selector];
    if (!signature) {
        class_addMethod([self class], selector, (IMP) forwarded, "v@:");
        signature = [self methodSignatureForSelector:selector];
    }
    return signature;
}

void forwarded(id self, SEL _cmd) {
    
    NSLog(@"[%@ %@] 方法找不到 已经被转发",[self class],NSStringFromSelector(_cmd));
}
@end
