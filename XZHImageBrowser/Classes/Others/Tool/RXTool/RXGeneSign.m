//
//  RXGeneSign.m
//  RenXing
//
//  Created by ycmedia_imac on 16/7/12.
//  Copyright © 2016年 ycmedia_imac. All rights reserved.
//

#import "RXGeneSign.h"

@implementation RXGeneSign

// 拼接字符串
+ (NSString *)geneSignWithDictionary:(NSDictionary *)dict{
    NSString *signStr = [[NSString alloc]init];
    for(NSString *key in dict){
        signStr = [NSString stringWithFormat:@"%@%@=%@&",signStr, key, [dict objectForKey:key]];
    }
    signStr = [NSString stringWithFormat:@"%@&ApiSecret=2W0BW542WBDRA1VG76W8NTMD95YMSY1G", signStr];
    return [self geneCapStr:signStr];
}

+ (NSString *)geneSignWithStr:(NSString *)str{
    NSString *signStr = [NSString stringWithFormat:@"%@&ApiSecret=2W0BW542WBDRA1VG76W8NTMD95YMSY1G", str];
//    RXLog(@"拼接后的字符串%@", signStr);
    return [self geneCapStr:signStr];
}

// 对字符串----url编码---MD5加密---大写
+ (NSString *)geneCapStr:(NSString *)str{
    // 对字符串进行url编码
    NSString *encodeSignStr = [RXMD5 encodeToPercentEscapeString:str];
    //RXLog(@"对字符串url编码:%@", encodeSignStr);
    NSString *capitalEncodeStr = [encodeSignStr uppercaseString];  //转换成大写
    // 进行MD5加密
    NSString *md5Str = [RXMD5 md5:capitalEncodeStr];
    //RXLog(@"对字符串进行MD5加密：%@", md5Str);
    NSString *capMD5SignStr = [md5Str uppercaseString]; //转换成大写
//    RXLog(@"对字符串转成大写:%@", capMD5SignStr);
    return capMD5SignStr;
}

/*
// mac登录
+ (void)getMacLoginToken:(void (^)(id))success failure:(void (^)(NSError *))failure{
    // 如果没有登录，就用mac登录
    NSString *currUserUUIDStr = [RXUserDefaultTool getObjectForKey:@"userUUIDStr"];
    NSString *str = [NSString stringWithFormat:@"AppSource=2&Mac=%@", currUserUUIDStr];
    NSString *signStr = [RXGeneSign geneSignWithStr:str];
    NSDictionary *dict =@{
                          @"AppSource":@(2),
                          @"Mac":currUserUUIDStr,
                          @"Sign":signStr,
                          };
    [[RXHttpTool shareInstance] postWithURL:@"http://180.97.83.236:1003/APII/API_User_Account_Login_Mac" params:dict success:^(id json) {
        if(success){
            success(json);
        }
//        if([json[@"result"] isEqual:@(1)]){
//            [RXUserDefaultTool saveObject:@"macLoginToken" forKey:json[@"result"]];
//        }
    } failure:^(NSError *error) {
        if(failure){
            failure(error);
        }
    }];
}

*/


@end




