//
//  LoginViewController.m
//  TwitterDemo
//
//  Created by  Carol Hagler on 1/30/17.
//  Copyright © 2017  Carol Hagler. All rights reserved.
//

#import "LoginViewController.h"
#import "TwitterClient.h"
#import "NavigationManager.h"

@interface LoginViewController ()
@property (strong, nonatomic) IBOutlet UIView *loginView;




@end

@implementation LoginViewController

- (IBAction)onLogin:(id)sender {
    [[TwitterClient sharedInstance] loginWithCompletion:^(User *user, NSError *error) {
        if (user != nil)
        {
            // modally present tweets view
            // self.navigationController.viewControllers = @[listVC];
            NSLog(@"Welcome to %@", user.name);
            [[NavigationManager shared] logIn];
            // use tweets to populate listVC
        } else {
            // present error view
            // self.navigationController.viewControllers = @[loginVC];
            NSLog(@"Something went wrong. Exiting the program.");
            [[NavigationManager shared] logOut];
        }
    }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
