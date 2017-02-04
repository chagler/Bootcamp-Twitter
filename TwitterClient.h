//
//  TwitterClient.h
//  TwitterDemo
//
//  Created by  Carol Hagler on 1/30/17.
//  Copyright © 2017  Carol Hagler. All rights reserved.
//

#import <BDBOAuth1Manager/BDBOAuth1SessionManager.h>
#import <BDBOAuth1Manager/BDBOAuth1RequestSerializer.h>
#import "User.h"

@interface TwitterClient : BDBOAuth1SessionManager

+ (TwitterClient *) sharedInstance;

- (void)loginWithCompletion:(void (^)(User *user, NSError *error))completion;

- (void)openURL:(NSURL *)url;

@end
