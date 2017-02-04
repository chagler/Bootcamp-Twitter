//
//  SingleTweetViewController.m
//  TwitterDemo
//
//  Created by  Carol Hagler on 2/2/17.
//  Copyright © 2017  Carol Hagler. All rights reserved.
//

#import "SingleTweetViewController.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
#import <UIKit/UIKit.h>
#import "Tweet.h"

@interface SingleTweetViewController ()
@property (weak, nonatomic) IBOutlet UIView *textContainer;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *screennameLabel;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UILabel *timestampLabel;
@property (weak, nonatomic) IBOutlet UIButton *replyButton;
@property (weak, nonatomic) IBOutlet UIButton *retweetButton;
@property (weak, nonatomic) IBOutlet UIButton *favoriteButton;
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *numRetweets;
@property (weak, nonatomic) IBOutlet UILabel *numFavorites;

@end

@implementation SingleTweetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setTweet:self.myTweet];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setTweet:(Tweet *)tweet {
    if (tweet != nil) {
        self.nameLabel.text = tweet.user.name;
        self.screennameLabel.text = tweet.user.screenname;
        NSDateComponentsFormatter *formatter = [[NSDateComponentsFormatter alloc] init];
        formatter.unitsStyle = NSDateComponentsFormatterUnitsStyleAbbreviated;
        formatter.allowedUnits = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
        formatter.maximumUnitCount = 1;
        NSString *elapsed = [formatter stringFromDate:tweet.createdAt toDate:[NSDate date]];
        self.timestampLabel.text = elapsed;
        self.textLabel.text = tweet.text;
        self.profileImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.profileImageView setImageWithURL:[NSURL URLWithString:tweet.user.profileImageURL]];
        if (tweet.retweetCount == nil) {
            tweet.retweetCount = 0;
        }
        if (tweet.favoritesCount == nil) {
            tweet.favoritesCount = 0;
        }
        self.numRetweets.text = [NSString stringWithFormat:@"%ld", tweet.retweetCount.integerValue];
        self.numFavorites.text = [NSString stringWithFormat:@"%ld", (long)tweet.favoritesCount.integerValue];
        
//        [self.textLabel sizeToFit];
        [self.numFavorites sizeToFit];
        [self.numRetweets sizeToFit];
        
/*        CGFloat maxY = CGRectGetMaxY(self.textLabel.frame);
        CGRect contentFrame = self.textContainer.frame;
        contentFrame.size.height = (maxY + 23);
        
        self.textContainer.frame = contentFrame;
*/
        
    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
