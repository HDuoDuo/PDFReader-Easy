//
//  LHRBaseViewController.m
//  PDFReader-EasyToRead
//
//  Created by 大海 on 1/9/18.
//  Copyright © 2018年 dahai. All rights reserved.
//

#import "LHRBaseViewController.h"

@interface LHRBaseViewController ()

@end

@implementation LHRBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
}
- (void)createUI {
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma editButtonItem
- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    [self changeNaviBarState:editing];
}

#pragma changeNavigationBarState
- (void)changeNaviBarState:(BOOL)editing {
    if (editing) {
        UIBarButtonItem *rightFirstItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(firstItemTouch)];
        
        rightFirstItem.enabled = false;
        UIBarButtonItem *rightSecondItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(SecondItemTouch)];
        rightSecondItem.enabled = false;
        
        [self.navigationItem setLeftBarButtonItems:@[rightFirstItem,rightSecondItem] animated:true];
        
    }else {
        self.navigationItem.leftBarButtonItems = @[];
    }
    
    [self setBarTintColor:editing];
}
- (void)firstItemTouch {
    
}
- (void)SecondItemTouch {
    
}

- (void)setBarTintColor:(BOOL)editing {
    UIColor *color = [UIColor whiteColor];
    if (editing) {
        self.navigationController.navigationBar.barTintColor = self.navigationController.navigationBar.tintColor;
        self.navigationController.navigationBar.tintColor = color;
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:color}];
        
    }else {
        self.navigationController.navigationBar.tintColor = self.navigationController.navigationBar.barTintColor;
        self.navigationController.navigationBar.barTintColor = color;
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
