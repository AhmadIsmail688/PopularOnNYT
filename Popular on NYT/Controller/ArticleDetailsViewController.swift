//
//  ArticleDetailsViewController.swift
//  Popular on NYT
//
//  Created by Ahmad Ismail on 3/20/19.
//  Copyright © 2019 Ahmad Ismail. All rights reserved.
//

import UIKit

class ArticleDetailsViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var abstractLabel: UILabel!
    
    var articleViewModel: ArticleViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateData()
    }

    func populateData() {
        imageView.setup(withImageUrl: articleViewModel.imageUrlString)
        titleLabel.text = articleViewModel.title
        abstractLabel.text = articleViewModel.abstract
    }

}
