//
//  ViewController.m
//  DemoOfNSThread
//
//  Created by 蔡成汉 on 2016/12/26.
//  Copyright © 2016年 蔡成汉. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UITableView *myTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    myTableView.dataSource = self;
    myTableView.delegate = self;
    myTableView.tableFooterView = [UIView new];
    [self.view addSubview:myTableView];
}

#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"NSThread用法%ld",(indexPath.row+1)];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        FirstViewController *controller = [[FirstViewController alloc]init];
        [self.navigationController pushViewController:controller animated:YES];
    }else if (indexPath.row == 1){
        SecondViewController *controller = [[SecondViewController alloc]init];
        [self.navigationController pushViewController:controller animated:YES];
    };
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
