//
//  TweetDetailsViewController.swift
//  Twitter
//
//  Created by Tom H on 3/6/16.
//  Copyright © 2016 Tom Horvath. All rights reserved.
//

import UIKit

class TweetDetailsViewController: UIViewController {
    
    var tweet: Tweet?
    var tweetIndex: Int?

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var handleLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var retweetsLabel: UILabel!
    @IBOutlet weak var favoritesLabel: UILabel!
    
    @IBAction func onReply(sender: AnyObject) {
        
    }
    
    @IBAction func onRetweet(sender: AnyObject) {
        tweet!.retweet()
    }
    
    @IBAction func onFavorite(sender: AnyObject) {
        tweet!.favorite()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        profileImageView.setImageWithURL(NSURL(string: (tweet?.user?.profileImageUrl)!)!)
        profileImageView.layer.cornerRadius = 3.0
        profileImageView.tag = tweetIndex!
        nameLabel.text = tweet?.user?.name
        handleLabel.text = "@" + (tweet?.user?.screenname)!
        tweetLabel.text = tweet?.text
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "M/d hh:mm"
        timestampLabel.text = dateFormatter.stringFromDate((tweet?.createdAt)!)
        retweetsLabel.text = "\((tweet?.retweetCount)!)"
        favoritesLabel.text = "\((tweet?.favoriteCount)!)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
