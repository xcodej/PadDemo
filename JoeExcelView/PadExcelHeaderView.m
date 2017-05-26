//
//  TopCollectionView.m
//  JoeExcelView
//
//  Created by Joe on 2016/12/9.
//  Copyright © 2016年 QQ. All rights reserved.
//

#import "PadExcelHeaderView.h"
#import "PadExcelHeaderViewCell.h"
#import "JoeExcel.h"

static NSString *topClIdentify = @"topCollectionViewCellIdentify";

@interface PadExcelHeaderView ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property(nonatomic, strong) NSMutableArray *headerArray;
@property(nonatomic, assign) NSUInteger frozenNumber;
@end

@implementation PadExcelHeaderView


- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(nonnull UICollectionViewLayout *)layout{
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        self.backgroundColor = [UIColor whiteColor];
        self.delegate = self;
        self.dataSource = self;
        [self registerClass:[PadExcelHeaderViewCell class] forCellWithReuseIdentifier:topClIdentify];
    }
    return self;
}

- (void)updateWithHeaders:(NSMutableArray *)headerArray startAtIndex:(NSUInteger)frozenNumber {
    self.headerArray = headerArray;
    self.frozenNumber = frozenNumber;
    [self reloadData];
}

- (id)valueForUndefinedKey:(NSString *)key{
    return TopCollectionViewObserver;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

#pragma mark --collectionViewDataSource&&collectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.headerArray.count - self.frozenNumber;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PadExcelHeaderViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:topClIdentify forIndexPath:indexPath];
    cell.topTextLab.text = self.headerArray[indexPath.row + self.frozenNumber];
    return cell;
}

- (CGSize)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath*)indexPath{
    
    return CGSizeMake(100, 30);
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
    return 0;
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
    return 0;
    
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self setValue:[NSValue valueWithCGPoint:scrollView.contentOffset] forKey:TopCollectionViewObserver];
}

@end
