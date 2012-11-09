//
//  KLDetailViewController.h
//  KLSectionedCarousel
//
//  Created by Kieran Lafferty on 2012-11-09.
//  Copyright (c) 2012 Kieran Lafferty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KLDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
