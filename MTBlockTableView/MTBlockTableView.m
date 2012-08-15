//
//  MTBlockTableView.m
//  MTTableViewController
//
//  Created by Parker Wightman on 8/10/12.
//  Copyright (c) 2012 Mysterious Trousers. All rights reserved.
//

#import "MTBlockTableView.h"

@implementation MTBlockTableView

- (id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.delegate = self;
        self.dataSource = self;
    }
    
    return self;
}

- (void) awakeFromNib {
    [super awakeFromNib];
    self.delegate = self;
    self.dataSource = self;
}




#pragma mark UITableViewDataSource Methods (required)



- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_numberOfRowsInSectionBlock) {
        return _numberOfRowsInSectionBlock(tableView, section);
    }
    
    @throw [NSException exceptionWithName:@"Unimplemented Block Method" reason:@"You must assign a block to the numberOfRowInSectionBlock property of MTBlockTableViews" userInfo:@{}];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_cellForRowAtIndexPathBlock) {
        return _cellForRowAtIndexPathBlock(tableView, indexPath);
    }
    
    @throw [NSException exceptionWithName:@"Unimplemented Block Method" reason:@"You must assign a block to the cellForRowAtIndexPathBlock property of MTBlockTableViews" userInfo:@{}];
    

}




#pragma mark - UITableViewDelegate Methods (required)

- (void) tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    if (_accessoryButtonTappedForRowWithIndexPathBlock) {
        _accessoryButtonTappedForRowWithIndexPathBlock(tableView, indexPath);
    }
}

- (BOOL) tableView:(UITableView *)tableView canPerformAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
    if (_canPerformActionForRowAtIndexPathWithSenderBlock) {
        return _canPerformActionForRowAtIndexPathWithSenderBlock(tableView, action, indexPath, sender);
    }

    return NO;
}

- (void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_didDeselectRowAtIndexPathBlock) {
        _didDeselectRowAtIndexPathBlock(tableView, indexPath);
    }
}

- (void) tableView:(UITableView *)tableView didEndEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_didEndEditingRowAtIndexPathBlock) {
        _didEndEditingRowAtIndexPathBlock(tableView, indexPath);
    }
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_didSelectRowAtIndexPathBlock) {
        _didSelectRowAtIndexPathBlock(tableView, indexPath);
    }
}

- (UITableViewCellEditingStyle) tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_editingStyleForRowAtIndexPathBlock) {
        return _editingStyleForRowAtIndexPathBlock(tableView, indexPath);
    }

    return UITableViewCellEditingStyleNone;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (_heightForFooterInSectionBlock) {
        return _heightForFooterInSectionBlock(tableView, section);
    }

    return [self tableView:self viewForHeaderInSection:section].frame.size.height;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (_heightForHeaderInSectionBlock) {
        return _heightForHeaderInSectionBlock(tableView, section);
    }

    return [self tableView:self viewForFooterInSection:section].frame.size.height;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_heightForRowAtIndexPathBlock) {
        return _heightForRowAtIndexPathBlock(tableView, indexPath);
    }

    return [self.dataSource tableView:self cellForRowAtIndexPath:indexPath].frame.size.height;
}

- (NSInteger) tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_indentationLevelForRowAtIndexPathBlock) {
        return _indentationLevelForRowAtIndexPathBlock(tableView, indexPath);
    }

    return [self.dataSource tableView:self cellForRowAtIndexPath:indexPath].indentationLevel;
}

- (void) tableView:(UITableView *)tableView performAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
    if (_performActionForRowAtIndexPathWithSenderBlock) {
        _performActionForRowAtIndexPathWithSenderBlock(tableView, action, indexPath, sender);
    }
}

- (BOOL) tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_shouldIndentWhileEditingRowAtIndexPathBlock) {
        return _shouldIndentWhileEditingRowAtIndexPathBlock(tableView, indexPath);
    }

    return YES;
}

- (BOOL) tableView:(UITableView *)tableView shouldShowMenuForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_shouldShowMenuForRowAtIndexPathBlock) {
        return _shouldShowMenuForRowAtIndexPathBlock(tableView, indexPath);
    }

    return NO;
}

- (NSIndexPath *) tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath {
    if (_targetIndexPathForMoveFromRowAtIndexPathToProposedIndexPathBlock) {
        return _targetIndexPathForMoveFromRowAtIndexPathToProposedIndexPathBlock(tableView, sourceIndexPath, proposedDestinationIndexPath);
    }

    return proposedDestinationIndexPath;
}

- (NSString *) tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_titleForDeleteConfirmationButtonForRowAtIndexPathBlock) {
        return _titleForDeleteConfirmationButtonForRowAtIndexPathBlock(tableView, indexPath);
    }

    return nil;
}

- (UIView *) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (_viewForFooterInSectionBlock) {
        return _viewForFooterInSectionBlock(tableView, section);
    }

    return nil;
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (_viewForHeaderInSectionBlock) {
        return _viewForHeaderInSectionBlock(tableView, section);
    }

    return nil;
}

- (void) tableView:(UITableView *)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_willBeginEditingRowAtIndexPathBlock) {
        _willBeginEditingRowAtIndexPathBlock(tableView, indexPath);
    }
}

- (NSIndexPath *) tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_willDeselectRowAtIndexPathBlock) {
        return _willDeselectRowAtIndexPathBlock(tableView, indexPath);
    }

    return indexPath;
}

- (void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_willDisplayCellForRowAtIndexPathBlock) {
        _willDisplayCellForRowAtIndexPathBlock(tableView, cell, indexPath);
    }
}

- (NSIndexPath *) tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_willSelectRowAtIndexPathBlock) {
        return _willSelectRowAtIndexPathBlock(tableView, indexPath);
    }

    return indexPath;
}




#pragma mark UITableViewDataSource Methods (optional)



- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    if (_numberOfSectionsInTableViewBlock) {
        return _numberOfSectionsInTableViewBlock(tableView);
    }
    
    return 1;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (_titleForHeaderInSectionBlock) {
        return _titleForHeaderInSectionBlock(tableView, section);
    }
    
    return nil;
}

- (NSString *) tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    if (_titleForFooterInSectionBlock) {
        return _titleForFooterInSectionBlock(tableView, section);
    }
    
    return nil;
}

- (BOOL) tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_canEditRowAtIndexPathBlock) {
        return _canEditRowAtIndexPathBlock(tableView, indexPath);
    }
    
    return NO;
}

- (BOOL) tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_canMoveRowAtIndexPathBlock) {
        return _canMoveRowAtIndexPathBlock(tableView, indexPath);
    }
    
    return NO;
}

- (NSArray *) sectionIndexTitlesForTableView:(UITableView *)tableView {
    if (_sectionIndexTitlesBlock) {
        return _sectionIndexTitlesBlock(tableView);
    }
    
    return nil;
}

- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_commitEditingStyleForRowAtIndexPathBlock) {
        _commitEditingStyleForRowAtIndexPathBlock(tableView, editingStyle, indexPath);
    }
}

- (void) tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    if (_moveRowAtIndexPathToIndexPathBlock) {
        _moveRowAtIndexPathToIndexPathBlock(tableView, sourceIndexPath, destinationIndexPath);
    }
}

- (NSInteger) tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    if (_sectionForSectionIndexTitleAtIndex) {
        _sectionForSectionIndexTitleAtIndex(tableView, title, index);
    }
    
    return 0;
}

@end
