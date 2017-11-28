//
//  GFRouter.m
//  GXEJisMobile
//
//  Created by ECHINACOOP1 on 2017/11/22.
//  Copyright © 2017年 蔺国防. All rights reserved.
//

#import "GFRouter.h"
#import <objc/runtime.h>

#define PRESENT_STYLE  @"present" //模态推出
#define PUSH_STYLE     @"push"    //导航推出
#define DISPLAY_STYLE  @"displayStyle" //控制器推出方式

@implementation GFRouter

+ (instancetype)sharedRouter{
    
    static GFRouter * instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

//URL跳转到对应控制器并传递相关参数
+ (void)openURL:(NSURL *)URL{
    
    //获取控制器
    UIViewController *controller = [GFRouter getControllerFromURL:URL];
    
    if (controller == nil) {
        return;
    }
    
    //获取控制器属性参数
    NSMutableDictionary *paraDic  = [GFRouter getParaWith:URL];

    //给控制器参数赋值
    if (paraDic.allValues.count) {//字典值判空处理
        
        [GFRouter setPropertyWith:paraDic and:controller];
    }
    
    //推出控制器
    
    if ([paraDic[DISPLAY_STYLE] isEqualToString:PRESENT_STYLE]) {
        
        [GFRouter presentWith:controller];
    }else{
        
        [GFRouter pushWith:controller];
    }
}

//类名跳转到对应控制器并传递相关参数
+ (void)openClassName:(NSString *)className parameters:(NSMutableDictionary *)paraDic{
    
    UIViewController *controller = [GFRouter getControllerFromClassName:className];
    
    if (controller == nil) {
        return;
    }
    
    //给控制器参数赋值
    if (paraDic.allValues.count) {//字典值判空处理
        
        [GFRouter setPropertyWith:paraDic and:controller];
    }
    
    //推出控制器
    
    if ([paraDic[DISPLAY_STYLE] isEqualToString:PRESENT_STYLE]) {
        
        [GFRouter presentWith:controller];
    }else{
        
        [GFRouter pushWith:controller];
    }
}

//通过URL获取控制器
+ (UIViewController *)getControllerFromURL:(NSURL *)URL{
    
    NSString *subPath = [URL.path substringFromIndex:1];
    
    UIViewController *vc = [GFRouter getControllerFromClassName:subPath];
    
    return vc;
}

//通过类名获取控制器
+ (UIViewController *)getControllerFromClassName:(NSString *)controllerName{
    
    const char * name = [controllerName cStringUsingEncoding:NSASCIIStringEncoding];
    
    // 从一个类名返回一个类
    Class newClass = objc_getClass(name);
    // 创建对象
    if (newClass == nil) return nil;
    return [[newClass alloc] init];
}

//属性赋值
+ (UIViewController *)setPropertyWith:(NSMutableDictionary *)paraDic and:(UIViewController *)controller{
    
    [paraDic enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        // 检测这个对象是否存在该属性
        if ([GFRouter checkIsExistPropertyWithInstance:controller verifyPropertyName:key]) {
            // 利用kvc赋值
            [controller setValue:obj forKey:key];
        }
    }];
    return controller;
}


//校验实例是否存在该属性
+ (BOOL)checkIsExistPropertyWithInstance:(id)instance verifyPropertyName:(NSString *)verifyPropertyName
{
    unsigned int outCount, i;
    
    // 获取对象里的属性列表
    objc_property_t * properties = class_copyPropertyList([instance class], &outCount);
    
    for (i = 0; i < outCount; i++) {
        objc_property_t property =properties[i];
        //  属性名转成字符串
        NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        // 判断该属性是否存在
        if ([propertyName isEqualToString:verifyPropertyName]) {
            free(properties);
            return YES;
        }
    }
    free(properties);
    
    return NO;
}

//导航推出控制器
+ (void)pushWith:(UIViewController *)controller{
    
    UINavigationController *nc = [GFRouter getCurrentVC].navigationController;
    controller.hidesBottomBarWhenPushed = YES;
    
    if (nc) {
        [nc pushViewController:controller animated:YES];
    }
}

//模态推出控制器
+ (void)presentWith:(UIViewController *)controller{
    
    UIViewController *vc = [GFRouter getCurrentVC];
    
    if (vc.class != controller.class) {
        [vc presentViewController:controller animated:YES completion:nil];
    }
}

//获取URL中的属性参数
+ (NSMutableDictionary *)getParaWith:(NSURL *)URL{
    
    NSMutableDictionary *properties = [NSMutableDictionary dictionary];
    // Extract Params From Query.
    NSArray<NSURLQueryItem *> *queryItems = [[NSURLComponents alloc] initWithURL:URL resolvingAgainstBaseURL:false].queryItems;
    
    for (NSURLQueryItem *item in queryItems) {
       properties[item.name] = item.value;
    }
    
    return properties;
}

//获取当前viewController
+ (UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    //app默认windowLevel是UIWindowLevelNormal，如果不是，找到UIWindowLevelNormal的
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    id  nextResponder = nil;
    UIViewController *appRootVC=window.rootViewController;
    //    如果是present上来的appRootVC.presentedViewController 不为nil
    if (appRootVC.presentedViewController) {
        nextResponder = appRootVC.presentedViewController;
    }else{
        
        //        NSLog(@"===%@",[window subviews]);
        UIView *frontView = [[window subviews] objectAtIndex:0];
        nextResponder = [frontView nextResponder];
    }
    
    if ([nextResponder isKindOfClass:[UITabBarController class]]){
        UITabBarController * tabbar = (UITabBarController *)nextResponder;
        UINavigationController * nav = (UINavigationController *)tabbar.viewControllers[tabbar.selectedIndex];
        //UINavigationController * nav = tabbar.selectedViewController ; 上下两种写法都行
        result=nav.childViewControllers.lastObject;
        
    }else if ([nextResponder isKindOfClass:[UINavigationController class]]){
        UIViewController * nav = (UIViewController *)nextResponder;
        result = nav.childViewControllers.lastObject;
    }else{
        result = nextResponder;
    }
    return result;
}

@end
