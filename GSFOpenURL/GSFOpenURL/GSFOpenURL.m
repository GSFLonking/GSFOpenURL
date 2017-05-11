//
//  GSFOpenURL.m
//  GSFOpenURL
//
//  Created by 孤少 on 2017/5/2.
//  Copyright © 2017年 孤少. All rights reserved.
//

#import "GSFOpenURL.h"

@implementation GSFOpenURL
/**
 用openURL跳转到指定应用
 
 @param headerType 根据enum判断指定的openURL前缀是什么
 @param path 返回除去前缀的路径 自定义类型加上前缀 如需处理拼接字符串可在这个block里写 return nil:不跳转APP
 @param URLString 如果path前缀拼接"https://"不是网页地址的话请返回跳转的绝对地址 是的话用nil 如果需要自处理没有安装APP的情况 return nil
 @return 0:跳转失败 1:跳转的APP 2:跳转的网页
 */
+ (NSInteger)OpenAPPWithOpenURLHeaderType:(GSFOpenURLType)headerType withPath:(NSString *(^)())path ifCantAPPOpenSafariURLString:(NSString *(^)())URLString{
    NSString *headerString = [self swichHeaderType:headerType];
    NSString *pathString = path ? path() : @"";
    NSString *openURL = [NSString stringWithFormat:@"%@%@",headerString,pathString];
    if (pathString && [[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString:openURL]]) {
        return [[UIApplication sharedApplication]openURL:[NSURL URLWithString:openURL]];
    }
    if (!URLString){
        headerString = @"http://";
        openURL = [NSString stringWithFormat:@"%@%@",headerString,pathString];
        if ([[UIApplication sharedApplication]openURL:[NSURL URLWithString:openURL]]) {
            return 2;
        }
        return 0;
    }
    openURL = URLString();
    if (!openURL){
        return 0;
    }
    if ([[UIApplication sharedApplication]openURL:[NSURL URLWithString:openURL]]) {
        return 2;
    }
    return 0;
}
/**
 用openURL:options:completionHandler:跳转到指定应用
 
 @param headerType 根据enum判断指定的openURL前缀是什么
 @param path 返回除去前缀的路径 自定义类型加上前缀 如需处理拼接字符串可在这个block里写 return nil:不跳转APP
 @param option 返回 iOS10新方法的options
 @param URLString 如果path前缀拼接"https://"不是网页地址的话请返回跳转的绝对地址 是的话用nil 如果需要自处理没有安装APP的情况 return nil
 @param completion 0:跳转失败 1:跳转的APP 2:跳转的网页
 */
+ (void)OpenAPPWithOpenURLHeaderType:(GSFOpenURLType)headerType withPath:(NSString *(^)())path option:(NSDictionary<NSString *,id> * (^)())option ifCantAPPOpenSafariURLString:(NSString *(^)())URLString completionHandler:(void (^)(NSInteger))completion{
    NSString *headerString = [self swichHeaderType:headerType];
    NSString *pathString = path ? path() : @"";
    NSDictionary<NSString *,id> *options = option ? option() : nil;
    NSString *openURL = [NSString stringWithFormat:@"%@%@",headerString,pathString];
    if (pathString && [[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString:openURL]]) {        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:openURL]options:options completionHandler:^(BOOL success) {
            completion(success);
        }];
        return;
    }
    if (!URLString){
        headerString = @"http://";
        openURL = [NSString stringWithFormat:@"%@%@",headerString,pathString];
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:openURL]options:options completionHandler:^(BOOL success) {
            if (success) {
                completion(2);
            }
            completion(0);
        }];
        return;
    }
    openURL = URLString();
    if (!openURL){
        return;
    }
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:openURL]options:options completionHandler:^(BOOL success) {
        if (success) {
            completion(2);
        }
        completion(0);
    }];
}

+ (NSString *)swichHeaderType:(GSFOpenURLType)headerType{
    NSString *headerString = @"";
    switch (headerType) {
        case GSFOpenURLTypeCustom:
            headerString = @"";
            break;
#pragma mark 系统跳转
        case GSFOpenURLTypeFindMyFriends:
            headerString = @"findmyfriends://";
            break;
        case GSFOpenURLTypeFindiPhone:
            headerString = @"fmip1://";
            break;
        case GSFOpenURLTypeNotes:
            headerString = @"mobilenotes://";
            break;
        case GSFOpenURLTypePhone:
            headerString = @"tel://";
            break;
        case GSFOpenURLTypeSMS:
            headerString = @"sms://";
            break;
        case GSFOpenURLTypeE_Mail:
            headerString = @"MESSAGE://";//mailto也可以
            break;
        case GSFOpenURLTypeBooks:
            headerString = @"itms-books://";
            break;
        case GSFOpenURLTypeAppStore:
            headerString = @"itms-apps://";
            break;
        case GSFOpenURLTypeMaps:
            headerString = @"maps://";
            break;
            // prefs 跳转设置已经被苹果强制取消
//        case GSFOpenURLTypeCellular:
//            headerString = @"prefs:root=MOBILE_DATA_SETTINGS_ID";
//            break;
//        case GSFOpenURLTypeWIFI:
//            headerString = @"prefs:root=WIFI";
//            break;
//        case GSFOpenURLTypeLocation:
//            headerString = @"prefs:root=LOCATION_SERVICES";
//            break;
        case GSFOpenURLTypeSettings:
            headerString = UIApplicationOpenSettingsURLString;
            break;
#pragma mark 社交
        case GSFOpenURLTypeQQ:
            headerString = @"mqq://";
            break;
        case GSFOpenURLTypeQQInternational:
            headerString = @"mqqiapi://";
            break;
        case GSFOpenURLTypeWeChat:
            headerString = @"weixin://";
            break;
        case GSFOpenURLTypeSinaWebo:
            headerString = @"sinaweibo://";
            break;
        case GSFOpenURLTypeRenRen:
            headerString = @"renren://";
            break;
#pragma mark - 地图
        case GSFOpenURLTypeAmap:
            headerString = @"iosamap://";
            break;
        case GSFOpenURLTypeBaiDuMap:
            headerString = @"baidumap://";
            break;
#pragma mark - 花钱
        case GSFOpenURLTypeAlipay:
            headerString = @"alipay://";
            break;
        case GSFOpenURLTypeJingDong:
            headerString = @"openApp.jdMobile://";
            break;
        case GSFOpenURLTypeJingDongHD:
            headerString = @"openApp.jdiPad://";
            break;
        case GSFOpenURLTypeTaoBao:
            headerString = @"taobao://";
            break;
        case GSFOpenURLTypeTaoBaoHD:
            headerString = @"taobaohd://";
            break;
        case GSFOpenURLTypeTmall:
            headerString = @"tmall://";
            break;
        case GSFOpenURLTypeMeiTuan:
            headerString = @"imeituan://";
            break;
        case GSFOpenURLTypeMeiTuanHD:
            headerString = @"iMeituan://";
            break;
        case GSFOpenURLTypeDaZhongDianPing:
            headerString = @"dianping://";
            break;
        case GSFOpenURLTypeDaZhongDianPingHD:
            headerString = @"dianpinghd://";
            break;
        case GSFOpenURLTypeBaiDuNuoMi:
            headerString = @"bainuo://";
            break;
#pragma mark - 银行
        case GSFOpenURLTypeBankSPD:
            headerString = @"wx1cb534bb13ba3dbd://";
            break;
        case GSFOpenURLTypeBankICBC:
            headerString = @"com.icbc.iphoneclient://";
            break;
        case GSFOpenURLTypeBankCBC:
            headerString = @"wx2654d9155d70a468://";
            break;
        case GSFOpenURLTypeBankCMB:
            headerString = @"cmbmobilebank://";
            break;
#pragma mark - 视频
        case GSFOpenURLTypeBilibili:
            headerString = @"bilibili://";
            break;
        case GSFOpenURLTypeYouKu:
            headerString = @"youku://";
            break;
        case GSFOpenURLTypeYouKuHD:
            headerString = @"youkuhd://";
            break;
        case GSFOpenURLTypePPTV:
            headerString = @"pptv://";
            break;
        case GSFOpenURLTypePPS:
            headerString = @"ppstream://";
            break;
        case GSFOpenURLTypeiQIYI:
            headerString = @"qiyi-iphone://";
            break;
        case GSFOpenURLTypeDouBanFM:
            headerString = @"doubanradio://";
            break;
#pragma mark - 音乐
        case GSFOpenURLTypeQQMusic:
            headerString = @"QQmusic://";
            break;
        case GSFOpenURLTypeKuWO:
            headerString = @"com.kuwo.kwmusic.kwmusicForKwsing://";
            break;
        case GSFOpenURLTypeKuGou:
            headerString = @"kugouURL://";
            break;
#pragma mark - 其他
        case GSFOpenURLTypeWPS:
            headerString = @"KingsoftOfficeApp://";
            break;
        case GSFOpenURLTypeThunder:
            headerString = @"thunder://";
            break;
        case GSFOpenURLTypeBaiDuYun:
            headerString = @"baiduyun://";
            break;
        case GSFOpenURLTypeSinaVdisk:
            headerString = @"sinavdisk://";
            break;
//        case <#constant#>:
//            headerString = @"<#statements#>";
//            break;
        default:
            break;
    }
    return headerString;
}
@end
