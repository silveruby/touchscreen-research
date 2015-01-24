//
//  SelectionXML.m
//  Prototype1
//
//  Created by Ruby on 3/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

/* SelectionXML */
#import "MenuItem.h"

@implementation MenuItem;
@synthesize label, parent, items, index;


- (void) dealloc {
	[label release];
	[index release];
	[parent release];
	[items release];	
	[super dealloc];
}

@end
