//
//  NavigationManager.h
//  TwitterDemo
//
//  Created by  Carol Hagler on 2/1/17.
//  Copyright © 2017  Carol Hagler. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NavigationManager : NSObject

+ (instancetype)shared;

- (UIViewController *)rootViewController;
- (UIViewController *)loggedInVC;
- (UIViewController *)loggedOutVC;

- (void)logIn;
- (void)logOut;

@end
