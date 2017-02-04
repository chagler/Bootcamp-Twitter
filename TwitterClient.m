//
//  TwitterClient.m
//  TwitterDemo
//
//  Created by  Carol Hagler on 1/30/17.
//  Copyright © 2017  Carol Hagler. All rights reserved.
//

#import "TwitterClient.h"

NSString * const kTwitterConsumerKey = @"z9i2hfV7btP90lqPxz2s4vpMA";
NSString * const kTwitterConsumerSecret = @"QVWpJ45qTEXsh3o2VgVLFvS27eKxRyGGoIFxGAY5acDgqsKWly";
NSString * const kTwitterBaseURL = @"https://api.twitter.com";

@interface TwitterClient()

@property (nonatomic, strong) void (^loginCompletion)(User *user, NSError *error);

@end

@implementation TwitterClient

+ (TwitterClient *) sharedInstance
{
    static TwitterClient *instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (instance == nil)
        {
            instance = [[TwitterClient alloc] initWithBaseURL:[NSURL URLWithString:kTwitterBaseURL] consumerKey:kTwitterConsumerKey consumerSecret:kTwitterConsumerSecret];
        }
    });

    
    return instance;
}

- (void)loginWithCompletion:(void (^)(User *user, NSError *error))completion
{
    if (self.isAuthorized) {
        completion(nil, nil);
        return;
    }
    
    self.loginCompletion = completion;
    
    [self.requestSerializer removeAccessToken];
    [self fetchRequestTokenWithPath:@"oauth/request_token" method:@"GET" callbackURL:[NSURL URLWithString:@"cptwitterdemo://oauth"] scope:nil success:^(BDBOAuth1Credential *requestToken) {
        NSLog(@"Got the request token!");
        
        NSURL *authURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.twitter.com/oauth/authorize?oauth_token=%@", requestToken.token]];
        [[UIApplication sharedApplication] openURL:authURL];
    }
        failure:^(NSError *error)
    {
        NSLog(@"Failed to get the request token.");
        self.loginCompletion(nil, error);
    }
    ];
    
}

-(void) openURL:(NSURL *)url
{
    [self fetchAccessTokenWithPath:@"oauth/access_token" method:@"POST" requestToken:[BDBOAuth1Credential credentialWithQueryString:url.query] success:^(BDBOAuth1Credential *accessToken) {
        NSLog(@"Got the access token!");
        [self.requestSerializer saveAccessToken:accessToken];
        [self GET:@"1.1/account/verify_credentials.json" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
            NSLog(@"Making progress on the user credentials");
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"Got the user credentials! Current user: %@", responseObject);
            User *user = [[User alloc] initWithDictionary:responseObject];
            NSLog(@"Current user: %@", user.name);
            self.loginCompletion(user, nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"Failed to get the user credentials.");
            self.loginCompletion(nil, error);
        }];
        
/*        [[TwitterClient sharedInstance] GET:@"1.1/statuses/home_timeline.json" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
            NSLog(@"Making progress on the tweets");
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            //          NSLog(@"Tweets: %@", responseObject);
            NSArray *tweets = [Tweet tweetsWithArray:responseObject];
            for (Tweet *tweet in tweets)
            {
                NSLog(@"Tweet: %@, Created: %@", tweet.text, tweet.createdAt);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"Failed to get the tweets.");
        }];
*/
        
    } failure:^(NSError *error) {
        NSLog(@"Failed to get the access token.");
    }];
}

@end
