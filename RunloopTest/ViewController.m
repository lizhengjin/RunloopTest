//
//  ViewController.m
//  RunloopTest
//
//  Created by liqi on 16/7/26.
//  Copyright © 2016年 liqi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
 //   [self simplePractiseMain];
    [self simplePractiseBackGround];
    
}

- (void)simplePractiseMain {
    
    while (1){
        NSLog(@"while begin");
        NSRunLoop *runloop = [NSRunLoop currentRunLoop];
        NSLog(@"%@",runloop);
        [runloop runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        
        NSLog(@"while end");
        
    }
    
    
}

- (void)simplePractiseBackGround {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        while (1){
            NSPort *macPort = [NSPort port];
            NSLog(@"while begin");
            NSRunLoop *subrunloop = [NSRunLoop currentRunLoop];
            [subrunloop addPort:macPort forMode:NSDefaultRunLoopMode];
            [subrunloop runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
            NSLog(@"while end");
            NSLog(@"%@",subrunloop);
            
            
            
        }
    });
    
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
