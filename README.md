# GFRouter

 Through URL map to spercify controller and push (or present) it. 
 
 > NOTE: URL needs to match RFC1808
 
 # Usage
 - Import GFRouter to your Project, and include GFRouter.h in AppDelegate.
 - Joining together the URL like this 
 ```
 /**
  para: displayStyle  Defalut is push, and ViewController's proproperty hideBottomBarWhenPushed is YES. if displayStyle equals to present,
  current ViewController will present another viewcontrolller.
 
  Example:
  GFRouterDemo://host/controllerName?prepertyName=value&propertyName=valueC&displayStyle=present
 */
 ```
 
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
 
