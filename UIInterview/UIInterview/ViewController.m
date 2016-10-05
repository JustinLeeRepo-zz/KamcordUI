//
//  ViewController.m
//  UIInterview
//
//  Created by Tim Johnson on 10/8/15.
//  Copyright © 2015 Kamcord. All rights reserved.
//

#import "ViewController.h"
#import "Kamcord_Extensions.h"
#import "Utility.h"
#import "PlayerViewController.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Home";
    
    [self setupCollectionView];
}

- (void)setupCollectionView {
    
    [self.collectionView registerClass:[UICollectionViewCell class]
            forCellWithReuseIdentifier:[UICollectionViewCell kamcord_reusableIdentifier]];
}

#pragma mark - UICollectionViewDataSource

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[UICollectionViewCell kamcord_reusableIdentifier]
                                                                           forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor colorWithRed:(146. / 255.)
                                           green:(150. / 255.)
                                            blue:(154. / 255.)
                                           alpha:1.];
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1002;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat totalWidth = CGRectGetWidth(collectionView.frame);
    CGFloat numCells = 3;
    
    CGFloat whitespaceWidth = numCells * [self collectionView:collectionView
                                                       layout:collectionViewLayout
                     minimumInteritemSpacingForSectionAtIndex:indexPath.section];
    
    totalWidth -= whitespaceWidth;
    
    CGFloat preferredWith = totalWidth / numCells;
    CGFloat preferredHeight = [Utility heightWithDesiredRatioForWidth:preferredWith];
    
    CGSize preferredSize = CGSizeMake(preferredWith, preferredHeight);
    
    return preferredSize;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsZero;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 15;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 15;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    PlayerViewController *playerController = [[PlayerViewController alloc] init];
    [self presentViewController:playerController animated:YES completion:nil];
    
}

@end
