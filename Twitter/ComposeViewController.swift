//
//  ComposeViewController.swift
//  Twitter
//
//  Created by Tom H on 3/6/16.
//  Copyright © 2016 Tom Horvath. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var profileHandleLabel: UILabel!
    @IBOutlet weak var tweetTextView: UITextView!
    
    @IBAction func onTweet(sender: AnyObject) {
        Tweet.tweet(tweetTextView.text)

        self.dismissViewControllerAnimated(true, completion: {
            self.tweetTextView.text = ""
        })
    }
    
    @IBAction func onCancel(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: {
            self.tweetTextView.text = ""
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImageView.setImageWithURL(NSURL(string: (User.currentUser?.profileImageUrl)!)!)
        profileImageView.layer.cornerRadius = 3.0
        profileNameLabel.text = User.currentUser?.name
        profileHandleLabel.text = "@" + (User.currentUser?.screenname)!
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        tweetTextView.becomeFirstResponder()
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
