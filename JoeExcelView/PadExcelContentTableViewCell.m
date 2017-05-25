//
//  JContentTableViewCell.m
//  JoeExcelView
//
//  Created by Joe on 2016/12/9.
//  Copyright © 2016年 QQ. All rights reserved.
//

#import "PadExcelContentTableViewCell.h"
#import "Masonry.h"
@implementation PadExcelContentTableViewCell
@synthesize leftTextLab;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        __weak typeof(self) weakSelf = self;
        leftTextLab = [[UILabel alloc] init];
        leftTextLab.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:leftTextLab];
        [leftTextLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.top.bottom.equalTo(weakSelf.contentView);
            make.width.mas_equalTo(60);
        }];
        
        UIView *vLineView = [[UIView alloc] init];
        vLineView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:vLineView];
        [vLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(weakSelf.contentView);
            make.leading.equalTo(weakSelf.contentView).offset(59);
            make.width.mas_equalTo(1);
        }];
        
        UIView *lineView = [[UIView alloc] init];
        lineView.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.bottom.width.equalTo(weakSelf.contentView);
            make.height.mas_equalTo(1);
        }];
        
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
