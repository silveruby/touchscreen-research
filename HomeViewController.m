    //
//  HomeViewController.m
//  Prototype1
//
//  Created by Ruby on 4/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HomeViewController.h"
#import "GestureViewController.h"
#import "DirectManipulationViewController.h"

@implementation HomeViewController

@synthesize gesture_vc;
@synthesize directManipulation_vc;

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"continue DSFSD study");
	
	// set conditions array
	conditionsArray = [[NSMutableArray alloc] init]; // This will allocate tableViewArray.
	[conditionsArray addObject:@"Gesture"]; // Add the string to the tableViewArray. 
	[conditionsArray addObject:@"Buttons"]; // Add the string to the tableViewArray. 
	[conditionsPickerView selectRow:0 inComponent:0 animated:NO];
	
	// set blocks array
	blocksArray = [[NSMutableArray alloc] init]; // This will allocate tableViewArray.
	[blocksArray addObject:@"One"]; // Add the string to the tableViewArray. 
	[blocksArray addObject:@"Two"]; // Add the string to the tableViewArray. 
	//[blocksArray addObject:@"Three"]; // Add the string to the tableViewArray. 	
	[blocksPickerView selectRow:0 inComponent:0 animated:NO];	
	
}

- (NSInteger)numberOfComponentsInPickerView:(NSInteger)component {
	return 1;
}

- (NSInteger)pickerView:(UIPickerView *)picker numberOfRowsInComponent:(NSInteger)component {
	if(picker.tag == 0){
		return [conditionsArray count];		
	}
	else {
		return [blocksArray count];
	}
}

- (NSString *)pickerView:(UIPickerView *)picker titleForRow:(NSInteger)row forComponent:(NSInteger)component {
	if(picker.tag == 0){
		return [conditionsArray objectAtIndex:row];		
	}
	else {
		return [blocksArray objectAtIndex:row];
	}
	
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return YES;
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

- (IBAction)continueToStudy {
	NSLog(@"continue to study");
	int conditionIndex = [conditionsPickerView selectedRowInComponent:0];
	int blockIndex = [blocksPickerView selectedRowInComponent:0];

	if(conditionIndex == 0){
		if(self.gesture_vc == nil){
			GestureViewController *temp = [[GestureViewController alloc] initWithNibName:@"gesture" bundle:[NSBundle mainBundle] block:blockIndex];
			self.gesture_vc = temp;
			[temp release];
		}
		else{
			GestureViewController *temp = [[GestureViewController alloc] initWithNibName:@"gesture" bundle:[NSBundle mainBundle] block:blockIndex];
			self.gesture_vc = temp;
			[temp release];			
		}
		[self.navigationController pushViewController:self.gesture_vc animated:YES];
	}
	else{
		if(self.directManipulation_vc == nil){
			DirectManipulationViewController *temp = [[DirectManipulationViewController alloc] initWithNibName:@"directManipulation" bundle:[NSBundle mainBundle] block:blockIndex];
			self.directManipulation_vc = temp;
			[temp release];
		}
		else{
			DirectManipulationViewController *temp = [[DirectManipulationViewController alloc] initWithNibName:@"directManipulation" bundle:[NSBundle mainBundle] block:blockIndex];
			self.directManipulation_vc = temp;
			[temp release];			
		}
		[self.navigationController pushViewController:self.directManipulation_vc animated:YES];		
	}
}

@end
