# GFRouter

主要功能是通过URL跳转到应用指定控制器

/**
 
 URL匹配规则:  scheme://host/控制器名称?属性名=属性值&属性名=属性值
 
 Example:
 GFRouterDemo://host/ThirdVC
 
 ------------------------------------------------------------
 
 推出方式: push 和 present
 默认从当前控制器push到目标控制器,隐藏底部Tabbar
 URL参数添加 displayStyle=present,目标控制器模态推出
 
 Example:
 GFRouterDemo://host/ThirdVC/displayStyle=present
 
 ------------------------------------------------------------
 
 
 # 使用

 - 添加GFRouter.h GFRouter.m 到工程中
 - 导入GFRouter.h 头文件
 - 在 APPDelegate中添加下面方法
 
   -(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    
    [GFRouter openURL:url];
      return YES;
   }
 - 完成调用.可以使用浏览器输入URL测试一下了.

