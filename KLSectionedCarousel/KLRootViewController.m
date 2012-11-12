//
//  KLRootViewController.m
//  KLSectionedCarousel
//
//  Created by Kieran Lafferty on 2012-11-09.
//  Copyright (c) 2012 Kieran Lafferty. All rights reserved.
//

#import "KLRootViewController.h"
@interface KLRootViewController ()

@end

@implementation KLRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString* plistPath = [[NSBundle mainBundle] pathForResource: @"SectionData"
                                                          ofType: @"plist"];
    // Build the array from the plist
    self.sectionData = [[NSArray alloc] initWithContentsOfFile:plistPath];
	// Do any additional setup after loading the view.
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithRed:10/255.0 green:37/255.0 blue:70/255.0 alpha:1]];
    
    
    self.sectionHeader = [[KLHorizontalSelect alloc] initWithFrame:CGRectMake(0, 0, 320, 120)];
    [self.sectionHeader setDataSource:self];
    [self.sectionHeader setDelegate:self];
    [self.view addSubview: self.sectionHeader];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showHideButtonPressed:(id)sender {
    [self.sectionHeader toggleSelected:YES];
}

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.sectionData count];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView registerClass:[KLHeaderViewCell class] forCellWithReuseIdentifier:@"Cell"];
    KLHeaderViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    NSDictionary* cellDictionary = [self.sectionData objectAtIndex:indexPath.row];
    [cell.image setImage:[UIImage imageNamed: [cellDictionary objectForKey:@"image"]]];
    [cell.label setText:[cellDictionary objectForKey:@"text"]];
    return cell;
}
-(void) didSelectItem:(UICollectionView*)collectionView item:(UICollectionViewCell*) cell {
    KLHeaderViewCell* selectedCell = (KLHeaderViewCell*) cell;
    
    NSLog(@"Selected: %@", selectedCell.label.text);
}
@end
