//
//  HomeViewController.h
//  Prototype1
//
//  Created by Ruby on 4/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GestureViewController.h"
#import "DirectManipulationViewController.h"

@interface HomeViewController : UIViewController {

	NSMutableArray *conditionsArray;
    IBOutlet UIPickerView *conditionsPickerView;
	
	NSMutableArray *blocksArray;
    IBOutlet UIPickerView *blocksPickerView;
	
	//IBOutlet UIButton* cont;
	
	GestureViewController *gesture_vc;
	DirectManipulationViewController *directManipulation_vc;
}

@property (nonatomic,retain) GestureViewController *gesture_vc;
@property (nonatomic,retain) DirectManipulationViewController *directManipulation_vc;

- (IBAction)continueToStudy;
@end
