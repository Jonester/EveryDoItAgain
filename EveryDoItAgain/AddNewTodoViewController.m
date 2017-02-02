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
@property (weak, nonatomic) IBOutlet UIStepper *priorityStepper;

@property (strong, nonatomic) NSMutableArray <ToDo *> *todosArray;
@property (strong, nonatomic) AppDelegate *delegate;

@end

@implementation AddNewTodoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.todosArray = [NSMutableArray new];
    
    [self displayTodo:self.todo];
    
//    if (self.todoContext != nil) {
//        self.todoTitle.text = self.todo.title;
//        self.todoDescription.text = self.todo.todoDescription;
//        self.priorityLabel.text = @(self.todo.priorityNumber).stringValue;
//    } else
        
//        self.delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    self.priorityLabel.text = @"0";
    self.priorityStepper.value = [self.priorityLabel.text integerValue];
//    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)priorityStepper:(UIStepper *)sender {
    self.priorityLabel.text = @(sender.value).stringValue;
}

- (IBAction)saveButton:(UIButton *)sender {
    if (self.todoTitle != nil) {
        
        self.todo.title = self.todoTitle.text;
        self.todo.todoDescription = self.todoDescription.text;
        self.todo.isCompleted = NO;
        self.todo.priorityNumber = [self.priorityLabel.text intValue];
    
    [self.todoTitle resignFirstResponder];
    [self.todoDescription resignFirstResponder];

    [self dismissViewControllerAnimated:YES completion:nil];
    }
}

-(void)displayTodo:(ToDo *)existingTodo {
    self.todoTitle.text = existingTodo.title;
    self.todoDescription.text = existingTodo.todoDescription;
    self.priorityLabel.text = @(existingTodo.priorityNumber).stringValue;
}


@end
