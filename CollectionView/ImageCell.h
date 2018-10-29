//
//  ImageCell.h
//  OKCar
//
//  Created by JeremyLu on 2018/10/17.
//  Copyright © 2018年 liuxu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ImageCellDelegate <NSObject>

- (void)clickCellIndex:(NSInteger)index;

@end

@interface ImageCell : UICollectionViewCell

@property (weak, nonatomic) UIImageView *iconView;

@property (nonatomic,assign) NSInteger index;

@property (nonatomic, weak) id<ImageCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
