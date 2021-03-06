# Project 3 - TwitterDemo

TwitterDemo is a basic twitter app to read and compose tweets the [Twitter API](https://apps.twitter.com).

Time spent: **43** hours spent in total

## User Stories

The following **required** functionality is completed:

- [x] User can sign in using OAuth login flow.
- [x] User can view last 20 tweets from their home timeline.
- [x] In the home timeline, user can view tweet with the user profile picture, username, tweet text, and timestamp.  In other words, design the custom cell with the proper Auto Layout settings.  You will also need to augment the model classes.
- [x] User can pull to refresh.
- [ ] User can compose a new tweet by tapping on a compose button.
- [x] User can tap on a tweet to view it, with controls to retweet, favorite, and reply.
- [ ] Hamburger menu
   - [ ] Dragging anywhere in the view should reveal the menu.
   - [ ] The menu should include links to your profile, the home timeline, and the mentions view.
- [ ] Profile page
   - [ ] Contains the user header view (implemented as a custom view)
   - [ ] Contains a section with the users basic stats: # tweets, # following, # followers
- [ ] Home Timeline
   - [ ] Tapping on a user image should bring up that user's profile page

The following **optional** features are implemented:

- [ ] When composing, you should have a countdown in the upper right for the tweet limit.
- [ ] After creating a new tweet, a user should be able to view it in the timeline immediately without refetching the timeline from the network.
- [ ] Retweeting and favoriting should increment the retweet and favorite count.
- [ ] User should be able to unretweet and unfavorite and should decrement the retweet and favorite count.
- [ ] Replies should be prefixed with the username and the reply_id should be set when posting the tweet,
- [ ] User can load more tweets once they reach the bottom of the feed using infinite loading similar to the actual Twitter client.
- [ ] Pulling down the profile page should blur and resize the header image.
- [ ] Account switching
   - [ ] Long press on tab bar to bring up Account view with animation
   - [ ] Tap account to switch to
   - [ ] Include a plus button to Add an Account
   - [ ] Swipe to delete an account

The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='chaglerTwitter.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

This was a ridiculous expectation for a "class" for supposed beginner iOS developers.  To provide nothing but a 40 minute 
video of you getting the project set up and talking as you go, no outline of resources explaining the concepts involved
in an app of this type, no basic curriculum guide to organize how to approach it, no resources about how to think about
navigating through an app like this without the storyboard (which is the only way we have seen, since we just started last
week and the only things we have seen were seen in this room).  To provide that video and then nothing but a list of bullets
of what the finished product should include does not constitute a class of any kind, and does not meet any definition of
teaching.  The Yahoos in the room have tried to make up for what codepath failed to provide, but there are limits to what
anyone not trained in either teaching or curriculum development should be expected to come up with on the fly.  This was a
complete waste of money on the company's part.  Whatever we gleaned, we could have gotten without any input from codepath
at all.  

## License

    Copyright [2017] [Carol Hagler]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
