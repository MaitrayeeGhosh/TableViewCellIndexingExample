//
//  ViewController.h
//  TableViewCellIndexingExample
//
//  Created by Maitrayee Ghosh on 20/02/16.
//  Copyright © 2016 Maitrayee Ghosh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *sectionDataArray;
    NSArray *tableDataArray;
}
@property (weak, nonatomic) IBOutlet UITableView *mTableView;

@end

