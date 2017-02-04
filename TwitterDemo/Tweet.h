//
//  Tweet.h
//  TwitterDemo
//
//  Created by  Carol Hagler on 1/31/17.
//  Copyright © 2017  Carol Hagler. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Tweet : NSObject

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, strong) NSNumber *retweetCount;
@property (nonatomic, strong) NSNumber *favoritesCount;
@property (nonatomic, strong) User *user;

- (id)initWithDictionary:(NSDictionary *)dictionary;

+ (NSArray *) tweetsWithArray:(NSArray *)array;

@end
