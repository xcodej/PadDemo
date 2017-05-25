//
//  ViewController.m
//  JoeExcelView
//
//  Created by Joe on 2016/12/9.
//  Copyright © 2016年 QQ. All rights reserved.
//

#import "ViewController.h"
#import "PadExcelView.h"
#import "Masonry.h"
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray * array = @[
                        @[@"股票代码", @"公司", @"公司2",@"公司3",@"公司4",@"公司5",@"公司6",@"公司7",@"公司8",@"公司9"],
                        @[@"股票代码v1", @"公司v1", @"公司2v1",@"公司3v1",@"公司4v1",@"公司5v1",@"公司6v1",@"公司7v1",@"公司8v1",@"公司9v1"],
                        @[@"股票代码", @"公司", @"公司2",@"公司3",@"公司4",@"公司5",@"公司6",@"公司7",@"公司8",@"公司9"],
                        @[@"股票代码", @"公司", @"公司2",@"公司3",@"公司4",@"公司5",@"公司6",@"公司7",@"公司8",@"公司9"],
                        @[@"股票代码", @"公司", @"公司2",@"公司3",@"公司4",@"公司5",@"公司6",@"公司7",@"公司8",@"公司9"],
                        @[@"股票代码", @"公司", @"公司2",@"公司3",@"公司4",@"公司5",@"公司6",@"公司7",@"公司8",@"公司9"],
                        @[@"股票代码", @"公司", @"公司2",@"公司3",@"公司4",@"公司5",@"公司6",@"公司7",@"公司8",@"公司9"],
                        @[@"股票代码", @"公司", @"公司2",@"公司3",@"公司4",@"公司5",@"公司6",@"公司7",@"公司8",@"公司9"],
                        ];
//    PadExcelView *joeExcelView = [[PadExcelView alloc] initWithFrame:self.view.bounds];
    PadExcelView *joeExcelView = [[PadExcelView alloc] initWithModels:[NSMutableArray arrayWithArray:array] frozenNumber:1];
    [self.view addSubview:joeExcelView];
    [joeExcelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.bottom.equalTo(self.view);
        make.top.equalTo(self.view).offset(20);
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
