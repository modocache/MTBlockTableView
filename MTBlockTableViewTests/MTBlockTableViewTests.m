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

#pragma mark - UITableViewDataSource Protocol Method Tests

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


#pragma mark - UITableViewDelegate Protocol Method Tests

- (void)testAccessoryButtonTappedForRowWithIndexPathBlock {
    __block NSInteger i = 0;
    _tableView.accessoryButtonTappedForRowWithIndexPathBlock = ^(UITableView *tableView, NSIndexPath *indexPath) {
        i++;
    };

    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [_tableView.delegate tableView:_tableView accessoryButtonTappedForRowWithIndexPath:indexPath];

    STAssertEquals(i, 1, nil);
}

- (void)testCanPerformActionForRowAtIndexPathWithSenderBlock {
    _tableView.canPerformActionForRowAtIndexPathWithSenderBlock = ^BOOL(UITableView *tableView, SEL action, NSIndexPath *indexPath, id sender) {
        if (indexPath.row == 0) {
            return NO;
        } else {
            return YES;
        }
    };

    STAssertFalse([_tableView.delegate tableView:_tableView
                                canPerformAction:nil
                               forRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]
                                      withSender:nil], nil);
    STAssertTrue([_tableView.delegate tableView:_tableView
                               canPerformAction:nil
                              forRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]
                                     withSender:nil], nil);
}

- (void)testDidDeselectRowAtIndexPathBlock {
    __block NSInteger i = 0;
    _tableView.didDeselectRowAtIndexPathBlock = ^(UITableView *tableView, NSIndexPath *indexPath) {
        i++;
    };

    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [_tableView.delegate tableView:_tableView didDeselectRowAtIndexPath:indexPath];

    STAssertEquals(i, 1, nil);
}

- (void)testDidEndEditingRowAtIndexPathBlock {
    __block NSInteger i = 0;
    _tableView.didEndEditingRowAtIndexPathBlock = ^(UITableView *tableView, NSIndexPath *indexPath) {
        i++;
    };

    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [_tableView.delegate tableView:_tableView didEndEditingRowAtIndexPath:indexPath];

    STAssertEquals(i, 1, nil);
}

- (void)testDidSelectRowAtIndexPathBlock {
    __block NSInteger i = 0;
    _tableView.didSelectRowAtIndexPathBlock = ^(UITableView *tableView, NSIndexPath *indexPath) {
        i++;
    };

    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [_tableView.delegate tableView:_tableView didSelectRowAtIndexPath:indexPath];

    STAssertEquals(i, 1, nil);
}

- (void)testEditingStyleForRowAtIndexPathBlock {
    _tableView.editingStyleForRowAtIndexPathBlock = ^UITableViewCellEditingStyle(UITableView *tableView, NSIndexPath *indexPath) {
        if (indexPath.row == 0) {
            return UITableViewCellEditingStyleDelete;
        } else {
            return UITableViewCellEditingStyleInsert;
        }
    };

    STAssertEquals([_tableView.delegate tableView:_tableView editingStyleForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]],
                   UITableViewCellEditingStyleDelete,
                   nil);
    STAssertEquals([_tableView.delegate tableView:_tableView editingStyleForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]],
                   UITableViewCellEditingStyleInsert,
                   nil);
}

- (void)testHeightForFooterInSectionBlock {
    _tableView.heightForFooterInSectionBlock = ^CGFloat(UITableView *tableView, NSInteger section) {
        return 15.0f;
    };

    STAssertEquals([_tableView.delegate tableView:_tableView heightForFooterInSection:0], 15.0f, nil);
}

- (void)testHeightForHeaderInSectionBlock {
    _tableView.heightForHeaderInSectionBlock = ^CGFloat(UITableView *tableView, NSInteger section) {
        return 30.0f;
    };

    STAssertEquals([_tableView.delegate tableView:_tableView heightForHeaderInSection:0], 30.0f, nil);
}

- (void)testHeightForRowAtIndexPath {
    _tableView.heightForRowAtIndexPathBlock = ^CGFloat(UITableView *tableView, NSIndexPath *indexPath) {
        return 10.0f;
    };

    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    STAssertEquals([_tableView.delegate tableView:_tableView heightForRowAtIndexPath:indexPath], 10.0f, nil);
}

- (void)testIndentationLevelForRowAtIndexPathBlock {
    _tableView.indentationLevelForRowAtIndexPathBlock = ^NSInteger(UITableView *tableView, NSIndexPath *indexPath) {
        return 20;
    };

    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    NSInteger indentation = [_tableView.delegate tableView:_tableView
                         indentationLevelForRowAtIndexPath:indexPath];
    STAssertEquals(indentation, 20, nil);
}

- (void)testPerformActionForRowAtIndexPathWithSenderBlock {
    __block NSInteger i = 0;
    _tableView.performActionForRowAtIndexPathWithSenderBlock = ^(UITableView *tableView, SEL action, NSIndexPath *indexPath, id sender) {
        i++;
    };

    [_tableView.delegate tableView:_tableView performAction:nil forRowAtIndexPath:nil withSender:nil];
    STAssertEquals(i, 1, nil);
}

- (void)testShouldIndentWhileEditingRowAtIndexPathBlock {
    _tableView.shouldIndentWhileEditingRowAtIndexPathBlock = ^BOOL(UITableView *tableView, NSIndexPath *indexPath) {
        if (indexPath.row == 0) {
            return NO;
        } else {
            return YES;
        }
    };

    STAssertFalse([_tableView.delegate tableView:_tableView
          shouldIndentWhileEditingRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]],
                  nil);
    STAssertTrue([_tableView.delegate tableView:_tableView
         shouldIndentWhileEditingRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]],
                 nil);
}

- (void)testShouldShowMenuForRowAtIndexPathBlock {
    _tableView.shouldShowMenuForRowAtIndexPathBlock = ^BOOL(UITableView *tableView, NSIndexPath *indexPath) {
        if (indexPath.row == 0) {
            return NO;
        } else {
            return YES;
        }
    };

    STAssertFalse([_tableView.delegate tableView:_tableView
                 shouldShowMenuForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]],
                  nil);
    STAssertTrue([_tableView.delegate tableView:_tableView
                shouldShowMenuForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]],
                 nil);
}

- (void)testTargetIndexPathForMoveFromRowAtIndexPathToProposedIndexPath {
    NSIndexPath *indexPath = [_tableView.delegate tableView:_tableView
                   targetIndexPathForMoveFromRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]
                                        toProposedIndexPath:[NSIndexPath indexPathForRow:1 inSection:1]];

    STAssertEqualObjects(indexPath, [NSIndexPath indexPathForRow:1 inSection:1], nil);

    _tableView.targetIndexPathForMoveFromRowAtIndexPathToProposedIndexPathBlock = ^NSIndexPath *(UITableView *tableView, NSIndexPath *sourceIndexPath, NSIndexPath *proposedDestinationIndexPath) {
        return [NSIndexPath indexPathForRow:0 inSection:0];
    };

    indexPath = [_tableView.delegate tableView:_tableView
      targetIndexPathForMoveFromRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]
                           toProposedIndexPath:[NSIndexPath indexPathForRow:1 inSection:1]];

    STAssertEqualObjects(indexPath, [NSIndexPath indexPathForRow:0 inSection:0], nil);
}

- (void)testTitleForDeleteConfirmationButtonForRowAtIndexPathBlock {
    _tableView.titleForDeleteConfirmationButtonForRowAtIndexPathBlock = ^NSString *(UITableView *tableView, NSIndexPath *indexPath) {
        if (indexPath.row == 0) {
            return @"Hey Dawg";
        } else {
            return @"I heard you like blocks";
        }
    };

    STAssertEqualObjects(@"Hey Dawg",
                         [_tableView.delegate tableView:_tableView
      titleForDeleteConfirmationButtonForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]],
                         nil);

    STAssertEqualObjects(@"I heard you like blocks",
                         [_tableView.delegate tableView:_tableView
      titleForDeleteConfirmationButtonForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:1]],
                         nil);
}

- (void)testViewForFooterInSectionBlock {
    _tableView.viewForFooterInSectionBlock = ^UIView *(UITableView *tableView, NSInteger section) {
        return [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    };

    UIView *view = [_tableView.delegate tableView:_tableView viewForFooterInSection:0];
    STAssertEquals(view.frame.size.height, 10.0f, nil);
}

- (void)testViewForHeaderInSectionBlock {
    _tableView.viewForHeaderInSectionBlock = ^UIView *(UITableView *tableView, NSInteger section) {
        return [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    };

    UIView *view = [_tableView.delegate tableView:_tableView viewForHeaderInSection:0];
    STAssertEquals(view.frame.size.height, 20.0f, nil);
}

- (void)testWillBeginEditingRowAtIndexPath {
    __block NSInteger i = 0;
    _tableView.willBeginEditingRowAtIndexPathBlock = ^(UITableView *tableView, NSIndexPath *indexPath) {
        i++;
    };
    [_tableView.delegate tableView:_tableView willBeginEditingRowAtIndexPath:nil];

    STAssertEquals(i, 1, nil);
}

- (void)testWillDeselectRowAtIndexPath {
    _tableView.willDeselectRowAtIndexPathBlock = ^NSIndexPath *(UITableView *tableView, NSIndexPath *indexPath) {
        return [NSIndexPath indexPathForRow:0 inSection:0];
    };

    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:1 inSection:1];
    STAssertEqualObjects([_tableView.delegate tableView:_tableView willDeselectRowAtIndexPath:indexPath],
                         [NSIndexPath indexPathForRow:0 inSection:0],
                         nil);
}

- (void)testWillDisplayCellForRowAtIndexPathBlock {
    __block NSInteger i = 0;
    _tableView.willDisplayCellForRowAtIndexPathBlock = ^(UITableView *tableView, UITableViewCell *cell, NSIndexPath *indexPath) {
        i++;
    };

    [_tableView.delegate tableView:_tableView willDisplayCell:nil forRowAtIndexPath:nil];
    STAssertEquals(i, 1, nil);
}

- (void)testWillSelectRowAtIndexPathBlock {
    _tableView.willSelectRowAtIndexPathBlock = ^NSIndexPath *(UITableView *tableView, NSIndexPath *indexPath) {
        return [NSIndexPath indexPathForRow:10 inSection:10];
    };

    [_tableView.delegate tableView:_tableView willDisplayCell:nil forRowAtIndexPath:nil];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:1 inSection:1];
    STAssertEqualObjects([_tableView.delegate tableView:_tableView willSelectRowAtIndexPath:indexPath],
                         [NSIndexPath indexPathForRow:10 inSection:10],
                         nil);
}

@end
