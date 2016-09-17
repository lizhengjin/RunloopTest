//
//  ViewController.m
//  RunloopTest
//
//  Created by liqi on 16/7/26.
//  Copyright © 2016年 liqi. All rights reserved.
//

#import "ViewController.h"


#import <objc/message.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

  //  [self searchStatusBar];
    [self searchStatusBarOfForegroundView];
}

- (void)searchStatusBar{
    UIApplication *app = [UIApplication sharedApplication];
    id statusBar = [app valueForKeyPath:@"statusBar"];
    unsigned int outCount = 0;
    Ivar *ivars = class_copyIvarList([statusBar class], &outCount);
    for (int i = 0 ; i<outCount; i++) {
        Ivar ivar = ivars[i];
        //  NSLog(@"%s\n",ivar_getName(ivar));
        printf("%s\n",ivar_getName(ivar));
     /*
      _statusBarServer
      _inProcessProvider
      _showsForeground
      _backgroundView
      _foregroundView
      _doubleHeightLabel
      _doubleHeightLabelContainer
      _currentDoubleHeightText
      _currentRawData
      _interruptedAnimationCompositeViews
      _newStyleBackgroundView
      _newStyleForegroundView
      _slidingStatusBar
      _requestedStyle
      _styleOverrides
      _styleAttributes
      _orientation
      _hidden
      _suppressesHiddenSideEffects
      _foreground
      _registered
      _reservesEmptyTimeRegion
      _waitingOnCallbackAfterChangingStyleOverridesLocally
      _suppressGlow
      _translucentBackgroundAlpha
      _showOnlyCenterItems
      _foregroundViewShouldIgnoreStatusBarDataDuringAnimation
      _localDataOverrides
      _tintColor
      _lastUsedBackgroundColor
      _nextTintTransition
      _overrideHeight
      _disableRasterizationReasons
      _persistentAnimationsEnabled
      _simulatesLegacyAppearance
      _serverUpdatesDisabled
      _homeItemsDisabled
      _statusBarWindow
      _styleDelegate
      __transitionCoordinator
      _foregroundColor
      _legibilityStyle
      */
    }
}

- (void)searchStatusBarOfForegroundView{
    UIApplication *app = [UIApplication sharedApplication];
    NSArray *children = [[[app valueForKeyPath:@"statusBar"] valueForKeyPath:@"foregroundView"] subviews];
    for (id child  in children) {
        NSLog(@"statusBar-->foregroundView---------------");
         NSLog(@"%@",[child class]);
       
        /*
         这是在模拟器上打印
         UIStatusBarServiceItemView    显示几格信号 Carrier
         UIStatusBarDataNetworkItemView  信号图标 判断网络状况 WIFI 4G
         UIStatusBarBatteryItemView   电池
         UIStatusBarTimeItemView      显示时间
         */
        /*
          UIStatusBarSignalStrengthItemView 显示信号
          UIStatusBarServiceItemView      中国移动
          UIStatusBarDataNetworkItemView  网络 wifi 4G
          UIStatusBarBatteryItemView      电池的图标
          UIStatusBarBatteryPercentItemView  电量多少
          UIStatusBarIndicatorItemView  指示器
          UIStatusBarTimeItemView   手机时间
         */
        if ([child isKindOfClass:NSClassFromString(@"UIStatusBarSignalStrengthItemView")]) {
            unsigned int outCount = 0;
            Ivar *ivars = class_copyIvarList([child class], &outCount);
            for (int i = 0; i < outCount; i++) {
                Ivar ivar = ivars[i];
                printf("%s\n",ivar_getName(ivar));
            }
            NSString *_signalStrengthRaw = [child valueForKey:@"_signalStrengthRaw"];
            NSLog(@"当前wifi强度为%@",_signalStrengthRaw);
            NSString *_signalStrengthBars = [child valueForKey:@"_signalStrengthBars"];
            NSLog(@"1当前wifi强度为%@",_signalStrengthBars);
            NSString *_enableRSSI = [child valueForKey:@"enableRSSI"];
            NSLog(@"2当前wifi强度为%@",_enableRSSI);
            NSString *_showRSSI = [child valueForKey:@"showRSSI"];
            NSLog(@"3当前wifi强度为%@",_showRSSI);//RSSI 信号干扰值
        }else if ([child isKindOfClass:NSClassFromString(@"UIStatusBarServiceItemView")]) {
            unsigned int outCount = 0;
            Ivar *ivars = class_copyIvarList([child class], &outCount);
            for (int i = 0; i < outCount; i++) {
                Ivar ivar = ivars[i];
                printf("%s\n",ivar_getName(ivar));
            }
            NSString *_serviceString = [child valueForKey:@"_serviceString"];
            NSLog(@"_serviceString=%@",_serviceString);
            NSString *_crossfadeString = [child valueForKey:@"_crossfadeString"];
            NSLog(@"_crossfadeString=%@",_crossfadeString);
            NSString *_crossfadeStep = [child valueForKey:@"_crossfadeStep"];
            NSLog(@"_crossfadeStep=%@",_crossfadeStep);
            NSString *_maxWidth = [child valueForKey:@"_maxWidth"];
            NSLog(@"_maxWidth=%@",_maxWidth);
            NSString *_serviceWidth = [child valueForKey:@"_serviceWidth"];
            NSLog(@"_serviceWidth=%@",_serviceWidth);
            NSString *_crossfadeWidth = [child valueForKey:@"_crossfadeWidth"];
            NSLog(@"_crossfadeWidth=%@",_crossfadeWidth);
            NSString *_contentType = [child valueForKey:@"_contentType"];
            NSLog(@"_contentType=%@",_contentType);
            NSString *_loopingNecessaryForString = [child valueForKey:@"_loopingNecessaryForString"];
            NSLog(@"_loopingNecessaryForString=%@",_loopingNecessaryForString);
            NSString *_loopNowIfNecessary = [child valueForKey:@"_loopNowIfNecessary"];
            NSLog(@"_loopNowIfNecessary=%@",_loopNowIfNecessary);
            NSString *_loopingNow = [child valueForKey:@"_loopingNow"];
            NSLog(@"_loopingNow=%@",_loopingNow);
            NSString *_letterSpacing = [child valueForKey:@"_letterSpacing"];
            NSLog(@"_letterSpacing=%@",_letterSpacing);
        }else if ([child isKindOfClass:NSClassFromString(@"UIStatusBarDataNetworkItemView")]) {
            unsigned int outCount = 0;
            Ivar *ivars = class_copyIvarList([child class], &outCount);
            for (int i = 0; i < outCount; i++) {
                Ivar ivar = ivars[i];
                printf("%s\n",ivar_getName(ivar));
            }
            NSString *dataNetworkType = [child valueForKey:@"dataNetworkType"];
            NSLog(@"当前网络为%@",dataNetworkType);
            /*
             typedef NS_ENUM(NSUInteger, NetWorkType) {
             NetWorkTypeNone=0,
             NetWorkType2G=1,
             NetWorkType3G=2,
             NetWorkType4G=3,
             NetWorkTypeWiFI=5, 
             };
             */
            NSString *wifiStrengthRaw = [child valueForKey:@"wifiStrengthRaw"];
            NSLog(@"当前wifi强度为%@",wifiStrengthRaw);
            NSString *_wifiStrengthBars = [child valueForKey:@"wifiStrengthBars"];
            NSLog(@"1当前wifi强度为%@",_wifiStrengthBars);
            NSString *_enableRSSI = [child valueForKey:@"enableRSSI"];
            NSLog(@"2当前wifi强度为%@",_enableRSSI);
            NSString *_showRSSI = [child valueForKey:@"showRSSI"];
            NSLog(@"3当前wifi强度为%@",_showRSSI);//RSSI 信号干扰值
            
        }else if ([child isKindOfClass:NSClassFromString(@"UIStatusBarBatteryItemView")]) {
            unsigned int outCount = 0;
            Ivar *ivars = class_copyIvarList([child class], &outCount);
            for (int i = 0; i < outCount; i++) {
                Ivar ivar = ivars[i];
                printf("%s\n",ivar_getName(ivar));
            }
            NSString *_capacity = [child valueForKey:@"_capacity"];
            NSLog(@"_capacity=%@",_capacity);
            NSString *_state = [child valueForKey:@"_state"];
            NSLog(@"_state=%@",_state);
            NSString *_batterySaverModeActive = [child valueForKey:@"_batterySaverModeActive"];
            NSLog(@"_batterySaverModeActive=%@",_batterySaverModeActive);
            NSString *_accessoryView = [child valueForKey:@"_accessoryView"];
            NSLog(@"_accessoryView=%@",_accessoryView);
        }else if ([child isKindOfClass:NSClassFromString(@"UIStatusBarBatteryPercentItemView")]) {
            unsigned int outCount = 0;
            Ivar *ivars = class_copyIvarList([child class], &outCount);
            for (int i = 0; i < outCount; i++) {
                Ivar ivar = ivars[i];
                printf("%s\n",ivar_getName(ivar));
            }
            NSString *percentString = [child valueForKey:@"percentString"];
            NSLog(@"电量为 = %@",percentString);

        }else if ([child isKindOfClass:NSClassFromString(@"UIStatusBarIndicatorItemView")]) {
            unsigned int outCount = 0;
            Ivar *ivars = class_copyIvarList([child class], &outCount);
            for (int i = 0; i < outCount; i++) {
                Ivar ivar = ivars[i];
                printf("%s\n",ivar_getName(ivar));
            }

        }else if ([child isKindOfClass:NSClassFromString(@"UIStatusBarTimeItemView")]) {
             //显示手机时间
            NSString *time = [child valueForKey:@"timeString"];
            NSLog(@"手机时间time = %@",time);
        }
         NSLog(@"-----------------------------");

    }
    

}

- (void)searchStatusBarof{
    
}



@end
