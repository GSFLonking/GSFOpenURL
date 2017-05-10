# GSFOpenURL
iOS OpenURL 整理了一些常用的

    * 调用示例和说明:
    NSInteger success = [GSFOpenURL OpenAPPWithOpenURLHeaderType:GSFOpenURLTypeMaps withPath:^NSString *{
        /** 如果需要拼接字符串可以在此处处理
         * 注意!
         * 返回 @"":表示传递空字符串; nil:(null)
         * path这个block = nil 那么效果等同于@"" 如下面
         */
        return @"";
    } ifCantAPPOpenSafariURLString:^NSString *{
        /** 如果需要拼接字符串可以在此处处理
         * 注意!
         * 返回 @"":表示传递空字符串; nil:(null)
         * @"not do" 表示当打开失败的时候不再尝试用safari打开
         * URLString这个block = nil 那么尝试对path返回的string前面拼接"http://"是否能打开
         */
        return @"not do";
    }];
    NSLog(@"是否完成:%zd",success);// 0:跳转失败 1:跳转的APP 2:跳转的网页
    «««««««««««««««««««««««««««««««««««««««««««««««««««««««««
    * iOS10新方法 options尚在研究中 如果你知道什么可以告诉我
    [GSFOpenURL OpenAPPWithOpenURLHeaderType:GSFOpenURLTypePhone withPath:^NSString *{
        // 同上
        return self.openURLTextField.text;
    } option:^NSDictionary<NSString *,id> *{
        // iOS10新方法 options尚在研究中
        // NSDictionary *options = @{UIApplicationOpenURLOptionUniversalLinksOnly : @YES};
        /** UIApplication 的头文件中列了一个可用在 options字典中的key:
         * UIApplicationOpenURLOptionUniversalLinksOnly:可以设置布尔值，如果设置为true(YES),则只能打开应用里配置好的有效通用链接。如果应用程序没有配置，或者用于禁止打开这个链接，则 completion handler 回调里的success为false(NO)。
         * 为了覆写程序的默认动作（默认这个key的值是NO），我们需要创建一个字典，将对应的key 设置为true(YES),然后将字典传给 options 参数：
         */
        return options;
    } ifCantAPPOpenSafariURLString:^NSString *{
        // 同上
        return @"not do";
    } completionHandler:^(NSInteger success) {
        NSLog(@"是否完成:%zd",success);// 0:跳转失败 1:跳转的APP 2:跳转的网页
    }];
    «««««««««««««««««««««««««««««««««««««««««««««««««««««««««

