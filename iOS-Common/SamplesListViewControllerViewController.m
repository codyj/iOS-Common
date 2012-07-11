//
//  SamplesListViewControllerViewController.m
//  iOS-Common
//
//  Created by Cody Jorgensen on 7/11/12.
//  Copyright (c) 2012 Swingfire LLC. All rights reserved.
//

#import "SamplesListViewControllerViewController.h"

@interface SamplesListViewControllerViewController ()

@property (nonatomic, strong) NSArray *samples;

@end

@implementation SamplesListViewControllerViewController

@synthesize samples;

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Samples";
    
    self.samples = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"sample_list" ofType:@"plist"]];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.samples.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.textLabel.text = [[self.samples objectAtIndex:indexPath.row] objectForKey:@"name"];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *viewControllerClassName = [[self.samples objectAtIndex:indexPath.row] objectForKey:@"viewcontroller"];
    Class viewControllerClass = NSClassFromString(viewControllerClassName);
    if (viewControllerClass) {
        UIViewController *detailViewController = [[viewControllerClass alloc] init];
        [self.navigationController pushViewController:detailViewController animated:YES];
    }
    else {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        NSLog(@"Failed to load view controller: %@", viewControllerClassName);
    }
}

@end
