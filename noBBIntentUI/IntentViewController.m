//
//  IntentViewController.m
//  noBBIntentUI
//
//  Created by yangrui on 2019/9/2.
//  Copyright © 2019 yangrui. All rights reserved.
//

#import "IntentViewController.h"

// As an example, this extension's Info.plist has been configured to handle interactions for INSendMessageIntent.
// You will want to replace this or add other intents as appropriate.
// The intents whose interactions you wish to handle must be declared in the extension's Info.plist.

// You can test this example integration by saying things to Siri like:
// "Send a message using <myApp>"

@interface IntentViewController ()

@end

@implementation IntentViewController

/*
 注意:
 IntentsUI 自定义的UI是无法接受和响应任何的 touch 信息的, 仅仅是展示而已
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
}
//http://www.cocoachina.com/articles/17702
/*
 此方法可以获取 Intent, 消息发送 和 发送成功 都会d回调一次这个方法
 根据intent 对象的类型和状态, 在intent 的回调时, present 对应的 child viewController 即可实现定制化的界面展示
 
 注意: Intents UI Extension 的进程并不会再界面销毁后就退出, 很可能只是在后台 出于休眠状态, 下次respone 到来是再次被唤醒
 */
- (void)configureWithInteraction:(INInteraction *)interaction context:(INUIHostedViewContext)context completion:(void (^)(CGSize desiredSize))completion{
    
}

#pragma mark - INUIHostedViewControlling

// Prepare your view controller for the interaction to handle.
- (void)configureViewForParameters:(NSSet <INParameter *> *)parameters ofInteraction:(INInteraction *)interaction interactiveBehavior:(INUIInteractiveBehavior)interactiveBehavior context:(INUIHostedViewContext)context completion:(void (^)(BOOL success, NSSet <INParameter *> *configuredParameters, CGSize desiredSize))completion {
    // Do configuration here, including preparing views and calculating a desired size for presentation.
    
    if (completion) {
        completion(YES, parameters, [self desiredSize]);
    }
}

- (CGSize)desiredSize {
    return [self extensionContext].hostedViewMaximumAllowedSize;
}

@end
