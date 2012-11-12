//
//  KLCarouselViewController.h
//  KLSectionedCarousel
//
//  Created by Kieran Lafferty on 2012-11-09.
//  Copyright (c) 2012 Kieran Lafferty. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface KLGradientView : UIView
@property (nonatomic, strong) UIColor* topColor;
@property (nonatomic, strong) UIColor* bottomColor;
-(id) initWithFrame:(CGRect) frame topColor: (UIColor*) topColor bottomColor: (UIColor*) bottomColor;
@end


@protocol KLCarouselHeaderViewDataSource <NSObject>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
@end
@protocol KLCarouselHeaderViewDelegate <NSObject>
@optional
-(void) didSelectItem:(UICollectionView*)collectionView item:(UICollectionViewCell*) cell;

@end
@interface KLCarouselHeaderView: UIView <UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView* collectionView;
@property (nonatomic, strong) UIView* selectedIndicator;
@property (nonatomic) BOOL selectedIndicatorHidden;
@property (nonatomic, strong) KLGradientView* sectionStage;
@property (nonatomic, strong) id<KLCarouselHeaderViewDelegate> delegate;
@property (nonatomic, strong) id<KLCarouselHeaderViewDataSource> dataSource;

-(void) hideSelected:(BOOL) animated;
-(void) showSelected:(BOOL) animated;
-(void) toggleSelected:(BOOL) animated;
@end

@interface KLHeaderViewCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView* image;
@property (nonatomic, strong) UILabel* label;
@end




