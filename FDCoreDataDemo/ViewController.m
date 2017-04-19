//
//  ViewController.m
//  FDCoreDataDemo
//
//  Created by 伏董 on 2017/4/17.
//  Copyright © 2017年 伏董. All rights reserved.
//

#import "ViewController.h"
#import <CoreData/CoreData.h>
#import "Person+CoreDataClass.h"
#import "Person+CoreDataProperties.h"
#import "AppDelegate.h"

@interface ViewController (){
    
    AppDelegate *app;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
}

- (IBAction)addAction:(id)sender {
    //增
    Person *person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:app.persistentContainer.viewContext];
    person.name = [NSString stringWithFormat:@"jack%d",arc4random()%10];
    person.sex = @"man";
    person.age = 20;
    
    NSLog(@"person %@",person.name);
    
    [app.persistentContainer.viewContext save:nil];
    
}

- (IBAction)deleteAction:(id)sender {
    //删
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:app.persistentContainer.viewContext];
    
    //简历请求
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    
    //建立检索条件
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name=%@",@"jack5"];
    [request setPredicate:predicate];
    
    NSArray *array = (NSArray *)[app.persistentContainer.viewContext executeFetchRequest:request error:nil];
    if (array.count) {
        
        for (Person *person in array) {
            [app.persistentContainer.viewContext deleteObject:person];
        }
        
        [app.persistentContainer.viewContext save:nil];
        
        NSLog(@"删除成功");
        
        
    }else{
    
        NSLog(@"无满足条件");
    }
    
}


- (IBAction)updateAction:(id)sender {
    //改
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:app.persistentContainer.viewContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name=%@",@"jack2"];
    [request setPredicate:predicate];
    
    NSArray *array = (NSArray *)[app.persistentContainer.viewContext executeFetchRequest:request error:nil];
    
    if (array.count) {
        
        for (Person *person in array) {
            
            person.name = @"hello";
        }
        
        [app.persistentContainer.viewContext save:nil];
        NSLog(@"修改完成");
        
    }else{
    
        NSLog(@"暂无该记录");
    }

}

- (IBAction)selectAction:(id)sender {
    //查
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:app.persistentContainer.viewContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    
    NSArray *array = [app.persistentContainer.viewContext executeFetchRequest:request error:nil];
    
    if (array.count) {
        
        for (Person *person in array) {
            
            NSLog(@"person cha %@",person.name);
        }

    }else{
        
        NSLog(@"暂无该记录");
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
