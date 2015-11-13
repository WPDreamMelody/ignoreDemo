//
//  ViewController.m
//  NVTableViewPerformance
//
//  Created by Yuki on 15/11/12.
//  Copyright © 2015年 DianPing. All rights reserved.
//

#import "ViewController.h"
#import "NVTableViewCell.h"

static const NSInteger  KSize = 50000;

@interface ViewController ()
@property (strong,nonatomic) UITableView *myTableView;
@property (assign,nonatomic) double startTime;
@property (assign,nonatomic) double endTime;
@property (assign,nonatomic) NSInteger totalRow;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.myTableView  =  [[UITableView alloc]initWithFrame:self.view.frame];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    [self.view addSubview:self.myTableView];
    
    self.totalRow = (self.view.frame.size.height)/60;
    if((long long)(self.view.frame.size.height)%60 != 0){
        self.totalRow = self.totalRow +1;
    }

//    [self.myTableView registerClass:[NVTableViewCell class] forCellReuseIdentifier:identifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return KSize;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"======%ld===%ld",(long)indexPath.row, (long)self.totalRow);
    return [self drawCell:tableView cellForRowAtIndexPath:indexPath];;
//    if(indexPath.row == 0){
//        self.startTime = [[NSDate date]timeIntervalSince1970];
//        return [self drawCell:tableView cellForRowAtIndexPath:indexPath];
//    }else if (indexPath.row == self.totalRow-1){
//        for (int i = 0; i<KSize-2; i++) {
//            [self drawCell:tableView cellForRowAtIndexPath:indexPath];
//        }
//        self.endTime = [[NSDate date]timeIntervalSince1970];
//        NSLog(@"MS<<<<<<<%f",(self.endTime-self.startTime)*1000);//ms
//    }
//    return [[UITableViewCell alloc]init];
}

- (UITableViewCell*)drawCell:(UITableView*)tableview cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NVTableViewCell *cell = (NVTableViewCell*)[self.myTableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[NVTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.logoImage.image = [UIImage imageNamed:@"cc.png"];
    cell.logoLabel.text = [NSString stringWithFormat:@"%@%@" , NSStringFromSelector(_cmd) , @(indexPath.row)];
    return cell;
    
//    NVTableViewCell *testcell = (NVTableViewCell*)[self.myTableView dequeueReusableCellWithIdentifier:identifier];
//    testcell.logoImage.image = [UIImage imageNamed:@"Icon.png"];
//    testcell.logoLabel.text = [NSString stringWithFormat:@"%@%@" , NSStringFromSelector(_cmd) , @(indexPath.row)];
//    return testcell;
}

@end
