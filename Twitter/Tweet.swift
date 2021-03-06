//
//  Tweet.swift
//  Twitter
//
//  Created by Tom H on 2/14/16.
//  Copyright © 2016 Tom Horvath. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    var user: User?
    var text: String?
    var createdAtString: String?
    var createdAt: NSDate?
    var dict: NSDictionary?
    var favoriteCount: Int
    var retweetCount: Int
    
    init(dictionary: NSDictionary) {
        dict = dictionary
        user = User(dictionary: dictionary["user"] as! NSDictionary)
        text = dictionary["text"] as? String
        createdAtString = dictionary["created_at"] as? String
        favoriteCount = dictionary["favorite_count"] as! Int
        retweetCount = dictionary["retweet_count"] as! Int
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
        createdAt = formatter.dateFromString(createdAtString!)
    }
    
    func retweet() {
        TwitterClient.sharedInstance.retweetWithParams(["id": dict!["id"]!]) { (tweet, error) -> () in
            print("retweet returned")
        }
    }
    
    func favorite() {
        TwitterClient.sharedInstance.favoriteWithParams(["id": dict!["id"]!]) { (tweet, error) -> () in
            print("favorite returned")
        }
    }
    
    class func tweet(status: String) {
        TwitterClient.sharedInstance.tweetWithParams(["status": status]) { (tweet, error) -> () in
            print("post tweet returned")
        }
    }
    
    class func tweetsWithArray(array: [NSDictionary]) -> [Tweet] {
        var tweets = [Tweet]()
        
        for dictionary in array {
            tweets.append(Tweet(dictionary: dictionary))
        }
        
        return tweets
    }
}
