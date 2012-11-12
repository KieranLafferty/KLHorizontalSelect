//
//  KLRootViewController.h
//  KLSectionedCarousel
//
//  Created by Kieran Lafferty on 2012-11-09.
//  Copyright (c) 2012 Kieran Lafferty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KLHorizontalSelect.h"

@interface KLRootViewController : UIViewController <KLCarouselHeaderViewDataSource, KLCarouselHeaderViewDelegate>
- (IBAction)showHideButtonPressed:(id)sender;
@property (nonatomic, strong) KLHorizontalSelect* sectionHeader;
@property (nonatomic, strong) NSArray* sectionData; 
@end
