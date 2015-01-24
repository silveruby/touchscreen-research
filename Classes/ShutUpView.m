//
//  ShutUpView.m
//  Prototype1
//
//  Created by Ruby on 3/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ShutUpView.h"


@implementation ShutUpView

+ (void)initialize {
	NSLog(@"HELLO MY NAME IS %d", self);
	
}

- (id)initWithFrame:(CGRect)aRect {
	[super initWithFrame:aRect];
	NSLog(@"ME INITIALIZE");

	return self;
}

- (id)viewWillLoad {
	NSLog(@"WTF BIATCH");
}

- (void)viewDidLoad {
    NSLog(@"SHUT UP");
}

- (void)viewWillDraw {
	NSLog(@"SHUT UP LAME");
	
}

@end
