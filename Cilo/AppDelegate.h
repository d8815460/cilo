//
//  AppDelegate.h
//  Cilo
//
//  Created by 駿逸 陳 on 2015/8/19.
//  Copyright (c) 2015年 駿逸 陳. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+ (AppDelegate *)sharedDelegate;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

//轉場至首頁
- (void)presentToHomePage;

//轉場至登入畫面
- (void)presentToLoginPage;

//轉場至發布約
- (void)presentToManPostPage;

@end

