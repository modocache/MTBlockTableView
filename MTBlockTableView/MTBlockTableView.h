//
//  MTBlockTableView.h
//  MTTableViewController
//
//  Created by Parker Wightman on 8/10/12.
//  Copyright (c) 2012 Mysterious Trousers. All rights reserved.
//

@interface MTBlockTableView : UITableView <UITableViewDelegate, UITableViewDataSource>

#pragma mark UITableViewDataSource blocks (required)

@property (nonatomic, strong) NSInteger (^numberOfRowsInSectionBlock)(UITableView *tableView, NSInteger section);
@property (nonatomic, strong) UITableViewCell * (^cellForRowAtIndexPathBlock)(UITableView *tableView, NSIndexPath *indexPath);



#pragma mark UITableViewDataSource blocks (optional)

@property (nonatomic, strong) NSInteger (^numberOfSectionsInTableViewBlock)(UITableView *tableView);
@property (nonatomic, strong) NSString * (^titleForHeaderInSectionBlock)(UITableView *tableView, NSInteger section);
@property (nonatomic, strong) NSString * (^titleForFooterInSectionBlock)(UITableView *tableView, NSInteger section);
@property (nonatomic, strong) BOOL (^canEditRowAtIndexPathBlock)(UITableView *tableView, NSIndexPath *indexPath);
@property (nonatomic, strong) BOOL (^canMoveRowAtIndexPathBlock)(UITableView *tableView, NSIndexPath *indexPath);
@property (nonatomic, strong) NSArray * (^sectionIndexTitlesBlock)(UITableView *tableView);
@property (nonatomic, strong) void (^commitEditingStyleForRowAtIndexPathBlock)(UITableView *tableView, UITableViewCellEditingStyle editingStyle, NSIndexPath *indexPath);
@property (nonatomic, strong) void (^moveRowAtIndexPathToIndexPathBlock)(UITableView *tableView, NSIndexPath *sourceIndexPath, NSIndexPath *destinationIndexPath);
@property (nonatomic, strong) NSInteger (^sectionForSectionIndexTitleAtIndex)(UITableView *tableView, NSString *title, NSInteger index);

@end

