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
