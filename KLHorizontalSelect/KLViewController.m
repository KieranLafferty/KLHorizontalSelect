//
//  KLViewController.m
//  KLHorizontalSelect
//
//  Created by Kieran Lafferty on 2012-12-08.
//  Copyright (c) 2012 Kieran Lafferty. All rights reserved.
//

#import "KLViewController.h"

@interface KLViewController ()

@end

@implementation KLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithRed:10/255.0 green:37/255.0 blue:70/255.0 alpha:1]];
    
    //Initialize the informtion to feed the control
    NSString* plistPath = [[NSBundle mainBundle] pathForResource: @"SectionData"
                                                          ofType: @"plist"];
    // Build the array from the plist
    NSArray* controlData = [[NSArray alloc] initWithContentsOfFile:plistPath];
    
	// Do any additional setup after loading the view, typically from a nib.
    [self.horizontalSelect setTableData: controlData];
    [self.horizontalSelect setDelegate:self];
    //Customize the initially selected index - Note section is redundant but should always be 0
    [self.horizontalSelect setCurrentIndex:[NSIndexPath indexPathForRow:4 inSection:0]];
}


#pragma - mark KLHorizontalSelectDelegate implementation
-(void) horizontalSelect:(id)horizontalSelect didSelectCell:(KLHorizontalSelectCell*) cell {
    NSLog(@"Selected Cell: %@", cell.label.text);
}

- (IBAction)showHidePressed:(id)sender {
    [self.horizontalSelect.arrow toggle:YES];
}
@end
