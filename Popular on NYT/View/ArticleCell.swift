//
//  ArticleCell.swift
//  Popular on NYT
//
//  Created by Ahmad Ismail on 3/20/19.
//  Copyright © 2019 Ahmad Ismail. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bylineLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    
    var articleViewModel: ArticleViewModel! {
        didSet {
            titleLabel.text = articleViewModel.title
            bylineLabel.text = articleViewModel.byline
            dateLabel.text = articleViewModel.publishedDate
            thumbnailImageView.setup(withImageUrl: articleViewModel.thumbnailUrlString)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
