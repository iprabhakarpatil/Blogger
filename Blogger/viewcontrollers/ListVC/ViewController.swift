//
//  ViewController.swift
//  Blogger
//
//  Created by Prabhakar Patil on 24/10/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var blogListViewModel: BlogListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        blogListViewModel = BlogListViewModel(completion: {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    
    }
    
}

