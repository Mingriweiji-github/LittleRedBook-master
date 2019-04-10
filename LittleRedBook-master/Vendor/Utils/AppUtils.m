//
//  AppUtils.m
//  HongKZH_IOS
//
//  Created by hongkzh on 2018/8/23.
//  Copyright © 2018年 hkzh. All rights reserved.
//

#import "AppUtils.h"
#import <sys/utsname.h>

/*method*/
CGFloat kScale(CGFloat number) {
    return  number * kScreenWidth / 375;
}
UIColor * kColorWithHex(long hex) {
    float red = ((float)((hex & 0xFF0000) >> 16)) / 255.0;
    float green = ((float)((hex & 0xFF00) >> 8)) / 255.0;
    float blue = ((float)(hex & 0xFF)) / 255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0f];
}
_Nullable id kUserDefaultsObjectForKey(NSString *key) {
    if (!key) {
        return nil;
    }
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}
void kUserDefaultsSetObjectForKey(_Nullable id obj, NSString *key) {
    [[NSUserDefaults standardUserDefaults] setObject:obj forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
@implementation AppUtils
const int GB = 1024 * 1024 * 1024;//定义GB的计算常量
const int MB = 1024 * 1024;//定义MB的计算常量
const int KB = 1024;//定义KB的计算常量
+ (NSString *)currentVersion
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleShortVersionString"];
}
+(NSString *)iphoneType {
    
    struct utsname systemInfo;
    
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 2G";
    
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
    
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
    
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
    
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4";
    
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4";
    
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
    
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5";
    
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c";
    
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c";
    
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s";
    
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s";
    
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";
    
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";
    
    return platform;
}
+ (NSString *)trim:(NSString *)value
{
    if (value == nil) {
        return nil;
    }
    value = [value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return [value stringByReplacingOccurrencesOfString:@"\u2006" withString:@""];
}
+ (BOOL)isEmpty:(NSString *)value
{
    return value == nil || [AppUtils trim:value].length == 0;
}
//FIXME:判断字符串是否为空 空返回no
+ (BOOL)isNotEmpty:(NSString *)value
{
    if ([value isKindOfClass:[NSNull class]]) {
        return NO;
    }
    
    return ![AppUtils isEmpty:value];
}
+ (BOOL)isEmptyArray:(NSArray *)values
{
    if ([values isKindOfClass:[NSNull class]]) {
        return YES;
    }
    return values == nil || values.count == 0;
}

+ (BOOL)isNotEmptyArray:(NSArray *)values
{
    return ![self isEmptyArray:values];
}
+ (NSString *)encodeURL:(NSString *)value
{
    if (value == nil) {
        return @"";
    }
    NSMutableString *temp = [[NSMutableString alloc] initWithString:[NSString stringWithFormat:@"%@", value]];
    NSString *resultStr = value;
    CFStringRef originalString = (__bridge CFStringRef) temp;
    CFStringRef leaveUnescaped = CFSTR(" ");
    CFStringRef forceEscaped = CFSTR("!'();:@&=+$,/?%#[]~");
    CFStringRef escapedStr;
    escapedStr = CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                         originalString,
                                                         leaveUnescaped,
                                                         forceEscaped,
                                                         kCFStringEncodingUTF8);
    if (escapedStr) {
        NSMutableString *mutableStr = [NSMutableString stringWithString:(__bridge NSString *)escapedStr];
        CFRelease(escapedStr);
        if (!mutableStr || [mutableStr isKindOfClass:[NSNull class]] || mutableStr.length <= 0) {
            return resultStr;
        }
        // replace spaces with plusses
        [mutableStr replaceOccurrencesOfString:@" "
                                    withString:@"+"
                                       options:0
                                         range:NSMakeRange(0, [mutableStr length])];
        resultStr = mutableStr;
    }
    return resultStr;
}

+ (NSString *)decodeURL:(NSString *)value
{
    if ([self isEmpty:value]) {
        return nil;
    }
    NSMutableString *outputStr = [NSMutableString stringWithString:value];
    [outputStr replaceOccurrencesOfString:@"+" withString:@" " options:NSLiteralSearch range:NSMakeRange(0, outputStr.length)];
    return [outputStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}
+ (id)parseJSON:(NSString *)value
{
    
    id object = nil;
    @try {
        
        NSData *data = [value dataUsingEncoding:NSUTF8StringEncoding];
        if (data) {
            object = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        }
    }
    @catch (NSException *exception) {
        
//        DSLog(@"%s [Line %d] JSON字符串转成对象出错，原因：%@",  __PRETTY_FUNCTION__, __LINE__, exception);
    }
    return object;
}
//FIXME:任意类型转成string
+ (NSString *)toJSONString:(id)object

{
    NSString *jsonStr = @"";
    @try {
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object options:0 error:nil];
        jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    @catch (NSException *exception) {
//        DSLog(@"%s [Line %d] 对象转成JSON字符串出错，原因：%@", __PRETTY_FUNCTION__, __LINE__, exception);
    }
    return jsonStr;
}
#pragma mark -  字典转json格式字符串：
+ (NSString*)dictionaryToJson:(NSDictionary *)dic
{
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}


////先定义一个初始向量的值。
//NSString *const kInitVector = @"B5DE65ERt84067EF";
//NSString *const key= @"B5DE65ERt84067EF";
////确定密钥长度，这里选择 AES-128。
//size_t const kKeySize = kCCKeySizeAES128;
///**
// AES加密方法
//
// @param content 需要加密的字符串
// @return 加密后的字符串
// */
//+ (NSString *)encryptAES:(NSString *)content{
//    NSData *contentData = [content dataUsingEncoding:NSUTF8StringEncoding];
//    NSUInteger dataLength = contentData.length;
//    // 为结束符'\\0' +1
//    char keyPtr[kKeySize + 1];
//    memset(keyPtr, 0, sizeof(keyPtr));
//    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
//    // 密文长度 <= 明文长度 + BlockSize
//    size_t encryptSize = dataLength + kCCBlockSizeAES128;
//    void *encryptedBytes = malloc(encryptSize);
//    size_t actualOutSize = 0;
//    NSData *initVector = [kInitVector dataUsingEncoding:NSUTF8StringEncoding];
//    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
//                                          kCCAlgorithmAES,
//                                          kCCOptionPKCS7Padding,  // 系统默认使用 CBC，然后指明使用 PKCS7Padding
//                                          keyPtr,
//                                          kKeySize,
//                                          initVector.bytes,
//                                          contentData.bytes,
//                                          dataLength,
//                                          encryptedBytes,
//                                          encryptSize,
//                                          &actualOutSize);
//    if (cryptStatus == kCCSuccess) {
//        // 对加密后的数据进行 base64 编码
//        return [[NSData dataWithBytesNoCopy:encryptedBytes length:actualOutSize] base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
//    }
//    free(encryptedBytes);
//    return nil;
//}
///**
// AES解密方法
//
// @param content 需要解密的字符串
// @return 解密后的字符串
// */
//+ (NSString *)decryptAES:(NSString *)content{
//    // 把 base64 String 转换成 Data
//    NSData *contentData = [[NSData alloc] initWithBase64EncodedString:content options:NSDataBase64DecodingIgnoreUnknownCharacters];
//    NSUInteger dataLength = contentData.length;
//    char keyPtr[kKeySize + 1];
//    memset(keyPtr, 0, sizeof(keyPtr));
//    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
//    size_t decryptSize = dataLength + kCCBlockSizeAES128;
//    void *decryptedBytes = malloc(decryptSize);
//    size_t actualOutSize = 0;
//    NSData *initVector = [kInitVector dataUsingEncoding:NSUTF8StringEncoding];
//    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
//                                          kCCAlgorithmAES,
//                                          kCCOptionPKCS7Padding,
//                                          keyPtr,
//                                          kKeySize,
//                                          initVector.bytes,
//                                          contentData.bytes,
//                                          dataLength,
//                                          decryptedBytes,
//                                          decryptSize,
//                                          &actualOutSize);
//    if (cryptStatus == kCCSuccess) {
//        return [[NSString alloc] initWithData:[NSData dataWithBytesNoCopy:decryptedBytes length:actualOutSize] encoding:NSUTF8StringEncoding];
//    }
//    free(decryptedBytes);
//    return nil;
//}

@end
