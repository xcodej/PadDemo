//
//  JContentTableViewCell.h
//  JoeExcelView
//
//  Created by Joe on 2016/12/9.
//  Copyright © 2016年 QQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PadExcelContentTableViewCell : UITableViewCell

- (void)updateWithModel:(NSMutableArray *)model frozenNumber:(NSUInteger) frozenNumber;
@end
