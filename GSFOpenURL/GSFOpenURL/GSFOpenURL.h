//
//  GSFOpenURL.h
//  GSFOpenURL
//
//  Created by 孤少(ws2103916@163.com) on 2017/5/2.
//  Copyright © 2017年 孤少. All rights reserved.
//
// enum没有排名 随手而为
// 如果跳转已经不可用 可以联系我
// 网银没有找完 如果知道的也可以告诉我

#import <UIKit/UIKit.h>
typedef enum : NSUInteger {
    GSFOpenURLTypeCustom = 0,//自定义 头自己输
#pragma mark - 系统跳转
    GSFOpenURLTypeFindMyFriends,//查找我的朋友
    GSFOpenURLTypeFindiPhone,//查找我的iPhone
    GSFOpenURLTypeNotes,//备忘录
    GSFOpenURLTypePhone,//电话需要添加打的电话号码
    GSFOpenURLTypeSMS,//短信 同电话
    GSFOpenURLTypeE_Mail,
    GSFOpenURLTypeBooks,//iBook
    GSFOpenURLTypeAppStore,
    GSFOpenURLTypeMaps,//系统地图
    // 下面的path传@""
    // iOS10出来以后 prefs跳转设置已经被苹果强制取消(注释掉的部分 
//    GSFOpenURLTypeCellular,//蜂窝网络
//    GSFOpenURLTypeWIFI,
//    GSFOpenURLTypeLocation,//定位服务
    GSFOpenURLTypeSettings,
#pragma mark - 社交
    GSFOpenURLTypeQQ,
    GSFOpenURLTypeQQInternational,//国际版QQ
    GSFOpenURLTypeWeChat,
    GSFOpenURLTypeSinaWebo,
    GSFOpenURLTypeRenRen,
#pragma mark - 地图
    GSFOpenURLTypeAmap,//高德地图
    GSFOpenURLTypeBaiDuMap,
#pragma mark - 花钱
    GSFOpenURLTypeAlipay,//支付宝
    GSFOpenURLTypeJingDong,
    GSFOpenURLTypeJingDongHD,//京东HD
    GSFOpenURLTypeTaoBao,
    GSFOpenURLTypeTaoBaoHD,//淘宝HD
    GSFOpenURLTypeTmall,//天猫
    
    GSFOpenURLTypeMeiTuan,
    GSFOpenURLTypeMeiTuanHD,//美团HD
    GSFOpenURLTypeDaZhongDianPing,
    GSFOpenURLTypeDaZhongDianPingHD,//大众点评HD
    GSFOpenURLTypeBaiDuNuoMi,
#pragma mark - 银行 (没整理完
    GSFOpenURLTypeBankSPD,//浦发银行
    GSFOpenURLTypeBankICBC,//工商银行
    GSFOpenURLTypeBankCBC,//建设银行
    GSFOpenURLTypeBankCMB,//招商银行
#pragma mark - 视频
    GSFOpenURLTypeBilibili,
    GSFOpenURLTypeYouKu,
    GSFOpenURLTypeYouKuHD,//优酷HD
    GSFOpenURLTypePPTV,
    GSFOpenURLTypePPS,//爱奇艺pps
    GSFOpenURLTypeiQIYI,
    GSFOpenURLTypeDouBanFM,
#pragma mark - 音乐
    GSFOpenURLTypeQQMusic,
    GSFOpenURLTypeKuWO,
    GSFOpenURLTypeKuGou,
#pragma mark - 其他
    GSFOpenURLTypeWPS,
    GSFOpenURLTypeThunder,//迅雷
    GSFOpenURLTypeBaiDuYun,
    GSFOpenURLTypeSinaVdisk,//微盘

    
} GSFOpenURLType;

@interface GSFOpenURL : NSObject
/**
 用openURL跳转到指定应用

 @param headerType 根据enum判断指定的openURL前缀是什么
 @param path 返回除去前缀的路径 自定义类型加上前缀 如需处理拼接字符串可在这个block里写 部分系统跳转直接传nil
 @param URLString 如果path前缀拼接"http://"不是网页地址的话请返回跳转的绝对地址 是的话用nil 如果需要自处理没有安装APP的情况请输入:@"not do"
 @return 0:跳转失败 1:跳转的APP 2:跳转的网页
 */
+ (NSInteger)OpenAPPWithOpenURLHeaderType:(GSFOpenURLType)headerType withPath:(NSString *(^)())path ifCantAPPOpenSafariURLString:(NSString *(^)())URLString NS_DEPRECATED_IOS(2_0, 10_0, "Please use OpenAPPWithOpenURLHeaderType:withPath:options:ifCantAPPOpenSafariURLString:completionHandler: instead") NS_EXTENSION_UNAVAILABLE_IOS("");


/**
 用openURL:options:completionHandler:跳转到指定应用
 
 @param headerType 根据enum判断指定的openURL前缀是什么
 @param path 返回除去前缀的路径 自定义类型加上前缀 如需处理拼接字符串可在这个block里写 部分系统跳转直接传nil
 @param option 返回 iOS10新方法的options的字典
 @param URLString 如果path前缀拼接"http://"不是网页地址的话请返回跳转的绝对地址 是的话用nil 如果需要自处理没有安装APP的情况请输入:@"not do"
 @param completion 0:跳转失败 1:跳转的APP 2:跳转的网页
 */
+ (void)OpenAPPWithOpenURLHeaderType:(GSFOpenURLType)headerType withPath:(NSString *(^)())path option:(NSDictionary<NSString *, id> * (^)())option ifCantAPPOpenSafariURLString:(NSString *(^)())URLString completionHandler:(void (^)(NSInteger success))completion  NS_AVAILABLE_IOS(10_0) NS_EXTENSION_UNAVAILABLE_IOS("");

@end
