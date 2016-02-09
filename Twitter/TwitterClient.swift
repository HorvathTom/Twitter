//
//  TwitterClient.swift
//  Twitter
//
//  Created by Tom H on 2/8/16.
//  Copyright © 2016 Tom Horvath. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

let twitterConsumerKey = "rPCdnCfkno7BdGMLdHfRINXbx"
let twitterConsumerSecret = "WlH47ftfEXYTrNyMMU88fbX9j49BgFfuhsHOnpHgusU8wTFlP3"
let twitterBaseURL = NSURL(string: "https://api.twitter.com")

class TwitterClient: BDBOAuth1SessionManager {
    class var sharedInstance: TwitterClient {
        struct Static {
            static let instance = TwitterClient(baseURL: twitterBaseURL, consumerKey: twitterConsumerKey, consumerSecret: twitterConsumerSecret)
        }
        
        return Static.instance
    }
}
