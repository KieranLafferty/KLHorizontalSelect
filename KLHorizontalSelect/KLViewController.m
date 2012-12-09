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
    self.horizontalSelect = [[KLHorizontalSelect alloc] initWithFrame: self.view.bounds];
    [self.horizontalSelect setTableData: controlData];
    [self.view addSubview: self.horizontalSelect];
    
}
-(void) viewWillAppear:(BOOL)animated {
    //Register for device orientation changes to resize if necessary
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
	
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didRotate:)
                                                 name:@"UIDeviceOrientationDidChangeNotification" object:nil];
}
-(void) viewWillDisappear:(BOOL)animated {
    [[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];
}
-(void) didRotate: (id) sender {
    [self.horizontalSelect setFrame:self.view.bounds];
}
- (void) horizontalSelect:(id)horizontalSelect didSelectCell:(KLHorizontalSelectCell *)cell {
    NSLog(@"Selected Cell: %@", cell.label.text);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showHidePressed:(id)sender {
    [self.horizontalSelect.arrow toggle:YES];
}
@end
