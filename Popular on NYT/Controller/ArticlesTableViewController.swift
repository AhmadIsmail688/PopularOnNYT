//
//  ArticlesTableViewController.swift
//  Popular on NYT
//
//  Created by Ahmad Ismail on 3/20/19.
//  Copyright © 2019 Ahmad Ismail. All rights reserved.
//

import UIKit

class ArticlesTableViewController: UITableViewController {

    var articleViewModels = [ArticleViewModel]()
    let articleCellId = "ArticleCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        getArticles()
    }

    func setupTableView() {
        let articleNib = UINib(nibName: "ArticleCell", bundle: nil)
        tableView.register(articleNib, forCellReuseIdentifier: articleCellId)
    }
    
    func getArticles() {
        NetworkManager.getArticles(period: .week, success: { articles in
            self.articleViewModels = articles.map{ArticleViewModel(article: $0)}
            self.tableView.reloadData()
        }, failure: { errorMessage in
            self.showAlert(title: "Error", message: errorMessage)
        })
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleViewModels.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let articleCell = tableView.dequeueReusableCell(withIdentifier: articleCellId, for: indexPath) as! ArticleCell
        articleCell.articleViewModel = articleViewModels[indexPath.row]
        return articleCell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
