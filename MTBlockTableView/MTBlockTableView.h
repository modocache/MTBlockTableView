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


#pragma mark - UITableViewDelegate blocks (optional)

@property (nonatomic, strong) void (^accessoryButtonTappedForRowWithIndexPathBlock)(UITableView *tableView, NSIndexPath *indexPath);
@property (nonatomic, strong) BOOL (^canPerformActionForRowAtIndexPathWithSenderBlock)(UITableView *tableView, SEL action, NSIndexPath *indexPath, id sender);
@property (nonatomic, strong) void (^didDeselectRowAtIndexPathBlock)(UITableView *tableView, NSIndexPath *indexPath);
@property (nonatomic, strong) void (^didEndEditingRowAtIndexPathBlock)(UITableView *tableView, NSIndexPath *indexPath);
@property (nonatomic, strong) void (^didSelectRowAtIndexPathBlock)(UITableView *tableView, NSIndexPath *indexPath);
@property (nonatomic, strong) UITableViewCellEditingStyle (^editingStyleForRowAtIndexPathBlock)(UITableView *tableView, NSIndexPath *indexPath);
@property (nonatomic, strong) CGFloat (^heightForFooterInSectionBlock)(UITableView *tableView, NSInteger section);
@property (nonatomic, strong) CGFloat (^heightForHeaderInSectionBlock)(UITableView *tableView, NSInteger section);
@property (nonatomic, strong) CGFloat (^heightForRowAtIndexPathBlock)(UITableView *tableView, NSIndexPath *indexPath);
@property (nonatomic, strong) NSInteger (^indentationLevelForRowAtIndexPathBlock)(UITableView *tableView, NSIndexPath *indexPath);
@property (nonatomic, strong) void (^performActionForRowAtIndexPathWithSenderBlock)(UITableView *tableView, SEL action, NSIndexPath *indexPath, id sender);
@property (nonatomic, strong) BOOL (^shouldIndentWhileEditingRowAtIndexPathBlock)(UITableView *tableView, NSIndexPath *indexPath);
@property (nonatomic, strong) BOOL (^shouldShowMenuForRowAtIndexPathBlock)(UITableView *tableView, NSIndexPath *indexPath);
@property (nonatomic, strong) NSIndexPath * (^targetIndexPathForMoveFromRowAtIndexPathToProposedIndexPathBlock)(UITableView *tableView, NSIndexPath *sourceIndexPath, NSIndexPath *proposedDestinationIndexPath);
@property (nonatomic, strong) NSString * (^titleForDeleteConfirmationButtonForRowAtIndexPathBlock)(UITableView *tableView, NSIndexPath *indexPath);
@property (nonatomic, strong) UIView * (^viewForFooterInSectionBlock)(UITableView *tableView, NSInteger section);
@property (nonatomic, strong) UIView * (^viewForHeaderInSectionBlock)(UITableView *tableView, NSInteger section);
@property (nonatomic, strong) void (^willBeginEditingRowAtIndexPathBlock)(UITableView *tableView, NSIndexPath *indexPath);
@property (nonatomic, strong) NSIndexPath * (^willDeselectRowAtIndexPathBlock)(UITableView *tableView, NSIndexPath *indexPath);
@property (nonatomic, strong) void (^willDisplayCellForRowAtIndexPathBlock)(UITableView *tableView, UITableViewCell *cell, NSIndexPath *indexPath);
@property (nonatomic, strong) NSIndexPath * (^willSelectRowAtIndexPathBlock)(UITableView *tableView, NSIndexPath *indexPath);

@end

