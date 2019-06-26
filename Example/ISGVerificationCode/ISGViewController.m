//
//  ISGViewController.m
//  ISGVerificationCode
//
//  Created by isaaclzg on 06/25/2019.
//  Copyright (c) 2019 isaaclzg. All rights reserved.
//

#import "ISGViewController.h"
#import <ISGVerificationCode/ISGVerificationCode.h>

@interface ISGViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) UITextField *input;

@property (nonatomic, strong) ISGVerificationCode *codeView;

@property (nonatomic, assign) BOOL isDifferentiate;

@end

@implementation ISGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.codeView = [[ISGVerificationCode alloc] init];
    self.codeView.config.backgroundColor = [UIColor blackColor];
    self.codeView.config.textColor = [UIColor whiteColor];
    self.codeView.frame = CGRectMake(30, 140, 150, 40);
    self.codeView.isRandomColor = NO;
    // 禁止点击更换图片
    self.codeView.isBanTouch = YES;
    [self.view addSubview:self.codeView];
    
    UIButton *changeBtn = [[UIButton alloc] initWithFrame:CGRectMake(200, 140, 100, 40)];
    [changeBtn setTitle:@"点击图片换验证码" forState:UIControlStateNormal];
    [changeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    changeBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [changeBtn addTarget:self action:@selector(changeCode:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:changeBtn];
    
    UITextField *input = [[UITextField alloc] initWithFrame:CGRectMake(30, 200, 150, 40)];
    input.layer.borderColor = [UIColor orangeColor].CGColor;
    input.layer.borderWidth = 1.0;
    input.layer.cornerRadius = 5.0;
    input.font = [UIFont systemFontOfSize:12];
    input.placeholder = @"请输入验证码";
    input.clearButtonMode = UITextFieldViewModeWhileEditing;
    input.backgroundColor = [UIColor clearColor];
    input.textAlignment = NSTextAlignmentCenter;
    input.returnKeyType = UIReturnKeyDone;
    input.delegate = self;
    [self.view addSubview:input];
    self.input = input;
    
    UIButton * button=[[UIButton alloc]initWithFrame:CGRectMake(200, 200, 100, 40)];
    button.backgroundColor=[UIColor blueColor];
    [button setTitle:@"验证" forState:UIControlStateNormal];
    button.titleLabel.font=[UIFont systemFontOfSize:14];
    button.layer.borderColor = [UIColor orangeColor].CGColor;
    button.layer.borderWidth = 1.0;
    button.layer.cornerRadius = 5.0;
    [button addTarget:self action:@selector(compare:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UISwitch *sw1 = [[UISwitch alloc] init];
    sw1.on = NO;
    [sw1 addTarget:self action:@selector(switch1ValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:sw1];
    sw1.frame = CGRectMake(30, 280, 60, 30);
    
    UILabel *label1 = [[UILabel alloc] init];
    label1.text = @"是否区分大小写";
    label1.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:label1];
    label1.frame = CGRectMake(30, 330, 100, 16);
    
    UISwitch *sw2 = [[UISwitch alloc] init];
    sw2.on = NO;
    [sw2 addTarget:self action:@selector(switch2ValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:sw2];
    sw2.frame = CGRectMake(self.view.frame.size.width - 90, 280, 60, 30);
    
    UILabel *label2 = [[UILabel alloc] init];
    label2.text = @"随机颜色";
    label2.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:label2];
    label2.frame = CGRectMake(self.view.frame.size.width - 90, 330, 100, 16);
    
}

- (void)changeCode:(id)sender {
    [self.codeView changeVerificationCode];
}

- (void)compare:(id)sender {
    
    if (self.isDifferentiate) {
        if ([self.codeView.verificationCode isEqualToString:self.input.text]) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"恭喜您 ^o^" message:@"验证成功" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            UIAlertAction *gotoCancel = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            
            [alert addAction:cancel];
            [alert addAction:gotoCancel];
            [self presentViewController:alert animated:YES completion:nil];
        }else {
            //验证不匹配，验证码和输入框晃动
            CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
            anim.repeatCount = 1;
            anim.values = @[@-20, @20, @-20];
            [self.input.layer addAnimation:anim forKey:nil];
        }
    }else {
        if ([self.codeView compareResult:self.input.text]) {
            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"恭喜您 ^o^" message:@"验证成功" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            UIAlertAction *gotoCancel = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            
            [alert addAction:cancel];
            [alert addAction:gotoCancel];
            [self presentViewController:alert animated:YES completion:nil];
        }
        else
        {
            //验证不匹配，验证码和输入框晃动
            CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
            anim.repeatCount = 1;
            anim.values = @[@-20, @20, @-20];
            [self.input.layer addAnimation:anim forKey:nil];
        }
    }
    
    
}

- (void)switch1ValueChanged: (id)sender {
    UISwitch *whichSwitch = (UISwitch *)sender;
    BOOL setting = whichSwitch.isOn;
    
    self.isDifferentiate = setting;
}

- (void)switch2ValueChanged: (id)sender {
    UISwitch *whichSwitch = (UISwitch *)sender;
    BOOL setting = whichSwitch.isOn;
    
    self.codeView.isRandomColor = setting;
}

@end
