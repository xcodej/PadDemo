//
//  JoeExcelView.h
//  JoeExcelView
//
//  Created by Joe on 2016/12/9.
//  Copyright © 2016年 QQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PadExcelView : UIView
@property (nonatomic, strong) NSMutableArray *models;
@property (nonatomic, assign) NSUInteger frozenNumber;
- (instancetype)initWithModels:(NSMutableArray *)models frozenNumber:(NSUInteger)frozenNumber;
@end
