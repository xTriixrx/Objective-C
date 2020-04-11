//
//  Document.h
//  TahDoodle
//
//  Created by Vincent Nigro on 9/29/19.
//  Copyright © 2019 Vincent Nigro. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Document : NSDocument <NSTableViewDataSource>
{
    NSMutableArray *toDoItems;
    NSTextField *input;
    IBOutlet NSTableView *itemTableView;
}
- (IBAction)createNewItem:(id)sender;

@end

