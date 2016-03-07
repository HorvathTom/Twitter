//
//  TweetCell.swift
//  Twitter
//
//  Created by Tom H on 2/15/16.
//  Copyright © 2016 Tom Horvath. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {
    
    var viewController: UIViewController!

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var handleLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func onProfileImageTap(sender: UITapGestureRecognizer) {
        print("tapped profile image")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let profileViewController = storyboard.instantiateViewControllerWithIdentifier("ProfileViewControllerID") as! ProfileViewController
        let tweetsViewController = viewController as! TweetsViewController
        profileViewController.user = tweetsViewController.tweets![sender.view!.tag].user
        viewController.navigationController?.pushViewController(profileViewController, animated: true)
        //viewController.presentViewController(profileViewController, animated: true, completion: nil)
    }
}
