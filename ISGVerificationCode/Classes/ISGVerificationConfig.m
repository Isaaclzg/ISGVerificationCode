//
//  ISGVerificationConfig.m
//  ISGVerificationCode
//
//  Created by apple on 2019/6/25.
//

#import "ISGVerificationConfig.h"

#define ISGRandomColor  [UIColor colorWithRed:arc4random() % 256 / 256.0 green:arc4random() % 256 / 256.0 blue:arc4random() % 256 / 256.0 alpha:1.0]

@implementation ISGVerificationConfig

+ (instancetype)defaultConfiguration {
    
    ISGVerificationConfig *defaultConfig = [ISGVerificationConfig new];
    
    defaultConfig.backgroundColor = ISGRandomColor;
    defaultConfig.disturLineColor = ISGRandomColor;
    defaultConfig.font = [UIFont systemFontOfSize:arc4random() % 5 + 15];
    defaultConfig.textColor = [UIColor blackColor];
    defaultConfig.disturLineCount = 6;
    defaultConfig.charCount = 4;
    defaultConfig.disturLineWidth = 1.0f;
    
    return defaultConfig;
}

+ (UIColor *)randomColor {
    return ISGRandomColor;
}


@end
