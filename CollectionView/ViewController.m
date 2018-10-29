//
//  ViewController.m
//  CollectionView
//
//  Created by JeremyLu on 2018/10/22.
//  Copyright © 2018年 JeremyLu. All rights reserved.
//

#import "ViewController.h"
#import "UPloadCarImageController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self.navigationController pushViewController:[UPloadCarImageController new] animated:YES];
    
}

@end
