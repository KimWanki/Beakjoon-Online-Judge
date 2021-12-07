//
//  NewListTableViewController.swift
//  GoodNews
//
//  Created by WANKI KIM on 2021/11/30.
//

import UIKit

class NewListTableViewController: UITableViewController {
    
    private var articleListViewModel: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let url = URL(string:
                        "https://newsapi.org/v2/top-headlines?country=us&apiKey=3de9f8aadfa04c49b065f6d21432a824")!
        WebService().getArticles(url: url) { articles in
            
            if let articles = articles {
                self.articleListViewModel = ArticleListViewModel(articles: articles)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return articleListViewModel == nil ? 0 : articleListViewModel.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleListViewModel.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else { fatalError() }
        
        let articleViewModel = articleListViewModel.articleAtIndex(indexPath.row)
        
        cell.titleLabel.text = articleViewModel.title
        cell.descriptionLabel.text = articleViewModel.description
        
        return cell
    }
}
