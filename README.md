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
 
 - 在AppDelegate中调用Router方法
 
 ```
 //iOS 9.0以后外部链接打开应用会调用该方法
 - (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
   
    return  [GFRouter openURL:url];
 }
 
 //iOS 9.0之前外部链接打开应用会调用该方法
 - (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    return  [GFRouter openURL:url];
 }
 ```
 - 浏览器中输入定义好的URL,通过scheme跳转到指定界面
 
 
 MIT License

Copyright (c) 2017 

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

