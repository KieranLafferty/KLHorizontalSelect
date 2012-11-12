//
//  KLRootViewController.h
//  KLSectionedCarousel
//
//  Created by Kieran Lafferty on 2012-11-09.
//  Copyright (c) 2012 Kieran Lafferty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KLCarouselViewController.h"

@interface KLRootViewController : UIViewController <KLCarouselHeaderViewDataSource, KLCarouselHeaderViewDelegate>
- (IBAction)showHideButtonPressed:(id)sender;
@property (nonatomic, strong) KLCarouselHeaderView* sectionHeader;
@property (nonatomic, strong) NSArray* sectionData; 
@end
