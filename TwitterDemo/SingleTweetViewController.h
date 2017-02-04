//
//  SingleTweetViewController.h
//  TwitterDemo
//
//  Created by  Carol Hagler on 2/2/17.
//  Copyright © 2017  Carol Hagler. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

@interface SingleTweetViewController : UIViewController

@property (strong, nonatomic) Tweet *myTweet;

- (void) setTweet:(Tweet *)tweet;

@end
