
//
//  ImageCell.h
//  OKCar
//
//  Created by JeremyLu on 2018/10/17.
//  Copyright © 2018年 liuxu. All rights reserved.
//

#import "ImageCell.h"

@interface  ImageCell()

//@property (weak, nonatomic) UILabel *detailLabel;

@end

@implementation ImageCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.layer.cornerRadius = 5.0;
        self.layer.masksToBounds = YES;
        self.layer.borderColor = [UIColor grayColor].CGColor;
        self.layer.borderWidth = 2.0/[UIScreen mainScreen].scale;
        
        //上方图片
        UIImageView *iconView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconView];
        iconView.contentMode = UIViewContentModeScaleAspectFit
        ;
        iconView.userInteractionEnabled = YES;
        self.iconView = iconView;
        
//        //下方显示
//        UILabel *detailLabel = [[UILabel alloc] init];
//        detailLabel.font = [UIFont systemFontOfSize:12.0];
//        detailLabel.textColor = [UIColor textColordDarkGray];
//        detailLabel.backgroundColor = [UIColor clearColor];
//        detailLabel.textAlignment = NSTextAlignmentCenter;
//        [self.contentView addSubview:detailLabel];
//        self.detailLabel = detailLabel;
        
        UILongPressGestureRecognizer *heatAddlongPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(heatAddBtnlongPressAction:)];
        heatAddlongPress.minimumPressDuration = 0.5;
        [iconView addGestureRecognizer:heatAddlongPress];
    }
    return self;
}


- (void)heatAddBtnlongPressAction:(UIGestureRecognizer*)gesture
{
    if (gesture.state == UIGestureRecognizerStateEnded) {
        if (self.delegate &&[self.delegate respondsToSelector:@selector(clickCellIndex:)]) {
            [self.delegate clickCellIndex:self.index];
        }
    }
}


- (void)layoutSubviews{
    [super layoutSubviews];
    self.iconView.frame = self.contentView.bounds;
}


@end


