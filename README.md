MTBlockTableView
================

An iOS Table View that uses block-based delegation instead of protocols.

Installation
============

1. Preferred way is CocoaPods, (not available quite yet).
2. Copy `MTBlockTableView.h` and `MTBlockTableView.m` into your project from the `MTBlockTableView` target

Usage
=====

`MTBlockTableView` is an experimental, drop-in replacement for `UITableView` which uses blocks for all protocol methods:

```
- (void)viewDidLoad
{
    [super viewDidLoad];

    [_tableView setNumberOfRowsInSectionBlock:^NSInteger(UITableView *tableView, NSInteger section) {
        return 10;
    }];
    
    [_tableView setCellForRowAtIndexPathBlock:^UITableViewCell *(UITableView *tableView, NSIndexPath *indexPath) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        
        cell.textLabel.text = [@(indexPath.row) stringValue];
        
        return cell;
    }];
}
```

Discussion
==========

The motivation for this library is a proof-of-concept that delegation through protocols could be replaced by delegation through blocks, and in many circumstances would be much move expressive and convenient for programmers. See [this blog post](http://mysteriousdevs.tumblr.com/post/29415817039/blocks-a-case-against-protocol-delegation) for more thorough examples.

Limitations
===========

* The `UITableViewDelegate` methods are not yet implemented, only the `UITableViewDataSource` methods.

To-dos
======

1. Finish `UITableViewDelegate` implementation and testing.

Contributing
============

Be sure to run the tests in the `MTBlockTableViewTests` target before submitting pull requests.