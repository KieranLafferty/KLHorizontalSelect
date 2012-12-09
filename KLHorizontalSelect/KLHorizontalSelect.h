//
//  KLHorizontalSelect.h
//  KLHorizontalSelect
//
//  Created by Kieran Lafferty on 2012-12-08.
//  Copyright (c) 2012 Kieran Lafferty. All rights reserved.
//

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
@property (nonatomic, strong) id<KLHorizontalSelectDelegate> delegate;

-(id) initWithFrame:(CGRect)frame delegate:(id<KLHorizontalSelectDelegate>) delegate;
@end


