//
//  AppDelegate.h
//  FDCoreDataDemo
//
//  Created by 伏董 on 2017/4/17.
//  Copyright © 2017年 伏董. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

