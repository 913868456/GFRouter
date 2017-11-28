# GFRouter

主要功能是通过URL跳转到应用指定控制器

/**
 
 URL匹配规则:  scheme://host/path?query
 
 Example:
 GFRouterDemo://host/ThirdVC
 
 ------------------------------------------------------------
 
 推出方式: push 和 present
 默认从当前控制器push到目标控制器,隐藏底部Tabbar
 URL参数添加 displayStyle=present,目标控制器模态推出
 
 Example:
 GFRouterDemo://host/ThirdVC/displayStyle=present
 
 ------------------------------------------------------------

