//
//  UPloadCarImageController.h
//  OKCar
//
//  Created by JeremyLu on 2018/10/17.
//  Copyright © 2018年 liuxu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^UploadImageUrlBlock) (NSArray <NSString*>*dataArray);

@interface UPloadCarImageController : UIViewController

@property (nonatomic,copy) UploadImageUrlBlock urlBlock;

@property (nonatomic ,strong)NSArray* imageUrlArray;

@end

NS_ASSUME_NONNULL_END
