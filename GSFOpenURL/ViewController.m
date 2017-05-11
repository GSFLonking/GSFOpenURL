//
//  ViewController.m
//  GSFOpenURL
//
//  Created by 孤少 on 2017/5/2.
//  Copyright © 2017年 孤少. All rights reserved.
//

#import "ViewController.h"
#import "GSFOpenURL.h"
@interface ViewController ()
/// 输入框
@property (weak, nonatomic) IBOutlet UITextField *openURLTextField;
/// 用Safari打开的地址输入框
@property (weak, nonatomic) IBOutlet UITextField *webURLTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)openURLButton:(UIButton *)sender {
//    * 调用示例和说明:
//    NSInteger success = [GSFOpenURL OpenAPPWithOpenURLHeaderType:GSFOpenURLTypeJingDong withPath:^NSString *{
//        /** 如果需要拼接字符串可以在此处处理
//         * 注意!
//         * 返回 @"":表示传递空字符串; nil:不跳转APP
//         * path这个block = nil 那么效果等同于 return @"" 如下面
//         */
//        return @"";
//    } ifCantAPPOpenSafariURLString:^NSString *{
//        /** 如果需要拼接字符串可以在此处处理
//         * 注意!
//         * 返回 @"":表示传递空字符串; nil:表示当打开失败的时候不再尝试用safari打开
//         * URLString这个block = nil 那么尝试对path返回的string前面拼接"http://"是否能打开
//         */
//        return nil;
//    }];
//    «««««««««««««««««««««««««««««««««««««««««««««««««««««««««
//    * iOS10新方法 options尚在研究中 如果你知道什么可以告诉我
//    [GSFOpenURL OpenAPPWithOpenURLHeaderType:GSFOpenURLTypePhone withPath:^NSString *{
//        return self.openURLTextField.text;
//    } option:^NSDictionary<NSString *,id> *{
//        //iOS10新方法 options尚在研究中
//        // NSDictionary *options = @{UIApplicationOpenURLOptionUniversalLinksOnly : @YES};
//        /** UIApplication 的头文件中列了一个可用在 options字典中的key:
//         * UIApplicationOpenURLOptionUniversalLinksOnly:可以设置布尔值，如果设置为true(YES),则只能打开应用里配置好的有效通用链接。如果应用程序没有配置，或者用于禁止打开这个链接，则 completion handler 回调里的success为false(NO)。
//         * 为了覆写程序的默认动作（默认这个key的值是NO），我们需要创建一个字典，将对应的key 设置为true(YES),然后将字典传给 options 参数：
//         */
//        return options;
//    } ifCantAPPOpenSafariURLString:^NSString *{
//        return nil;
//    } completionHandler:^(NSInteger success) {
//        NSLog(@"是否完成:%zd",success);
//    }];
//    «««««««««««««««««««««««««««««««««««««««««««««««««««««««««
    NSLog(@"打开URL:%@",self.openURLTextField.text);
    // 打开自定义的 例如 你公司的项目,合作公司的项目 之间互相调用
    NSInteger success = [GSFOpenURL OpenAPPWithOpenURLHeaderType:GSFOpenURLTypeCustom withPath:^NSString *{
        return self.openURLTextField.text;
    } ifCantAPPOpenSafariURLString:^NSString *{
        return self.webURLTextField.text;
    }];
    
    
    NSLog(@"是否完成:%zd",success);
}

- (IBAction)openURLSttingCodeButton:(UIButton *)sender {
    
    NSInteger success = [GSFOpenURL OpenAPPWithOpenURLHeaderType:GSFOpenURLTypeMaps withPath:^NSString *{
        return self.openURLTextField.text;
    } ifCantAPPOpenSafariURLString:^NSString *{
        return self.webURLTextField.text;
    }];
//    两个都传nil的情况 一定是什么都没走 和 Path:nil SafariURLString:@"" 是一样的效果 但是和 type!=GSFOpenURLTypeCustom  path:@""  SafariURLString:nil/@"" 是不一样的效果
//    NSInteger success = [GSFOpenURL OpenAPPWithOpenURLHeaderType:GSFOpenURLTypeMaps withPath:nil ifCantAPPOpenSafariURLString:nil];
    NSLog(@"是否完成:%zd",success);
}

@end
