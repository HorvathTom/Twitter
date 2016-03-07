//
//  ProfileViewController.swift
//  Twitter
//
//  Created by Tom H on 3/6/16.
//  Copyright © 2016 Tom Horvath. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var handleLabel: UILabel!
    @IBOutlet weak var tweetsCountLabel: UILabel!
    @IBOutlet weak var followingCountLabel: UILabel!
    @IBOutlet weak var followersCountLabel: UILabel!
    
    var user: User?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let backgroundImageUrl = user?.profileBackgroundImageUrl {
            backgroundImageView.hidden = false
            backgroundImageView.setImageWithURL(NSURL(string: backgroundImageUrl)!)
        } else {
            backgroundImageView.hidden = true
        }
        
        profileImageView.setImageWithURL(NSURL(string: (user?.profileImageUrl)!)!)
        usernameLabel.text = user?.name
        handleLabel.text = "@" + (user?.screenname)!
        tweetsCountLabel.text = "\((user?.tweetsCount)!)"
        followingCountLabel.text = "\((user?.followingCount)!)"
        followersCountLabel.text = "\((user?.followersCount)!)"
        
        // Do any additional setup after loading the view.
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
