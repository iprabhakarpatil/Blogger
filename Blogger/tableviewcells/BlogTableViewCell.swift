//
//  BlogTableViewCell.swift
//  Blogger
//
//  Created by Prabhakar Patil on 24/10/20.
//

import UIKit

class BlogTableViewCell: UITableViewCell {
    
    @IBOutlet weak var authorProfileImageView: UIImageView!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var authorDesignationLabel: UILabel!
    @IBOutlet weak var blogPostedTimeLabel: UILabel!
    @IBOutlet weak var blogMediaImageView: UIImageView!
    @IBOutlet weak var blogContentLabel: UILabel!
    @IBOutlet weak var blogTitleLabe: UILabel!
    @IBOutlet weak var blogLinkLable: UILabel!
    @IBOutlet weak var blogCommentsCountLabel: UILabel!
    @IBOutlet weak var blogLikeCountLabel: UILabel!
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
