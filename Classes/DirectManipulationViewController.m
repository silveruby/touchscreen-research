//
//  Prototype1ViewController.m
//  Prototype1
//
//  Created by Ruby on 2/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DirectManipulationViewController.h"
#import "MenuItem.h"
#import "MenuXMLParser.h"
#import "FliteTTS.h"

/* Prototype1ViewController Class*/
@implementation DirectManipulationViewController;
@synthesize parser, currentItem;

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

/*-(void)awakeFromNib
{

}*/

- (id)initWithNibName:(NSString*)nibName bundle:(NSBundle*)nibBundle block:(int)b
{
	NSLog(@"condition and blocks");
    self = [super initWithNibName:nibName bundle:nibBundle];
    if(self == nil)
    {
        return nil;
    }
	
	NSString *str;

	
	if(b == 0){
		// parse menuList.xml
		str = @"menuList1.xml";
	}
	else if(b == 1){
		str = @"menuList2.xml";
	}
	else{
		str = @"menuList3.xml";
	}
	
	parser = [[MenuXMLParser alloc] init];
	[parser doParse:str];
	currentItem = parser.menu;
	
    return self;
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	//double tap
	UITapGestureRecognizer *double_tap = 
	[[UITapGestureRecognizer alloc]
	 initWithTarget:self 
	 action:@selector(doubleTap:)];
    double_tap.numberOfTapsRequired = 2;
	double_tap.numberOfTouchesRequired = 2;
    [self.view addGestureRecognizer:double_tap];
    [double_tap release];
	
	// speech
	if(fliteEngine == nil){
		fliteEngine = [[FliteTTS alloc] init];
		[fliteEngine setPitch:100.0 variance:50.0 speed:1.0];       // Change the voice properties
		[fliteEngine setVoice:@"cmu_us_slt"];   // Switch to a different voice	
	}
	
	//set time
	start = nil;
	
	//NSLog(@"Up4: %@", currentItem.label);

}


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	/* try to dealloc all the synthesize variables afterward, ok? */
    [super dealloc];
}


- (IBAction) do_btn_up {
	if(currentItem->parent != nil){
		currentItem = currentItem.parent;
		[fliteEngine speakText:currentItem.label]; // Make it talk
	}	
	else{
		[fliteEngine speakText:@"empty"]; // Make it talk		
	}
}

- (IBAction) do_btn_down {
	//NSLog(@"DOWN");
	if([currentItem.items count] != 0){
		//int i =  [currentItem.index intValue];
		currentItem = [currentItem.items objectAtIndex:0];
		[fliteEngine speakText:currentItem.label]; // Make it talk
	}
	else{
		[fliteEngine speakText:@"empty"]; // Make it talk		
	}
}

- (IBAction) do_btn_left {
	//NSLog(@"LEFT");
	
	int i =  [currentItem.index intValue];
	i--;
	if(currentItem.parent == nil){
		[fliteEngine speakText:@"empty"]; // Make it talk	
		return;
	}
	else if(i < 0){
		//NSLog(@"LEFT1");
		i = [currentItem.parent.items count] - 1;
		currentItem = [currentItem.parent.items objectAtIndex:i]; 
	}
	else{
		//NSLog(@"LEFT2");		
		currentItem = [currentItem.parent.items objectAtIndex:i]; 
	}
	
	[fliteEngine speakText:currentItem.label]; // Make it talk
}

- (IBAction) do_btn_right {

	int i =  [currentItem.index intValue];
	i++;
	if(currentItem.parent == nil){
		[fliteEngine speakText:@"empty"]; // Make it talk	
		return;
	}
	else if(i < [currentItem.parent.items count]){
		//NSLog(@"RIGHT1");
		currentItem = [currentItem.parent.items objectAtIndex:i]; 
	}
	else{
		//NSLog(@"RIGHT2");		
		i = 0; 
		currentItem = [currentItem.parent.items objectAtIndex:i]; 
	}
	
	[fliteEngine speakText:currentItem.label]; // Make it talk
}

- (IBAction) do_btn_select {
	[fliteEngine speakText:currentItem.label]; // Make it talk
}

- (IBAction)doubleTap:(UIGestureRecognizer *)sender {
	
	if(start == nil){
		[fliteEngine speakText:@"Start"]; // Make it talk
		
		// start time
		start = [[NSDate date] retain];
		
		// reset currentItem
		currentItem = parser.menu;
		
		// clear elapsedtime text
		status.text = @"In Progress";
		elapsedTime.text=@"";
		
	}
	else{
		[fliteEngine speakText:@"Finish"]; // Make it talk
		
		// log elapsed time
		NSTimeInterval timeInterval = [start timeIntervalSinceNow];	
		timeInterval = 0 - timeInterval;
		//long min = (long)timeInterval / 60;    // divide two longs, truncates
		//long sec = (long)timeInterval % 60;    // remainder of long divide
		//NSString* str = [[NSString alloc] initWithFormat:@"%02d:%02d", min, sec];
		int millisecondAccuracy = 3;
		NSString* str = [NSString stringWithFormat:@"%@%02d:%02d%@", ((int)(timeInterval / 3600) > 0 ? [NSString stringWithFormat:@"%n:", (int)(timeInterval / 3600)] : @""), ((int)timeInterval % 3600) / 60, (int)timeInterval % 60, (millisecondAccuracy > 0 ? [NSString stringWithFormat:@".%d", (int)round(((float)timeInterval - (float)floor(timeInterval)) * pow(10.0, millisecondAccuracy))] : @"")];
		NSLog(@"%@", str);	
		status.text = @"Double Tap to Start";
		elapsedTime.text = str;
		
		// reset start
		[start release];
		start = nil;
		
		// reset currentItem to menu
		currentItem=parser.menu;
	}
}

@end
