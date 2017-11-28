# GFRouter

通过URL跳转到应用指定控制器

/**
 
 URL匹配规则:  scheme://host/path?query
 
 Example:
 GFRouterDemo://www.baidu.com/ThirdVC
 
 ------------------------------------------------------------
 
 推出方式: push 和 present
 默认从当前控制器push到目标控制器,隐藏底部Tabbar
 URL参数添加 displayStyle=present,目标控制器模态推出
 
 Example:
 GFRouterDemo://www.baidu.com/ThirdVC/displayStyle=present
 
 ------------------------------------------------------------
 
 */

+ (void)openURL:(NSURL *)URL;

/**
 
 应用内部跳转 需要传入目标控制器和属性字典
 
 @para controller 目标控制器
 @para paraDic    控制器属性字典 属性为空则传nil
 
 */
+ (void)openClassName:(NSString *)className parameters:(NSMutableDictionary *)paraDic;

/**
 传入控制器名称,获取控制器实例
 */
+ (UIViewController *)getControllerFromClassName:(NSString *)controllerName;
