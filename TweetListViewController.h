//
//  TweetListViewController.h
//  TwitterDemo
//
//  Created by  Carol Hagler on 1/30/17.
//  Copyright © 2017  Carol Hagler. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

@interface TweetListViewController : UIViewController

@property (strong, nonatomic) NSArray<Tweet *> *tweets;

@end
