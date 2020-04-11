//
//  Document.m
//  TahDoodle
//
//  Created by Vincent Nigro on 9/29/19.
//  Copyright © 2019 Vincent Nigro. All rights reserved.
//

#import "Document.h"

@interface Document ()

@end

@implementation Document

#pragma mark - NSDocument Overrides

- (instancetype)init {
    self = [super init];
    if (self) {
        input = [[NSTextField alloc] init];
        // Add your subclass-specific initialization here.
    }
    return self;
}

+ (BOOL)autosavesInPlace {
    return YES;
}


- (NSString *)windowNibName {
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"Document";
}

#pragma mark - Actions

- (IBAction)createNewItem:(id)sender
{
    // If thre's no array yet, go ahead and create one to store our new task
    if(!toDoItems) {
        toDoItems = [NSMutableArray array];
    }
    
    [toDoItems addObject:[input stringValue]];
    [input setStringValue:@""];
    
    // -reloadData tells the table view to refresh and ask its dataSource
    // (which happens to be this Document object in this case)
    // for new data to display
    [itemTableView reloadData];
    
    // -updateChangeCount: tells the application whether or not the document
    // has unsaved changes. NSChangeDone flags the document as unsaved.
    [self updateChangeCount:NSChangeDone];
}

#pragma mark - Data Source Methods

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tv
{
    // This table view is meant to display the toDoItems,
    // so the number of entries in the table view will be the same
    // as the number of objects in the array.
    return [toDoItems count];
}

- (id)tableView:(NSTableView *)tableView
    objectValueForTableColumn:(nullable NSTableColumn *)tableColumn
                          row:(NSInteger)row
{
    // Return the item from toDoItems that corresponds to the cell
    // that the table view wants to display.
    return [toDoItems objectAtIndex:row];
}

- (void)tableView:(NSTableView *)tableView
   setObjectValue:(nullable id)object
   forTableColumn:(nullable NSTableColumn *)tableColumn
              row:(NSInteger)row
{
    // When the user changes a to-do item on the table view.
    // update the toDoItems array.
    [toDoItems replaceObjectAtIndex:row withObject:object];
    // And then flag the document as having unsaved changes.
    [self updateChangeCount:NSChangeDone];
}

- (NSData *)dataOfType:(NSString *)typeName
                 error:(NSError **)outError
{
    // This method is called when our document is being saved
    // We are expecting to hand the caller an NSData object  wrapping our data
    // so that it can be written to disk.
    
    // If there's no array, we'll write out an empty array for now.
    if(!toDoItems) {
        toDoItems = [NSMutableArray array];
    }
    
    // Pack our toDoItems array into an NSData object.
    NSData *data = [NSPropertyListSerialization
                    dataWithPropertyList:toDoItems
                    format:NSPropertyListXMLFormat_v1_0
                    options:NSPropertyListMutableContainers
                    error:outError];
    
    // return our newly-packed NSData object
    return data;
}


- (BOOL)readFromData:(NSData *)data
              ofType:(NSString *)typeName
               error:(NSError **)outError
{
    // This method is called when a document is being loaded
    // We are handed an NSData object and expected to pull our data out of it
    
    // Extract our toDoItems
    toDoItems = [NSPropertyListSerialization
                 propertyListWithData:data
                options:0
                 format:NULL
                  error:outError];
    
    // return success or failure depending on success of the above call
    return (toDoItems != nil);
}


@end
