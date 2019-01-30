//
//  ModuleAMainController.m
//  JLRoutesDemo
//
//  Created by Destiny on 2019/1/29.
//  Copyright © 2019 Destiny. All rights reserved.
//

#import "ModuleAMainController.h"
#import "JsonHelper.h"

@interface ModuleAMainController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *dataSource;
@property (nonatomic, strong) NSDictionary *parameter;

@end

@implementation ModuleAMainController

- (NSDictionary *)parameter {
    if (!_parameter) {
        _parameter = [JsonHelper dictionaryWithJsonString:self.parameterJsonString];
    }
    return _parameter;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.dataSource = @[@"Push页面",@"Push页面传参",@"模态视图控制器"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"myCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = self.dataSource[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            {
                NSURL *viewUrl = [NSURL URLWithString:@"JLRoutesDemo://MouduleA/ModuleADeatil1ViewController/push"];
                [[RoutesMediator sharedInstance] openModuleWithURL:viewUrl];
            }
            break;
            
        case 1:
        {
            NSDictionary *dict = @{@"text" : @"传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传值传！！"
                                   };
             NSString *urlStr = [NSString stringWithFormat:@"JLRoutesDemo://MouduleA/ModuleADeatil2ViewController/push/%@",[JsonHelper dataTOjsonString:dict]];
            // 有汉字需要转义
             urlStr = [urlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
            [[RoutesMediator sharedInstance] openModuleWithURLParameters:[NSURL URLWithString:urlStr]];
        }
            break;
        case 2:
        {
            NSURL *viewUrl = [NSURL URLWithString:@"JLRoutesDemo://MouduleA/ModuleADeatil4ViewController/present"];
            [[RoutesMediator sharedInstance] openModuleWithURL:viewUrl];
        }
            break;
        case 3:
        {
             NSURL *viewUrl = [NSURL URLWithString:@"JLRoutesDemo://MouduleA/ModuleADeatil3ViewController/present"];
            [[RoutesMediator sharedInstance] openModuleWithURL:viewUrl];
        }
            break;
        default:
            break;
    }
}

@end
