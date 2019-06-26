# ISGVerificationCode 本地生成验证码

[![Version](https://img.shields.io/cocoapods/v/ISGVerificationCode.svg?style=flat)](https://cocoapods.org/pods/ISGVerificationCode)
[![License](https://img.shields.io/cocoapods/l/ISGVerificationCode.svg?style=flat)](https://cocoapods.org/pods/ISGVerificationCode)
[![Platform](https://img.shields.io/cocoapods/p/ISGVerificationCode.svg?style=flat)](https://cocoapods.org/pods/ISGVerificationCode)

## 使用说明

```
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
```


## 安装（CocoaPods）

```ruby
pod 'ISGVerificationCode'
```

## 作者

[Mr.Liu](https://www.jianshu.com/u/7e1b920cdac1), isaac_gang@163.com


## 许可证

ISGVerificationCode在MIT许可下可用。有关更多信息，请参见许可证文件.