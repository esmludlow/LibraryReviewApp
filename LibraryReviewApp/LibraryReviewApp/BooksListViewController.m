//
//  ViewController.m
//  LibraryReviewApp
//
//  Created by Rutan on 8/24/15.
//  Copyright (c) 2015 Eric Ludlow. All rights reserved.
//

#import "BooksListViewController.h"
#import "Book.h"
#import "BookController.h"
#import "BookDetailViewController.h"

@interface BooksListViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation BooksListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"bookCellSelected"]) {
        
        UITableViewCell *cellSelected = sender;
        
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cellSelected];
        
        Book *book = [BookController sharedInstance].books[indexPath.row];
        
        BookDetailViewController *destinationBookDetailVC = segue.destinationViewController;
        
        destinationBookDetailVC.book = book;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
