//
//  MenuXMLParser.m
//  Prototype1
//
//  Created by Ruby on 3/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MenuXMLParser.h"
#import "MenuItem.h"
#import "TouchXML.h"

@implementation MenuXMLParser
@synthesize menu, currentItem, parentItem;

- (MenuXMLParser *) initMenuXMLParser {
	[super init];

	//currentItem = [[MenuItem alloc] init];
	//menu = currentItem;
	return self;
}


- (void)addMenu:(NSDictionary *)attr {
	// create new MenuItem
	currentItem = [[MenuItem alloc] init];
	currentItem.items = [[NSMutableArray alloc] init];
	
	//get the attribute
	currentItem.label = [attr objectForKey:@"label"];
	
	currentItem.parent = nil;	
	
	currentItem.index = [attr objectForKey:@"index"];
	
	//[currentItem->items addObject:item];
	//currentItem = item;
	
	menu=currentItem;
}

- (void)addItem:(NSDictionary *)attr {
	// create new MenuItem
	MenuItem *item = [[MenuItem alloc] init];
	
	item.items = [[NSMutableArray alloc] init];
	
	//get the attribute
	item.label = [attr objectForKey:@"label"];
		
	item.index = [attr objectForKey:@"index"];
	
	item.parent = currentItem;	
	
	[currentItem.items addObject:item];
	
	currentItem = item;
	
}

- (void)parser:(NSXMLParser *)parser 
didStartElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI 
 qualifiedName:(NSString *)qualifiedName 
	attributes:(NSDictionary *)attributeDict {

	if ([elementName isEqualToString:@"menu"]) {
	
		[self addMenu:attributeDict];
	}

	if ([elementName isEqualToString:@"item"]) {
		
		[self addItem:attributeDict];
	}
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
	if (!currentElementValue) {
		// init the ad hoc string with the value     
		//currentElementValue = [[NSMutableString alloc] initWithString:string];
	} else {
		// append value to the ad hoc string    
		//[currentElementValue appendString:string];
	}
}  

// Did End Element
- (void)parser:(NSXMLParser *)parser 
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI 
 qualifiedName:(NSString *)qName {
	
	if ([elementName isEqualToString:@"menu"]) {
		NSLog(@"Count : %i", [menu->items count]);
		//menu = currentItem;
		
	} 
	
	if ([elementName isEqualToString:@"item"]) {
		//NSLog(@"No errors - user count : %i", [currentItem->items count]);
		currentItem = currentItem->parent;
		//NSLog(@"parent: %@", currentItem->label);
		
	} 
	
	[currentElementValue release];
	currentElementValue = nil;
}

/* XML Parser Functions */

+ (void) doParse1:(NSString *)xml {
	NSString *path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:xml];
	NSURL *xmlURL = [NSURL fileURLWithPath:path];
	
	// create TouchXML class
	CXMLDocument *menuParser = [[[CXMLDocument alloc] initWithContentsOfURL:xmlURL options:0 error:nil] autorelease];
	
	// create array
	NSArray *resultNodes = NULL;
	
	// set resultNodes array to contian an object for every instance of an node
	resultNodes = [menuParser nodesForXPath:@"//item" error:nil];
	
	// Loop through the resultNodes to access each items actual data
    for (CXMLElement *resultElement in resultNodes) {
		NSLog(@"test");
		
        // Create a temporary MutableDictionary to store the items fields in, which will eventually end up in blogEntries
       // NSMutableDictionary *menuItem = [[NSMutableDictionary alloc] init];
		
        // Create a counter variable as type "int"
        int counter;
		
        // Loop through the children of the current  node
        for(counter = 0; counter < [resultElement childCount]; counter++) {
			
            // Add each field to the blogItem Dictionary with the node name as key and node value as the value
            //[blogItem setObject:[[resultElement childAtIndex:counter] stringValue] forKey:[[resultElement childAtIndex:counter] name]];
			NSLog(@"%s", [[resultElement childAtIndex:counter] stringValue]);
			NSLog(@"%@", [[resultElement childAtIndex:counter] stringValue]);			
        }
		
				NSLog(@"test2");
		
        // Add the blogItem to the global blogEntries Array so that the view can access it.
        //[blogEntries addObject:[blogItem copy]];
    }
}

- (void) doParse:(NSString *)xml {
	
	NSString *path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:xml];
	NSURL *xmlURL = [NSURL fileURLWithPath:path];
	
	// create and init NSXMLParser object
	NSXMLParser *nsXmlParser = [[[NSXMLParser alloc] initWithContentsOfURL:xmlURL] autorelease];
	
	// create and init our delegate
	//MenuXMLParser *parser = [[MenuXMLParser alloc] initMenuXMLParser];
	
	// set delegate
	[nsXmlParser setDelegate:self];
	
	// parsing...
	BOOL success = [nsXmlParser parse];
	
	// test the result
	if (success) {
		//return [parser menu];
		NSLog(@"Success : %@", [self menu]->label);
		//MenuItem * test = [[parser menu]->items objectAtIndex:0];
		//NSLog(@"Menu : %@", test->label);	
	} else {
		//return nil;
		NSLog(@"Error parsing document!");
	}
	
	//[parser release];
	//[nsXmlParser release];
	
}

@end
