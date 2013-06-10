//
//  KLHorizontalSelect.h
//  KLHorizontalSelect
//
//  Created by Kieran Lafferty on 2012-12-08.
//  Copyright (c) 2012 Kieran Lafferty. All rights reserved.
//

//Control Properties
#define kDefaultCellWidth 80.0      //The width of each of the items
#define kDefaultCellHeight 90       //Height of the items/control
#define kDefaultGradientTopColor  [UIColor colorWithRed: 242/255.0 green: 243/255.0 blue: 246/255.0 alpha: 1]   //Top Gradient Color
#define kDefaultGradientBottomColor  [UIColor colorWithRed: 197/255.0 green: 201/255.0 blue: 204/255.0 alpha: 1]    //Bottom Gradient Color
#define kDefaultLabelHeight 20.0    //Adjusts the height of the label
#define kDefaultImageHeight 60.0    //Adjusts the height of the image

//Arrow properties
#define kHeaderArrowWidth 40.0      //Adjusts the width of the selection arrow
#define kHeaderArrowHeight 15.0     //Adjusts the width of the selection arrow

//Shadow properties
#define kDefaultShadowColor [UIColor blackColor]
#define kDefaultShadowOffset CGSizeMake(0.0, 3.0)
#define kDefaultShadowOpacity 0.96

#import <UIKit/UIKit.h>

@interface KLHorizontalSelectCell : UITableViewCell
@property (nonatomic, strong) UIImageView* image;
@property (nonatomic, strong) UILabel* label;
@end

@interface KLHorizontalSelectArrow : UIView
@property (nonatomic) BOOL isShowing;
-(void) show:(BOOL) animated;
-(void) hide:(BOOL) animated;
-(void) toggle:(BOOL) animated;
-(id) initWithFrame:(CGRect)frame color:(UIColor*) color;
@end
@protocol KLHorizontalSelectDelegate <NSObject>
@optional
-(void) horizontalSelect:(id)horizontalSelect didSelectCell:(KLHorizontalSelectCell*) cell;
@end

@interface KLHorizontalSelect : UIView <UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>
@property (nonatomic, strong) NSIndexPath* currentIndex;
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) NSArray* tableData;
@property (nonatomic, strong) KLHorizontalSelectArrow* arrow;
@property (nonatomic, weak) IBOutlet id<KLHorizontalSelectDelegate> delegate;

-(id) initWithFrame:(CGRect)frame delegate:(id<KLHorizontalSelectDelegate>) delegate;
@end


