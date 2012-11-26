//
//  KLCarouselViewController.m
//  KLSectionedCarousel
//
//  Created by Kieran Lafferty on 2012-11-09.
//  Copyright (c) 2012 Kieran Lafferty. All rights reserved.
//


#define kPickerHeight 120
#define kHeaderImageSize 60.0
#define kHeaderLabelHeight 20.0
#define kHeaderGradientTopColor  [UIColor colorWithRed: 242/255.0 green: 243/255.0 blue: 246/255.0 alpha: 1]
#define kHeaderGradientBottomColor  [UIColor colorWithRed: 197/255.0 green: 201/255.0 blue: 204/255.0 alpha: 1]

//Properties of the selected arrow
#define kHeaderArrowWidth 40.0


#import "KLHorizontalSelect.h"
#import <QuartzCore/QuartzCore.h>


@implementation KLHorizontalSelect
+ (float) hypotenuse {
    return (CGFloat)kHeaderArrowWidth / sqrt(2.0);
}
-(void) setFrame:(CGRect)frame {
    [super setFrame:frame];
    if (self.sectionStage) {
        [self.sectionStage setFrame: CGRectMake(0, 0, frame.size.width, kPickerHeight - [KLHorizontalSelect hypotenuse])];
    }
    if (self.selectedIndicator) {
        [self.selectedIndicator setFrame:CGRectMake(0, 0, [KLHorizontalSelect hypotenuse], [KLHorizontalSelect hypotenuse])];
        [self.selectedIndicator setCenter:CGPointMake(frame.size.width/2.0, self.sectionStage.frame.size.height)];

    }
    if  (self.collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        [flowLayout setItemSize:CGSizeMake(kHeaderImageSize + 20, kHeaderImageSize + kHeaderLabelHeight)];
        [flowLayout setMinimumInteritemSpacing:0.f];
        CGFloat edgeInset = self.frame.size.width/2.0 - flowLayout.itemSize.width/2.0;
        [flowLayout setSectionInset: UIEdgeInsetsMake(0, edgeInset, 0, edgeInset)];
        [flowLayout setMinimumLineSpacing:0.f];
        [self.collectionView setCollectionViewLayout:flowLayout];
        [self.collectionView setFrame: CGRectMake(0, self.sectionStage.frame.size.height/2.0 - flowLayout.itemSize.height/2.0, self.sectionStage.bounds.size.width, flowLayout.itemSize.height) ];
    }

    [self.collectionView scrollToItemAtIndexPath:self.selectedIndex
                                atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally
                                        animated:YES];
}
-(id) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        //Configure the views properties
        [self setClipsToBounds:YES];
        
        //Create the arrow by creating a box with hypotenuse equal to the width of the device

        self.selectedIndicator = [[UIView alloc] initWithFrame: CGRectMake(0, 0, [KLHorizontalSelect hypotenuse], [KLHorizontalSelect hypotenuse])];
        [self.selectedIndicator setBackgroundColor: kHeaderGradientBottomColor];
        [self.selectedIndicator setTransform: CGAffineTransformMakeRotation(3*M_PI_4)];
        [self.selectedIndicator.layer setShouldRasterize:YES];
        
        [self.selectedIndicator.layer setTransform: CATransform3DRotate(self.selectedIndicator.layer.transform, (1/4.0)*M_PI, 1.0, 1.0, 0.0)];
  

        [self.selectedIndicator.layer setZPosition: - [KLHorizontalSelect hypotenuse]/2.0];
        
        [self addSubview: self.selectedIndicator];
        
        //Create the gradient stage to place the information on
        self.sectionStage = [[KLGradientView alloc] initWithFrame: CGRectMake(0, 0, frame.size.width, kPickerHeight - [KLHorizontalSelect hypotenuse])
                                                         topColor: kHeaderGradientTopColor
                                                      bottomColor: kHeaderGradientBottomColor];
        [self addSubview: self.sectionStage];
        [self.selectedIndicator setCenter:CGPointMake(self.frame.size.width/2.0, self.sectionStage.frame.size.height)];
        //Add the collectionview to the stage
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        [flowLayout setItemSize:CGSizeMake(kHeaderImageSize + 20, kHeaderImageSize + kHeaderLabelHeight)];
        [flowLayout setMinimumInteritemSpacing:0.f];
        CGFloat edgeInset = self.frame.size.width/2.0 - flowLayout.itemSize.width/2.0;
        [flowLayout setSectionInset: UIEdgeInsetsMake(0, edgeInset, 0, edgeInset)];
        [flowLayout setMinimumLineSpacing:0.f];
        
        
        //Calculate frame to only select the middle one
        self.collectionView = [[UICollectionView alloc] initWithFrame: CGRectMake(0, self.sectionStage.frame.size.height/2.0 - flowLayout.itemSize.height/2.0, self.sectionStage.bounds.size.width, flowLayout.itemSize.height)
                                                 collectionViewLayout: flowLayout];
        [self.collectionView setClipsToBounds:NO];
        [self.collectionView setBackgroundColor:[UIColor clearColor]];
        [self.collectionView setShowsHorizontalScrollIndicator:NO];
        [self.collectionView setDataSource: self];
        [self.collectionView setDelegate: self];
        [self.sectionStage addSubview: self.collectionView];
    
        //Initialize the selected index to the first position
        self.selectedIndex = [NSIndexPath indexPathForRow:0 inSection:0];
    }
    return self;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.dataSource collectionView:collectionView numberOfItemsInSection:section];
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return  [self.dataSource collectionView:collectionView cellForItemAtIndexPath:indexPath];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.isDragging) {
        [self hideSelected:YES];
    }

}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self scrollViewDidFinishScrolling:scrollView];


}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.selectedIndex = indexPath;
    
    [collectionView scrollToItemAtIndexPath: indexPath
                           atScrollPosition: UICollectionViewScrollPositionCenteredHorizontally
                                   animated: YES];
    if ([self.delegate respondsToSelector:@selector(didSelectItem:item:)]) {
        [self.delegate didSelectItem: self.collectionView
                                item: [self.collectionView cellForItemAtIndexPath: indexPath]];
    }
    [self showSelected:YES];
}



-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if(!decelerate) {
        [self scrollViewDidFinishScrolling:scrollView];
    }

}
-(void) scrollViewDidFinishScrolling: (UIScrollView*) scrollView {

    //Get center most cell
    //Get center most visible cell
    NSIndexPath* centerCellIndex = nil;
    NSInteger centerX = self.frame.size.width/2;
    NSInteger smallestDistance = self.frame.size.width;
    for (UICollectionViewCell* cell in [self.collectionView visibleCells]) {

        //Get the center coordinate of the cell
        NSInteger cellCenterX = [self.superview convertPoint:cell.center fromView: self.collectionView].x;
        NSInteger distanceToCenterX = abs(centerX - cellCenterX);
        
        if (distanceToCenterX < smallestDistance) {
            smallestDistance = distanceToCenterX;
            centerCellIndex = [self.collectionView indexPathForCell:cell];
        }
    }
    [self.collectionView selectItemAtIndexPath: centerCellIndex
                                      animated: YES
                                scrollPosition: UICollectionViewScrollPositionCenteredHorizontally];
    [self showSelected:YES];
    
    //Make a call back to the delegate to indicate a new cell has been selected
    if ([self.delegate respondsToSelector:@selector(didSelectItem:item:)]) {
        [self.delegate didSelectItem:self.collectionView
                                item:[self.collectionView cellForItemAtIndexPath:centerCellIndex]];
    }

}

-(void) hideSelected:(BOOL) animated {
    if (!self.selectedIndicatorHidden) {
        if (animated) {
            [UIView animateWithDuration:0.3 animations:^{
                //Rotate the translated uiview to give the effect of shrinking it
                [self.selectedIndicator.layer setTransform: CATransform3DRotate(self.selectedIndicator.layer.transform,
                                                                                (1/4.0)*M_PI, 1.0, 1.0, 0.0)];
            } completion:^(BOOL finished) {
                //Alert delegate that the animation is complete
            }];
        }
        else {
            [self.selectedIndicator setCenter:CGPointMake(self.selectedIndicator.center.x, self.selectedIndicator.center.y - [KLHorizontalSelect hypotenuse])];
        }
    }
 
    self.selectedIndicatorHidden = YES;
}

-(void) showSelected:(BOOL) animated{
    if (self.selectedIndicatorHidden) {
        if (animated) {
            [UIView animateWithDuration:0.3 animations:^{
                //Rotate the translated uiview to give the effect of growing it
                [self.selectedIndicator.layer setTransform: CATransform3DRotate(self.selectedIndicator.layer.transform,  -(1/4.0)*M_PI, 1.0, 1.0, 0.0)];
            } completion:^(BOOL finished) {
                //Alert delegate that the animation is complete
            }];
        }
        else {
            [self.selectedIndicator setCenter:CGPointMake(self.selectedIndicator.center.x, self.selectedIndicator.center.y + [KLHorizontalSelect hypotenuse])];
        }
    }
    self.selectedIndicatorHidden = NO;
}
-(void) toggleSelected:(BOOL) animated {
    self.selectedIndicatorHidden? [self showSelected:animated] : [self hideSelected:animated];
}
@end
@implementation KLHeaderViewCell
-(id) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kHeaderImageSize, kHeaderImageSize)];
        [self.image setCenter:CGPointMake(frame.size.width/2.0, self.image.center.y)];
        self.label = [[UILabel alloc]initWithFrame:CGRectMake(0, kHeaderImageSize, frame.size.width, kHeaderLabelHeight)];
        [self.label setBackgroundColor: [UIColor clearColor]];
        [self.label setTextAlignment: NSTextAlignmentCenter];
        [self.label setTextColor:[UIColor darkGrayColor]];
        [self.label setFont: [UIFont boldSystemFontOfSize: 10.0]];
        
        [self addSubview: self.image];
        [self addSubview: self.label];
    }
    return  self;
}
@end



@implementation KLGradientView

-(id) initWithFrame:(CGRect) frame topColor: (UIColor*) topColor bottomColor: (UIColor*) bottomColor {
    if (self = [super initWithFrame:frame]) {
        self.topColor = topColor;
        self.bottomColor = bottomColor;
    }
    return self;
}
-(void) drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    // Draw gradient
    CGGradientRef myGradient;
    CGColorSpaceRef myColorspace;
    size_t num_locations = 2;
    CGFloat locations[2] = { 0.0, 1.0 };
    
    CGFloat topRed = 0.0, topGreen = 0.0, topBlue = 0.0, topAlpha =0.0;
    [self.topColor getRed:&topRed green:&topGreen blue:&topBlue alpha:&topAlpha];
    
    CGFloat bottomRed = 0.0, bottomGreen = 0.0, bottomBlue = 0.0, bottomAlpha =0.0;
    [self.bottomColor getRed:&bottomRed green:&bottomGreen blue:&bottomBlue alpha:&bottomAlpha];
    
    CGFloat components[8] = { topRed, topGreen, topBlue, topAlpha,  // Start color
        bottomRed, bottomGreen, bottomBlue, bottomAlpha}; // End color
    
    myColorspace = CGColorSpaceCreateDeviceRGB();
    
    myGradient = CGGradientCreateWithColorComponents (myColorspace, components,
                                                      locations, num_locations);
    CGPoint myStartPoint, myEndPoint;
    myStartPoint.x = self.frame.size.width/2;
    myStartPoint.y = 0.0;
    myEndPoint.x = self.frame.size.width/2;
    myEndPoint.y = self.frame.size.height;
    CGContextDrawLinearGradient (context, myGradient, myStartPoint, myEndPoint, 0);
    
}

@end
