# JLRoutesDemo
JLRoutesDemo

#####使用
跳转无参数
```
NSURL *viewUrl = [NSURL URLWithString:@"JLRoutesDemo://MouduleA/ModuleADeatil1ViewController/push"];
[[RoutesMediator sharedInstance] openModuleWithURL:viewUrl];
```
跳转有参数
```
NSDictionary *dict = @{@"text" : @"传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传！！"
                                   };
NSString *urlStr = [NSString stringWithFormat:@"JLRoutesDemo://MouduleA/ModuleADeatil2ViewController/push/%@",[JsonHelper dataTOjsonString:dict]];
// 有汉字需要转义
urlStr = [urlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
[[RoutesMediator sharedInstance] openModuleWithURLParameters:[NSURL URLWithString:urlStr]];
```
