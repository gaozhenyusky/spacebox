//
//  ViewController.m
//  Delegate
//
//  Created by apple on 14/10/20.
//  Copyright (c) 2014年 宇蝈蝈. All rights reserved.
//

#import "ViewController.h"


@interface ViewController () <UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];

    [flowLayout setScrollDirection:0];
//    UICollectionViewLayout *viewLayout = [[UICollectionViewLayout alloc] init];
    UICollectionView *collectView = [[UICollectionView alloc] initWithFrame:CGRectMake(5, 20, 300, 320) collectionViewLayout:flowLayout];
    
    collectView.delegate = self;
    collectView.dataSource = self;
    [collectView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:collectView];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 9;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"QQ20140903-1.jpg"]];

    cell.backgroundView = imageView;
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//--------
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(90, 90);
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

//--------
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",(long)indexPath.row);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
