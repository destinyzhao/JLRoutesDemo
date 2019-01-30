//
//  ModuleADeatil4ViewController.m
//  JLRoutesDemo
//
//  Created by Destiny on 2019/1/30.
//  Copyright © 2019 Destiny. All rights reserved.
//

#import "ModuleADeatil4ViewController.h"

@interface ModuleADeatil4ViewController ()

@property (nonatomic, strong) NSDictionary *parameter;

@end

@implementation ModuleADeatil4ViewController

- (NSDictionary *)parameter {
    if (!_parameter) {
        _parameter = [JsonHelper dictionaryWithJsonString:self.parameterJsonString];
    }
    return _parameter;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"模态视图";
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
