//
//  MTBlockTableViewTests.m
//  MTBlockTableViewTests
//
//  Created by Parker Wightman on 8/11/12.
//  Copyright (c) 2012 Mysterious Trousers. All rights reserved.
//

#import "MTBlockTableViewTests.h"


@implementation MTBlockTableViewTests

- (void)setUp
{
    [super setUp];
    
    _tableView = [[MTBlockTableView alloc] initWithFrame:CGRectZero];

}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testNumberOfSectionsInTableViewBlock
{
    [_tableView setNumberOfSectionsInTableViewBlock:^NSInteger(UITableView *tableView) {
        return 10;
    }];
    
    STAssertEquals([_tableView.dataSource numberOfSectionsInTableView:_tableView], 10, nil);
}

- (void)testNumberOfRowsInSectionBlock
{
    [_tableView setNumberOfSectionsInTableViewBlock:^NSInteger(UITableView *tableView) {
        return 2;
    }];
    
    [_tableView setNumberOfRowsInSectionBlock:^NSInteger(UITableView *tableView, NSInteger section) {
        return (section == 0 ? 2 : 1);
    }];
    
    STAssertEquals([_tableView.dataSource tableView:_tableView numberOfRowsInSection:0], 2, nil);
    STAssertEquals([_tableView.dataSource tableView:_tableView numberOfRowsInSection:1], 1, nil);
}

- (void)testCellForRowAtIndexPathBlock {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithFrame:CGRectZero];
    
    [_tableView setCellForRowAtIndexPathBlock:^UITableViewCell *(UITableView *tableView, NSIndexPath *indexPath) {
        if (indexPath.section == 1 && indexPath.row == 2) {
            return cell;
        }

        return nil;
    }];
    
    STAssertEquals([_tableView.dataSource tableView:_tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:1]], cell, nil);
}

- (void)testTitleForHeaderInSectionBlock {
    STAssertEqualObjects([_tableView.dataSource tableView:_tableView titleForHeaderInSection:3], nil, nil);
    
    NSString *title = @"Foobar";
    
    [_tableView setTitleForHeaderInSectionBlock:^NSString *(UITableView *tableView, NSInteger section) {
        if (section == 3) {
            return title;
        }
        return nil;
    }];
    
    STAssertEquals([_tableView.dataSource tableView:_tableView titleForHeaderInSection:3], title, nil);
}

- (void)testTitleForFooterInSectionBlock {
    STAssertEqualObjects([_tableView.dataSource tableView:_tableView titleForFooterInSection:3], nil, nil);
    
    NSString *title = @"Foobar";
    
    [_tableView setTitleForFooterInSectionBlock:^NSString *(UITableView *tableView, NSInteger section) {
        if (section == 3) {
            return title;
        }
        return nil;
    }];
    
    STAssertEquals([_tableView.dataSource tableView:_tableView titleForFooterInSection:3], title, nil);
}

- (void)testCanEditRowAtIndexPath {
    STAssertEquals([_tableView.dataSource tableView:_tableView canEditRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:1]], NO, nil);
    
    [_tableView setCanEditRowAtIndexPathBlock:^BOOL(UITableView *tableView, NSIndexPath *indexPath) {
        if (indexPath.row == 1 && indexPath.section == 1){
            return YES;
        }
        
        return NO;

    }];
    
    STAssertEquals([_tableView.dataSource tableView:_tableView canEditRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:1]], YES, nil);
}

- (void)testCanMoveRowAtIndexPath {
    STAssertEquals([_tableView.dataSource tableView:_tableView canMoveRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:1]], NO, nil);
    
    [_tableView setCanMoveRowAtIndexPathBlock:^BOOL(UITableView *tableView, NSIndexPath *indexPath) {
        if (indexPath.row == 1 && indexPath.section == 1){
            return YES;
        }
        
        return NO;
        
    }];
    
    STAssertEquals([_tableView.dataSource tableView:_tableView canMoveRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:1]], YES, nil);
}

- (void)testSectionIndexTitlesBlock {
    STAssertEqualObjects([_tableView.dataSource sectionIndexTitlesForTableView:_tableView], nil, nil);
    
    NSArray *indexes = @[ ];
    
    [_tableView setSectionIndexTitlesBlock:^NSArray *(UITableView *tableView) {
        return indexes;
    }];
    
    STAssertEqualObjects([_tableView.dataSource sectionIndexTitlesForTableView:_tableView], indexes, nil);
}

- (void)testCommitEditingStyleForRowAtIndexPathBlock {
    
}

@end
