//
//  TweetsViewController.swift
//  Twitter
//
//  Created by Tom H on 2/14/16.
//  Copyright © 2016 Tom Horvath. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tweets: [Tweet]?
    
    @IBOutlet weak var tweetsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tweetsTableView.delegate = self
        self.tweetsTableView.dataSource = self
        self.tweetsTableView.estimatedRowHeight = 115
        self.tweetsTableView.rowHeight = UITableViewAutomaticDimension

        // Do any additional setup after loading the view.
        TwitterClient.sharedInstance.homeTimelineWithParams(nil) { (tweets, error) -> () in
            self.tweets = tweets
            self.tweetsTableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onLogout(sender: AnyObject) {
        User.currentUser?.logout()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let tweet = tweets![indexPath.row]
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "M/d hh:mm"
        
        let cell = tableView.dequeueReusableCellWithIdentifier("TweetCell", forIndexPath: indexPath) as! TweetCell
        cell.nameLabel.text = tweet.user?.name
        cell.handleLabel.text = "@" + (tweet.user?.screenname)!
        cell.timestampLabel.text = dateFormatter.stringFromDate(tweet.createdAt!)
        cell.tweetLabel.text = tweet.text
        cell.profileImageView.setImageWithURL(NSURL(string: (tweet.user?.profileImageUrl)!)!)
        cell.profileImageView.layer.cornerRadius = 3.0
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let tweets = tweets {
            return tweets.count > 20 ? 20 : tweets.count
        } else {
            return 0
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
