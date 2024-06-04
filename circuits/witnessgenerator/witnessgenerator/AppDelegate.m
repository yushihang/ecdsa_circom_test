//
//  AppDelegate.m
//  witnessgenerator
//
//  Created by yushihang on 2024/6/4.
//

#import "AppDelegate.h"
#import "work.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Assume you have a bundle named "MyBundle" and a file named "myFile.txt"
    NSString *bundlePath = [[NSBundle mainBundle] bundlePath];
    NSString *datPath = [[NSBundle mainBundle] pathForResource:@"multiplier2" ofType:@"dat" inDirectory:nil];
    
    if (datPath) {
        NSLog(@"datPath found at: %@", datPath);
    } else {
        NSLog(@"datPath not found");
    }
    
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"input" ofType:@"json" inDirectory:nil];
    
    if (jsonPath) {
        NSLog(@"jsonPath found at: %@", jsonPath);
    } else {
        NSLog(@"jsonPath not found");
    }
    
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    
    // Create a file path in the Documents directory
    NSString *witnessPath = [documentsDirectory stringByAppendingPathComponent:@"witness.wtns"];
    
    NSLog(@"witness.wtns path: %@", witnessPath);
    NSDate *startDate =  [NSDate date];
    

    calcwitness(datPath.UTF8String, jsonPath.UTF8String, witnessPath.UTF8String);
    
    NSDate *stopDate = [NSDate date];
    
    // Calculate the execution time
    NSTimeInterval executionTime = [stopDate timeIntervalSinceDate:startDate];
    
    NSLog(@"Execution time: %f seconds", executionTime);
    
    // Override point for customization after application launch.
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
