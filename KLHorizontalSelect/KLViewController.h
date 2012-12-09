//
//  KLViewController.h
//  KLHorizontalSelect
//
//  Created by Kieran Lafferty on 2012-12-08.
//  Copyright (c) 2012 Kieran Lafferty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KLHorizontalSelect.h"
@interface KLViewController : UIViewController <KLHorizontalSelectDelegate>
- (IBAction)showHidePressed:(id)sender;
@property (nonatomic, strong) KLHorizontalSelect* horizontalSelect;
@end
