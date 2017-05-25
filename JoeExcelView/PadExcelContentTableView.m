//
//  JContentTableView.m
//  JoeExcelView
//
//  Created by Joe on 2016/12/9.
//  Copyright © 2016年 QQ. All rights reserved.
//

#import "PadExcelContentTableView.h"
#import "PadExcelContentTableViewCell.h"
#import "PadExcelContentCollectionViewCell.h"
#import "JoeExcel.h"

static NSString *tbIdentify = @"tableViewCellIdentify";
static NSString *clIdentify = @"collectionViewCellIdentify";
@interface PadExcelContentTableView ()<UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) NSArray *numArr;
@property (nonatomic) CGPoint cellContentOffSet;
@end

@implementation PadExcelContentTableView
@synthesize numArr;

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if (self = [super initWithFrame:frame style:style]) {
        _cellContentOffSet = CGPointMake(0, 0);
        self.backgroundColor = [UIColor whiteColor];
        self.delegate=self;
        self.dataSource=self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self registerNib:[UINib nibWithNibName:@"JContentTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"JContentCellID"];
        
        numArr = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12", @"13", @"14", @"15", @"16", @"17", @"18", @"19", @"20"];
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return numArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    PadExcelContentTableViewCell *cell = (PadExcelContentTableViewCell *)[tableView dequeueReusableCellWithIdentifier:tbIdentify];

    // 在cell.contentView上添加一个UICollectionView控制横向滑动
    if (cell == nil)
    {
        cell = [[PadExcelContentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tbIdentify];
        UICollectionViewFlowLayout *collectionViewFlowLayout = [[UICollectionViewFlowLayout alloc] init];
        collectionViewFlowLayout.minimumInteritemSpacing = 0;
        collectionViewFlowLayout.minimumLineSpacing = 0;
        [collectionViewFlowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        UICollectionView *contentCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(60, 0, self.frame.size.width-60, 35) collectionViewLayout:collectionViewFlowLayout];
        contentCollectionView.showsHorizontalScrollIndicator = NO;
        contentCollectionView.backgroundColor = [UIColor whiteColor];
        contentCollectionView.delegate = self;
        contentCollectionView.dataSource = self;
        [cell.contentView addSubview:contentCollectionView];
        [contentCollectionView registerClass:[PadExcelContentCollectionViewCell class] forCellWithReuseIdentifier:clIdentify];
    }
    
    cell.leftTextLab.text = numArr[indexPath.row];
    for (UIView *view in cell.contentView.subviews) {
        if ([view isKindOfClass:[UICollectionView class]]) {
            UICollectionView *collectionView = (UICollectionView *)view;
            collectionView.contentOffset = _cellContentOffSet;
        }
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 35;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PadExcelContentCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:clIdentify forIndexPath:indexPath];
    cell.backgroundColor = [UIColor cyanColor];
    cell.textLab.text = @"哈哈哈";
    return cell;
}

- (CGSize)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath*)indexPath{
    return CGSizeMake(100, 35);
}

- (void)scrollViewDidScroll:(UIScrollView*)scrollView
{
    if ([scrollView isKindOfClass:[UICollectionView class]]) {
        
        if (scrollView.contentOffset.y != 0) {
            scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x, 0);
            return;
        }
        for (PadExcelContentTableViewCell* cell in self.visibleCells) {
            for (UIView *view in cell.contentView.subviews) {
                if ([view isKindOfClass:[UICollectionView class]]) {
                    UICollectionView *collectionView = (UICollectionView *)view;
                    collectionView.contentOffset = scrollView.contentOffset;
                }
            }
        }
        _cellContentOffSet = scrollView.contentOffset;
        [self setValue:[NSValue valueWithCGPoint:scrollView.contentOffset] forKey:JContentTableViewCellCollectionViewObserver];
    }
//    NSLog(@"%@",[self valueForKey:JContentTableViewCellCollectionViewObserver]);
}

// 不做容错处理crash
- (id)valueForUndefinedKey:(NSString *)key{
    return JContentTableViewCellCollectionViewObserver;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

@end
