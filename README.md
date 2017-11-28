# GFRouter

主要功能是通过URL跳转到应用指定控制器

/**
 
 URL匹配规则:  scheme://host/控制器名称?属性名=属性值&属性名=属性值
 URL定义需符合RFC1808
 Example:
 GFRouterDemo://host/ThirdVC
 
 ------------------------------------------------------------
 
 推出方式: push 和 present
 默认从当前控制器push到目标控制器,隐藏底部Tabbar
 URL参数添加 displayStyle=present,目标控制器模态推出
 
 Example:
 GFRouterDemo://host/ThirdVC?displayStyle=present
 
 ------------------------------------------------------------
 
 
 # 使用
 - 将GFRouter导入项目工程中,在AppDelegate加入GFRouter.h头文件
 - 在 -(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options方法中调用 [GFRouter openURL:url] 方法
   ios 9.0 之前是在 -(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation方法中调用[GFROuter openURL:url] 方法
 - 浏览器中输入定义好的URL,然后会跳转到指定界面

