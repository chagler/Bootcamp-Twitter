//
//  TweetListViewController.m
//  TwitterDemo
//
//  Created by  Carol Hagler on 1/30/17.
//  Copyright © 2017  Carol Hagler. All rights reserved.
//

#import "TweetListViewController.h"
#import "TweetTableViewCell.h"
#import "TwitterClient.h"
#import "User.h"
#import "SingleTweetViewController.h"
#import "NavigationManager.h"

@interface TweetListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) UIRefreshControl *tableRefreshControl;

@end

@implementation TweetListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.estimatedRowHeight = 200;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    self.tableRefreshControl = [[UIRefreshControl alloc] init];
    [self.tableRefreshControl addTarget:self action:@selector(fetchTweets) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:self.tableRefreshControl];
        
    UINib *nib = [UINib nibWithNibName:@"TweetTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"TweetTableViewCell"];
    [self fetchTweets];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fetchTweets {
    [[TwitterClient sharedInstance] GET:@"1.1/statuses/home_timeline.json" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"Making progress on the tweets");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //          NSLog(@"Tweets: %@", responseObject);
        
        NSArray *tweets = [Tweet tweetsWithArray:responseObject];
        for (Tweet *tweet in tweets)
        {
            NSLog(@"Tweet: %@, Created: %@", tweet.text, tweet.createdAt);
        }
        self.tweets = tweets;
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Failed to get the tweets.");
    }];
    [self.tableRefreshControl endRefreshing];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SingleTweetViewController *oneTweet = [[SingleTweetViewController alloc] initWithNibName:@"SingleTweetViewController" bundle:nil];

    Tweet *tweet = [self.tweets objectAtIndex:indexPath.row];
    NSLog(@"My Tweet:: %@", tweet.text);
    oneTweet.myTweet = tweet;

    [self.navigationController pushViewController:oneTweet animated:YES];
}

#pragma mark - Navigation

 
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tweets.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TweetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TweetTableViewCell" forIndexPath:indexPath];
    
    Tweet *model = [self.tweets objectAtIndex:indexPath.row];
    
    [cell setTweet:model];


    
    return cell;
}


@end
