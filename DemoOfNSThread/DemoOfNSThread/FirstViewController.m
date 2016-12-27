//
//  FirstViewController.m
//  DemoOfNSThread
//
//  Created by 蔡成汉 on 2016/12/26.
//  Copyright © 2016年 蔡成汉. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
{
    NSThread *thread;
}
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor redColor];
    button.frame = CGRectMake(100, 100, 100, 30);
    [button addTarget:self action:@selector(buttonIsTouch) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    //  线程创建
    thread = [[NSThread alloc]initWithTarget:self selector:@selector(doMyTask) object:nil];
    thread.name = @"mywork";
    
    //  线程启动
    [thread start];
}

-(void)doMyTask{
    NSLog(@"在子线程中执行任务：%@",[NSThread currentThread]);
    int a = 0;
    for (int i = 0; i< 10000; i++) {
        a = a+1;
//        NSLog(@"%d",a);
    }
    
    //  返回主线程
    [self performSelectorOnMainThread:@selector(updateUI:) withObject:@"我爱你" waitUntilDone:YES];
}

-(void)updateUI:(id)obj{
    NSLog(@"回到主线程：%@",[NSThread currentThread]);
}

-(void)buttonIsTouch{
    [thread cancel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    [thread cancel];
    thread = nil;
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
