//
//  DynamicTableViewController.m
//  iOSJuniorApplication
//
//  Created by Jenei Viktor on 05/03/14.
//  Copyright (c) 2014 victo. All rights reserved.
//

#import "DynamicTableViewController.h"
#import "CustomUITableViewCell.h"

@interface DynamicTableViewController ()

@property (strong, nonatomic) NSArray * firstSectionItems;
@property (strong, nonatomic) NSArray * secondSectionItems;

@end

@implementation DynamicTableViewController

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _firstSectionItems = @[@"First", @"Second", @"Third"];
        _secondSectionItems = @[@"I.", @"II.", @"III."];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView * headerView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.tableView.frame.size.width, 44.0f)];
    headerView.backgroundColor = [UIColor darkGrayColor];
    self.tableView.tableHeaderView = headerView;
}

#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSInteger sectionCount = 0;
    sectionCount = [_firstSectionItems count] ? sectionCount + 1 : sectionCount;
    sectionCount = [_secondSectionItems count] ? sectionCount + 1 : sectionCount;
    return sectionCount;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger sectionItemsCount = 0;
    switch (section) {
        case 0:
            sectionItemsCount = [_firstSectionItems count];
            break;
        case 1:
            sectionItemsCount = [_secondSectionItems count];
            break;
    }
    return sectionItemsCount;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString * sectionHeaderTitle = nil;
    switch (section) {
        case 0:
            sectionHeaderTitle = @"First Section Header";
            break;
        case 1:
            sectionHeaderTitle = @"Second Section Header";
            break;
    }
    return sectionHeaderTitle;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"CustomCell#1";
    CustomUITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    NSInteger sectionIndex = indexPath.section;
    NSInteger cellIndex = indexPath.row;
    
    NSString * cellTitleString = @"";
    
    NSArray * sectionItems = sectionIndex < 1 ? _firstSectionItems : _secondSectionItems;
    cellTitleString = [sectionItems objectAtIndex:cellIndex];
    
    if (cellTitleString) {
        cell.cellTextLabel.text = cellTitleString;
        if (indexPath.row % 2 == 0) {
            cell.cellBackgroundImage.image = [UIImage imageNamed:@"cell_bg_light_red"];
        }
        else {
            cell.cellBackgroundImage.image = [UIImage imageNamed:@"cell_bg_light"];
        }
    }
    
    return cell;
}

#pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Row #%ld was selected from section #%ld", (long)indexPath.row, (long)indexPath.section);
}

/*
// Override to change the label of the delete button
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"BikMakk";
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath.section == 0 ? YES : NO;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        // [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

@end
