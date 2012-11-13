KLHorizontalSelect
=======

Scroll left and right on the section scroller to make a selection. Inspiration for this project came from 8tracks iPhone application

Note: KLHorizontalSelect is intended for use with portrait orientation on iPhone/iPad/iPod Touch.

[Check out the Demo](http://www.youtube.com/watch?v=uzWZG99SAF0&feature=youtube_gdata_player) *Excuse the graphics glitches and lag due to my slow computer.*

## Installation ##

Drag the included <code>RNSwipeViewController</code> folder into your project. Then, include the following frameworks under *Link Binary With Libraries*:

* QuartzCore.framework
## Usage ##

Import the required file and declare your controller to conform to the HorizontalSelect datasource and delegate
<code>#import "KLHorizontalSelect.h"

@interface KLRootViewController : UIViewController <KLHorizontalSelectDataSource, KLHorizontalSelectDelegate></code>

Implement the required methods of the data source 

<code>-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.sectionData count];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView registerClass:[KLHeaderViewCell class] forCellWithReuseIdentifier:@"Cell"];
    KLHeaderViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    NSDictionary* cellDictionary = [self.sectionData objectAtIndex:indexPath.row];
    [cell.image setImage:[UIImage imageNamed: [cellDictionary objectForKey:@"image"]]];
    [cell.label setText:[cellDictionary objectForKey:@"text"]];
    return cell;
}</code>

Implement the optional delegate method for getting notified when a new item is selected
<code>-(void) didSelectItem:(UICollectionView*)collectionView item:(UICollectionViewCell*) cell {
    KLHeaderViewCell* selectedCell = (KLHeaderViewCell*) cell;
    
    NSLog(@"Selected: %@", selectedCell.label.text);
}</code>

## Config ##
The visual appearance can be tweaked by changing the constants in <code>KLHorizontalSelect.m</code>:
<code>
\#define kPickerHeight 120
\#define kHeaderImageSize 60.0
\#define kHeaderLabelHeight 20.0
\#define kHeaderGradientTopColor  [UIColor colorWithRed: 242/255.0 green: 243/255.0 blue: 246/255.0 alpha: 1]
\#define kHeaderGradientBottomColor  [UIColor colorWithRed: 197/255.0 green: 201/255.0 blue: 204/255.0 alpha: 1]

//Properties of the selected arrow
\#define kHeaderArrowWidth 40.0
</code>

## Contact ##

* [@kieran_lafferty](https://twitter.com/kieran_lafferty) on Twitter
* [@kieranlafferty](https://github.com/kieranlafferty) on Github
* <a href="mailTo:kieran.lafferty@gmail.com">kieran.lafferty [at] gmail [dot] com</a>

## License ##

Copyright (c) 2012 Kieran Lafferty

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.