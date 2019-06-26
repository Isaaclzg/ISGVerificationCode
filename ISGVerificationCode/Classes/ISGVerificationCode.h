//
//  ISGVerificationCode.h
//  ISGVerificationCode
//
//  Created by apple on 2019/6/25.
//

#import <UIKit/UIKit.h>
#import "ISGVerificationConfig.h"

@interface ISGVerificationCode : UIView

/*! @brief  是否限制点击更换验证码 */
@property (nonatomic, assign) BOOL isBanTouch;

/*! @brief  验证码 */
@property (nonatomic, strong, readonly) NSString *verificationCode;

/*! @brief 配置 */
@property (nonatomic, strong) ISGVerificationConfig *config;

/*! @brief 是否随机颜色，默认NO 设置为yes的时候，config中的颜色设置将无效 */
@property (nonatomic, assign) BOOL isRandomColor;

/**
 *  更换验证码
 */
- (void)changeVerificationCode;

/**
 *  不区分大小写对比验证码
 *
 *  @param string 输入的验证码
 *
 *  @return 是否相同
 */
- (BOOL)compareResult:(NSString *)string;

@end
