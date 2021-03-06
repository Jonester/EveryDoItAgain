//
//  AddNewTodoViewController.h
//  EveryDoItAgain
//
//  Created by Chris Jones on 2017-02-01.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EveryDoItAgain+CoreDataModel.h"
#import "ToDo+CoreDataClass.h"
#import "DetailViewController.h"

@interface AddNewTodoViewController : UIViewController

@property (strong, nonatomic) NSManagedObjectContext *todoContext;
@property (strong, nonatomic) ToDo *todo;

-(void)displayTodo:(ToDo *)existingTodo;

@end
