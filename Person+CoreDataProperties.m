//
//  Person+CoreDataProperties.m
//  FDCoreDataDemo
//
//  Created by 伏董 on 2017/4/19.
//  Copyright © 2017年 伏董. All rights reserved.
//

#import "Person+CoreDataProperties.h"

@implementation Person (CoreDataProperties)

+ (NSFetchRequest<Person *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Person"];
}

@dynamic age;
@dynamic name;
@dynamic sex;

@end
