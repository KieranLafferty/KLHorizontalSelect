//
//  KLDetailViewController.m
//  KLSectionedCarousel
//
//  Created by Kieran Lafferty on 2012-11-09.
//  Copyright (c) 2012 Kieran Lafferty. All rights reserved.
//

#import "KLDetailViewController.h"

@interface KLDetailViewController ()
- (void)configureView;
@end

@implementation KLDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
