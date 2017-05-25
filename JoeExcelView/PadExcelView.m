//
//  JoeExcelView.m
//  JoeExcelView
//
//  Created by Joe on 2016/12/9.
//  Copyright © 2016年 QQ. All rights reserved.
//

#import "PadExcelView.h"
#import "PadExcelContentTableView.h"
#import "PadExcelHeaderView.h"
#import "PadExcelContentTableViewCell.h"
#import "JoeExcel.h"
#import "Masonry.h"
@interface PadExcelView ()

@property (nonatomic, strong) PadExcelContentTableView *jContentTableView;
@property (nonatomic, strong) PadExcelHeaderView *topCollectionView;
@end


@implementation PadExcelView
@synthesize jContentTableView;
@synthesize topCollectionView;


//#warning -- 如果想在类外面处理ContentTableView和TopCollectionView可以将他们的Delegate和DataSource代理出来 例如JContentTableView中CollectionView的didSelected方法...

- (instancetype)initWithModels:(NSMutableArray *)models frozenNumber:(NSUInteger)frozenNumber
{
    self = [super init];
    if (self) {
        self.models = models;
        self.frozenNumber = frozenNumber;
        [self initViews];
    }
    return self;
}

- (void)initViews {
        
        UILabel *vNumLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
        vNumLab.backgroundColor = [UIColor yellowColor];
        vNumLab.textAlignment = NSTextAlignmentCenter;
        vNumLab.text = @"num";
        [self addSubview:vNumLab];
        
        // 顶部横向序号CollectionView
        UICollectionViewFlowLayout *collectionViewFlowLayout = [[UICollectionViewFlowLayout alloc] init];
        [collectionViewFlowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        topCollectionView = [[PadExcelHeaderView alloc] initWithFrame:CGRectZero collectionViewLayout:collectionViewFlowLayout];
        [topCollectionView updateWithHeaders:_models.firstObject startAtIndex:_frozenNumber];
        topCollectionView.showsHorizontalScrollIndicator = NO;
        [self addSubview:topCollectionView];
        __weak typeof(self) weakSelf = self;
        [topCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(vNumLab.mas_trailing);
            make.top.equalTo(vNumLab);
            make.trailing.equalTo(weakSelf);
            make.height.mas_equalTo(30);
        }];
        
        // 添加Observer
        [topCollectionView addObserver:self forKeyPath:TopCollectionViewObserver options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
        
        jContentTableView = [[PadExcelContentTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [jContentTableView updateWithModel:_models startAtIndex:self.frozenNumber];
        [self addSubview:jContentTableView];
        [jContentTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.trailing.bottom.equalTo(weakSelf);
            make.top.equalTo(topCollectionView.mas_bottom);
        }];
        
        // 添加Observer
        [jContentTableView addObserver:self forKeyPath:JContentTableViewCellCollectionViewObserver options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];

}

// 不做容错处理crash
- (id)valueForUndefinedKey:(NSString *)key{
    return @"TopCollectionViewObserver";
}

- (void)observeValueForKeyPath:(NSString*)keyPath ofObject:(id)object change:(NSDictionary*)change context:(void*)context{
    
    if ([keyPath isEqualToString:TopCollectionViewObserver]) {
        for (PadExcelContentTableViewCell* cell in jContentTableView.visibleCells) {
            for (UIView *view in cell.contentView.subviews) {
                if ([view isKindOfClass:[UICollectionView class]]) {
                    UICollectionView *collectionView = (UICollectionView *)view;
                    collectionView.contentOffset = topCollectionView.contentOffset;
                    
                }
            }
        }
    }
    
    if ([keyPath isEqualToString:JContentTableViewCellCollectionViewObserver]) {
        for (PadExcelContentTableViewCell *cell in jContentTableView.visibleCells) {
            for (UIView *view in cell.contentView.subviews) {
                if ([view isKindOfClass:[UICollectionView class]]) {
                    UICollectionView *collectionView = (UICollectionView *)view;
                    topCollectionView.contentOffset = collectionView.contentOffset;
                    
                }
            }
        }
    }
}

// 移除Observer
- (void)dealloc{
    [topCollectionView removeObserver:self forKeyPath:TopCollectionViewObserver];
    [jContentTableView removeObserver:self forKeyPath:JContentTableViewCellCollectionViewObserver];
}




@end
