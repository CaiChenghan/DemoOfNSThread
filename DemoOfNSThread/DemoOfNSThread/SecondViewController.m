//
//  SecondViewController.m
//  DemoOfNSThread
//
//  Created by 蔡成汉 on 2016/12/26.
//  Copyright © 2016年 蔡成汉. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //  创建一个子线程
    [NSThread detachNewThreadSelector:@selector(doMyTask) toTarget:self withObject:nil];
}

-(void)doMyTask{
    NSLog(@"在子线程中执行任务：%@",[NSThread currentThread]);
    int a = 0;
    for (int i = 0; i< 5000; i++) {
        a = a+1;
        NSLog(@"%d",a);
    }
    [self performSelectorOnMainThread:@selector(updateUI:) withObject:@"我爱你" waitUntilDone:YES];
}

-(void)updateUI:(id)obj{
    NSLog(@"回到主线程：%@",[NSThread currentThread]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
