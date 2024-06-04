//
//  AppDelegate.m
//  prover
//
//  Created by yushihang on 2024/6/4.
//

#import "AppDelegate.h"
#import "prover.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSString *bundlePath = [[NSBundle mainBundle] bundlePath];
    NSString *zkeyPath = [[NSBundle mainBundle] pathForResource:@"multiplier2_0001" ofType:@"zkey" inDirectory:nil];
    
    if (zkeyPath) {
        NSLog(@"zkeyPath found at: %@", zkeyPath);
    } else {
        NSLog(@"zkeyPath not found");
    }
    
    NSData *zkeyData = [NSData dataWithContentsOfFile:zkeyPath];
    
    
    NSString *wtnsPath = [[NSBundle mainBundle] pathForResource:@"witness" ofType:@"wtns" inDirectory:nil];
    
    if (wtnsPath) {
        NSLog(@"wtnsPath found at: %@", wtnsPath);
    } else {
        NSLog(@"wtnsPath not found");
    }
    
    NSData *wtnsData = [NSData dataWithContentsOfFile:wtnsPath];
    
    NSDate *startDate = [NSDate date];
    
    

    unsigned long proof_buffer_size = 16384;
    char proof_buffer[proof_buffer_size];
    
    unsigned long public_buffer_size = 16384;
    char public_buffer[public_buffer_size];
    
    unsigned long error_msg_size = 512;
    char error_msg[error_msg_size];
    
    
    groth16_prover([zkeyData bytes], zkeyData.length, [wtnsData bytes], wtnsData.length, proof_buffer, &proof_buffer_size, public_buffer, &public_buffer_size, error_msg, error_msg_size);
    
    NSDate *stopDate = [NSDate date];
    
    // Calculate the execution time
    NSTimeInterval executionTime = [stopDate timeIntervalSinceDate:startDate];
    
    NSLog(@"Execution time: %f seconds", executionTime);
    
    printf("public_buffer:\n%s\n", public_buffer);
    printf("proof_buffer:\n%s\n", proof_buffer );
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
