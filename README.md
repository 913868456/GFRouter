# GFRouter

 Through URL map to spercify controller and push it.

 URL needs to match RFC1808
 
 Example:
 GFRouterDemo://host/controllerName?prepertyName=value&propertyName=value
 
 ------------------------------------------------------------
 
 DisplayStyle: push and present
 Defalut displayStyle is push, and hideBottomBarWhenPushed = YES
 
 Example:
 GFRouterDemo://host/ThirdVC?displayStyle=present
 
 ------------------------------------------------------------
 
 
 # Useage
 - Import GFRouter to your Project, and include GFRouter.h in AppDelegate.
 
 - Call methods as follows:
 
 ```
 //iOS 9.0 later call this method
 - (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
   
    return  [GFRouter openURL:url];
 }
 
 //before iOS 9.0 call this method 
 - (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    return  [GFRouter openURL:url];
 }
 ```
 - Through Safari To Open the URL.
 
