//
//  AddNewTodoViewController.m
//  EveryDoItAgain
//
//  Created by Chris Jones on 2017-02-01.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import "AddNewTodoViewController.h"
#import "ToDo+CoreDataClass.h"
#import "AppDelegate.h"

@interface AddNewTodoViewController ()
@property (weak, nonatomic) IBOutlet UITextField *todoTitle;
@property (weak, nonatomic) IBOutlet UITextView *todoDescription;
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;



@property (strong, nonatomic) NSMutableArray <ToDo *> *todosArray;
@property (strong, nonatomic) AppDelegate *delegate;

@end

@implementation AddNewTodoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.todosArray = [NSMutableArray new];
    self.priorityLabel.text = @"0";
    self.delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)saveNewTodo:(UIBarButtonItem *)sender {

        ToDo *newTodo = [NSEntityDescription insertNewObjectForEntityForName:@"ToDo" inManagedObjectContext:self.context];
        newTodo.title = self.todoTitle.text;
        newTodo.todoDescription = self.todoDescription.text;
        newTodo.isCompleted = NO;
        newTodo.priorityNumber = [self.priorityLabel.text intValue];
        [self.todosArray addObject:newTodo];
        [self.delegate saveContext];
        
        [self.todoTitle resignFirstResponder];
        [self.todoDescription resignFirstResponder];

}
- (IBAction)priorityStepper:(UIStepper *)sender {
    self.priorityLabel.text = @(sender.value).stringValue;
}


@end
