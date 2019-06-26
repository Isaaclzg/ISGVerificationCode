//
//  ISGVerificationConfig.h
//  ISGVerificationCode
//
//  Created by apple on 2019/6/25.
//

#import <Foundation/Foundation.h>

@interface ISGVerificationConfig : NSObject

- (instancetype)init NS_UNAVAILABLE;

/**
 默认配置

 @return 默认配置
 */
+ (instancetype)defaultConfiguration;

/*! @brief 背景颜色，默认随机 */
@property (nonatomic, strong) UIColor *backgroundColor;

/*! @brief 干扰线颜色m，默认随机 */
@property (nonatomic, strong) UIColor *disturLineColor;

/*! @brief 文字字体，默认 [UIFont systemFontOfSize:arc4random() % 5 + 15] */
@property (nonatomic, strong) UIFont *font;

/*! @brief 文字颜色，默认黑色 */
@property (nonatomic, strong) UIColor *textColor;

/*! @brief 干扰线个数，默认6 */
@property (nonatomic, assign) NSInteger disturLineCount;

/*! @brief 验证码个数，默认4 */
@property (nonatomic, assign) NSInteger charCount;

/*! @brief 干扰线宽度，默认1.0f */
@property (nonatomic, assign) CGFloat disturLineWidth;

/*! @brief 随机颜色 */
+ (UIColor *)randomColor;

@end
