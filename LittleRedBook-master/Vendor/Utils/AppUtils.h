//
//  AppUtils.h
//  HongKZH_IOS
//
//  Created by hongkzh on 2018/8/23.
//  Copyright © 2018年 hkzh. All rights reserved.
//
//FIXME:字典转字符串，字符串转字典
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
/*!
 *  @brief 屏幕缩放比例。由于UI的标注图参照iPhone6的尺寸，因此根据此尺寸需进行等比例缩放。
 */
FOUNDATION_EXPORT CGFloat kScale(CGFloat number);
/*!
 *  @brief 根据hex值转换成UIColor。
 *
 */
FOUNDATION_EXPORT UIColor * kColorWithHex(long hex);
FOUNDATION_EXPORT _Nullable id kUserDefaultsObjectForKey(NSString *key);
FOUNDATION_EXPORT void kUserDefaultsSetObjectForKey(_Nullable id obj, NSString *key);
typedef void(^HKResponseSuccess) (id _Nullable response);
typedef void(^HKResponseFail) (id _Nullable response);

typedef enum {
    PositionTypeLeft,
    PositionTypeRight
} PositionType;
@interface AppUtils : NSObject
/**
 *验证手机号是否合法
 */
+(BOOL)verifyPhoneNumbers:(NSString *)phoneNumberStr;

/**
 * 获取应用的bundle ID
 */
+(NSString *)bundleID;

/**
 * 当前应用版本
 */
+ (NSString *)currentVersion;

/**
 * 用户设备具体型号
 */
+(NSString *)iphoneType;
/**
 * 去掉字符串空格
 */

+ (NSString *)trim:(NSString *)value;

/**
 * 判断字符串是否为空
 */
+ (BOOL)isEmpty:(NSString *)value;

+ (BOOL)isNotEmpty:(NSString *)value;

+ (BOOL)isEmptyArray:(NSArray *)values;

+ (BOOL)isNotEmptyArray:(NSArray *)values;
/**
 * MD5加密
 */
+ (NSString *)md5:(NSString *)value;

/**
 * 编码字符串
 */
+ (NSString *)encodeURL:(NSString *)value;

/**
 * 解码字符串
 */
+ (NSString *)decodeURL:(NSString *)value;

/**
 * 将JSON字符串转成对象
 */
+ (id)parseJSON:(NSString *)value;

/**
 * 将对象转成JSON字符串
 */
+ (NSString *)toJSONString:(id)object;

/**
 * 获取唯一的UUID
 */
+ (NSString *)getUUID;

/**
 * 将NSInteger转成字符串
 */
+ (NSString *)toStr:(NSInteger)value;

/**
 * 将id类型转成int类型
 */
+ (NSInteger)toInteger:(id)value;

/**
 * 将id类型数据转成字符串
 */
+ (NSString *)toString:(id)value;


/**
 * 是否为系统表情输入模式
 */
+ (BOOL)isEmojiInputMode;


/**
 * 解析链接地址参数
 */
+ (NSString *)getQueryString:(NSString *)url paramName:(NSString *)paramName;

/**
 * 异步执行方法
 */
+ (void)dispatchAsync:(void (^)(id))handle complection:(void (^)(id))completion object:(id)object;

/**
 * 延时执行
 */
+ (void)delay:(void(^)(void))completion delayTime:(NSTimeInterval)delayTime;

/**
 * 图片加载
 */

+(void)seImageView:(UIImageView *)imageView withUrlSting:(NSString *)urlSting placeholderImage:(UIImage *)image;

/**
 * 获取搜索框中的输入框
 */
+ (UITextField *)getSearchBarTextField:(UISearchBar *)searchBar;

/**
 * 设置搜索框中的取消按钮样式
 */
+ (UIButton *)setSearchBarButtonStyle:(UISearchBar *)searchBar;

/**
 * 设置搜搜框的样式
 */
+ (void)setSearchBarStyle:(UISearchBar *)searchBar;
/**
 *  比较两个字符串是否相等
 *
 
 */
+ (BOOL)equals:(NSString *)string another:(NSString *)another;
/*!
 * @brief 把格式化的JSON格式的字符串转换成字典
 * @param jsonString JSON格式的字符串
 * @return 返回字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
/**
 * 生成分割线
 */
+ (CALayer *)addSeparatorLine:(UIView *)view frame:(CGRect)frame color:(UIColor *)color;
/**
 * 获取字符个数，一个中文算一个长度，两个英文算一个长度
 */
+ (NSUInteger)length:(NSString *)value;


/**
 AES加密方法
 
 @param content 需要加密的字符串
 @return 加密后的字符串
 */
+ (NSString *)encryptAES:(NSString *)content;
/**
 AES解密方法
 
 @param content 需要解密的字符串
 @return 解密后的字符串
 */
+ (NSString *)decryptAES:(NSString *)content;
@end
