//
//  User.m
//  TwitterDemo
//
//  Created by  Carol Hagler on 1/31/17.
//  Copyright © 2017  Carol Hagler. All rights reserved.
//

#import "User.h"

@implementation User

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self)
    {
        self.name = dictionary[@"name"];
        self.screenname = dictionary[@"screen_name"];
        self.profileImageURL = dictionary[@"profile_image_url_https"];
        self.tagline = dictionary[@"description"];
    }
    
    return self;
}

@end
