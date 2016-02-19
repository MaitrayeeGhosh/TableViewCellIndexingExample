//
//  ViewController.m
//  TableViewCellIndexingExample
//
//  Created by Maitrayee Ghosh on 20/02/16.
//  Copyright © 2016 Maitrayee Ghosh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    tableDataArray = [[NSArray alloc]initWithObjects:
                      @"Ant",
                      @"African lion",
                      @"Bear",
                      @"Black Swan",
                      @"Buffalo",
                      @"Camel",
                      @"Cockatoo",
                      @"Dog",
                      @"Donkey",
                      @"Emu",
                      @"Giraffe",
                      @"Greater Rhea",
                      @"Hippopotamus",
                      @"Horse",
                      @"Koala",
                      @"Lion",
                      @"Llama",
                      @"Manatus",
                      @"Meerkat",
                      @"Panda",
                      @"Peacock",
                      @"Pig",
                      @"Platypus",
                      @"Polar Bear",
                      @"Rhinoceros",
                      @"Seagull",
                      @"Tasmania Devil",
                      @"Whale",
                      @"Whale Shark",
                      @"Wombat",
                      nil];
    
    sectionDataArray=[[NSArray alloc] initWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"K",@"L",@"M",@"P",@"R",@"S",@"T",@"W", nil];
    
    self.mTableView.delegate=(id)self;
    self.mTableView.dataSource=(id)self;
    
}

#pragma mark - UITableView Delegate and DataSource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [sectionDataArray count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [sectionDataArray objectAtIndex:section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSPredicate *predicate =[NSPredicate predicateWithFormat:@"SELF beginswith[c] %@", [sectionDataArray objectAtIndex:section]];
    
   NSArray *tempArray = [tableDataArray filteredArrayUsingPredicate:predicate];
   
    return [tempArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    NSPredicate *predicate =[NSPredicate predicateWithFormat:@"SELF beginswith[c] %@", [sectionDataArray objectAtIndex:indexPath.section]];
    
    NSArray *tempArray = [tableDataArray filteredArrayUsingPredicate:predicate];
    cell.textLabel.text = [tempArray objectAtIndex:indexPath.row];
    return cell;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return sectionDataArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
