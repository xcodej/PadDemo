//
//  TopCollectionView.h
//  JoeExcelView
//
//  Created by Joe on 2016/12/9.
//  Copyright © 2016年 QQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PadExcelHeaderView : UICollectionView
- (void)updateWithHeaders:(NSMutableArray *)headerArray startAtIndex:(NSUInteger)frozenNumber;
@end
