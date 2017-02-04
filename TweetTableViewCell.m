//
//  TweetTableViewCell.m
//  TwitterDemo
//
//  Created by  Carol Hagler on 1/30/17.
//  Copyright © 2017  Carol Hagler. All rights reserved.
//

#import "TweetTableViewCell.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
#import <UIKit/UIKit.h>

@interface TweetTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timestampLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *handleLabel;

@end

@implementation TweetTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // add rounded corners to images or callbacks to buttons
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setTweet:(Tweet *)tweet {
    if (tweet != nil) {
        self.nameLabel.text = tweet.user.name;
        self.handleLabel.text = tweet.user.screenname;
        NSDateComponentsFormatter *formatter = [[NSDateComponentsFormatter alloc] init];
        formatter.unitsStyle = NSDateComponentsFormatterUnitsStyleAbbreviated;
        formatter.allowedUnits = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
        formatter.maximumUnitCount = 1;
        NSString *elapsed = [formatter stringFromDate:tweet.createdAt toDate:[NSDate date]];
        self.timestampLabel.text = elapsed;
        self.contentLabel.text = tweet.text;
        self.profileImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.profileImageView setImageWithURL:[NSURL URLWithString:tweet.user.profileImageURL]];
        
    }
    
}

@end
