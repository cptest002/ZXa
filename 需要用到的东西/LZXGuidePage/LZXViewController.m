//
//  LZXViewController.m
//  引导页
//
//  Created by twzs on 16/6/23.
//  Copyright © 2016年 LZX. All rights reserved.
//

#import "LZXViewController.h"
#import "LZXCollectionViewCell.h"


@interface LZXViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic,strong) UICollectionView *collectionView;

@end

@implementation LZXViewController
-(void)reloadData{
    
    [_collectionView reloadData];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    [self addCollectionView];
    UIImageView *temView = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [temView setImage:[UIImage imageNamed:@"PK10启动页"]];
    [self.view addSubview:temView];
//    [self.collectionView addSubview:temView];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.06 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [temView removeFromSuperview];
        [self.view addSubview:_controller.view];
        
    });

}

- (void)addCollectionView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    
    // 设置cell 大小
    layout.itemSize = self.view.bounds.size;
    
    // 设置滑动方向
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    // 设置间距
    layout.minimumLineSpacing = 0;
    
    _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    
    _collectionView.delegate = self;
    
    _collectionView.dataSource = self;
    // 隐藏滚动条
    _collectionView.showsHorizontalScrollIndicator = NO;
    
    // 设置分页效果
    _collectionView.pagingEnabled = YES;
    
    // 设置弹簧效果
    _collectionView.bounces =  YES;
    
    [self.view addSubview:_collectionView];
    
    [_collectionView registerClass:[LZXCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];

}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LZXCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.imageviewbg.image = [UIImage imageNamed:self.dataArray[indexPath.row]];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == self.dataArray.count - 1) {
        [self presentViewController:self.controller animated:YES completion:nil];
    }
}
@end
