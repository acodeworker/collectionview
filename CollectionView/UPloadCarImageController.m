//
//  MeShare
//
//  Created by 钱长存 on 10/24/15.
//  Copyright © 2015 Zmodo. All rights reserved.
//

#import "UPloadCarImageController.h"
#import "ImageCell.h"
 
@interface UPloadCarImageController ()<UICollectionViewDelegate,UICollectionViewDataSource,ImageCellDelegate>

@property (strong, nonatomic) NSMutableArray *ImageArray;

@property (nonatomic ,strong)UIButton* submitButton;

@property (nonatomic ,strong)UICollectionView* collectionView;

@property (nonatomic ,strong)UILabel* label;

@end

@implementation UPloadCarImageController

static NSString * const reuseIdentifier = @"SharingCollectionViewCell";

static const CGFloat verticalPadding = 10.;

static const CGFloat horizonPadding = 20.;

static const CGFloat cellpadding = 5;

static const CGFloat bottomHeight = 120.;

//static NSString * const addButtonReuseIdentifier = @"AddButtonCollectionViewCell";
#define screenW [UIScreen mainScreen].bounds.size.width
//屏幕高
#define screenH [UIScreen mainScreen].bounds.size.height

- (void)dealloc
{

}

- (void)backButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"选择图片";
    self.view.backgroundColor = [UIColor whiteColor];
//    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:accessoriesHeaderReuseIdentifier];
//    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:accessoriesFooterReuseIdentifier];
    self.navigationController.navigationBar.translucent = NO;

    [self.view addSubview:self.collectionView];
    [self.view addSubview:self.submitButton];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // 加载被动设备
 }


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.collectionView reloadData];
}

#pragma mark --ImageCellDelegate
- (void)clickCellIndex:(NSInteger)index
{
    if (index == (self.ImageArray.count - 1) ){return;}

    
      UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"您确定要删除这张图片？" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"是的" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              //响应事件
                                                              [self.ImageArray removeObjectAtIndex:index];
                                                              [self.collectionView reloadData];
                                                              
                                                          }];
    
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action) {
                                                             //响应事件
                                                             [alert dismissViewControllerAnimated:YES completion:nil];
                                                         }];
    
    [alert addAction:cancelAction];
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
//    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
//    [keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
  
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 5;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier
                                                                                  forIndexPath:indexPath];
    cell.delegate = self;
//    cell.iconView.image = self.ImageArray[indexPath.item];
//    id object = self.ImageArray[indexPath.row];
//    if ([object isKindOfClass:[UIImage class]]) {
//        cell.iconView.image =  object;
//    }else if([object isKindOfClass:[NSString class]]){
//        [cell.iconView sd_setImageWithURL:[NSURL URLWithString:object] placeholderImage:[UIImage imageNamed:@""]];
//    }
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat count = 3.;
    CGFloat width = (collectionView.frame.size.width - cellpadding*2 -horizonPadding*(count - 1))/ count;
    return CGSizeMake(width, width);
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    //上下两行的最小间距
    /**
     For a vertically scrolling layout, the value represents the minimum spacing between successive rows. For a horizontally scrolling layout, the value represents the minimum spacing between successive columns. This spacing is not applied to the space between the header view and the first line or between the last line and the footer view. Figure 1 shows how the line spacing is applied to rows of unevenly sized items, illustrating how the actual spacing between individual items may be greater than the minimum value.
     */
    
    return verticalPadding;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    //horizon space
    return horizonPadding;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section;
{
    
    /**
     This spacing is not applied to the space between the header view and the first line
     */
    return UIEdgeInsetsMake(cellpadding, cellpadding,cellpadding,cellpadding);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.item == (self.ImageArray.count - 1)) {//点击最后一个
        if(self.ImageArray.count >=4) {
//            [MBProgressHUDHelper showText:@"您最多只能传3张图"];
            return;
        }
//        [[PhotoClass instance]showAlertViewToController:self andFinishBlock:^(NSDictionary * _Nonnull info) {
//            //上传图片
//            UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage]; //通过key值获取到图片
////            [self.ImageArray insertObject:image atIndex:self.ImageArray.count - 1];
//            [self.ImageArray addObject:image];
//            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2. * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                [self.collectionView reloadData];
//
//            });
//        }];
        
    }else{
        
    }
}

#pragma mark <UICollectionViewDelegate>



- (void)clickCodeButton:(UIButton*)btn
{
 
}

- (void)setImageUrlArray:(NSArray *)imageUrlArray
{
    _imageUrlArray = imageUrlArray;
    if (imageUrlArray.count > 3) {
        self.ImageArray = [NSMutableArray arrayWithArray:imageUrlArray];
    }else{
        self.ImageArray  = [NSMutableArray arrayWithArray:[self.imageUrlArray arrayByAddingObjectsFromArray:self.ImageArray]];
    }
    [self.collectionView reloadData];
}



- (UICollectionView*)collectionView {
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        //判断是否存在多通道设备
       UICollectionView* collectionViewH = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) collectionViewLayout:flowLayout];
        collectionViewH.dataSource = self;
        collectionViewH.delegate = self;
        collectionViewH.showsHorizontalScrollIndicator = NO;
        
        [collectionViewH registerClass:[ImageCell class] forCellWithReuseIdentifier:reuseIdentifier];
        _collectionView = collectionViewH;
        _collectionView.backgroundColor = [UIColor lightGrayColor];
    }
    return _collectionView;
}


- (NSMutableArray*)ImageArray
{
    if (!_ImageArray) {
        _ImageArray = [NSMutableArray arrayWithObjects:[UIImage imageNamed:@"btn_plus"], nil];
    }
    return _ImageArray;
}


- (UILabel *)label {
    if (!_label) {
//       /Alignment = NSTextAlignmentLeft;
    }
    return _label;
}
@end
