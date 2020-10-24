//
//  ViewController.swift
//  Blogger
//
//  Created by Prabhakar Patil on 24/10/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkService.shared.fetchBlogs(for: 1) { (result: Result<[BlogListModel], NetworkError>) in
            switch result {
            case .success(let response):
                print("Response: \(response)")
            case .failure(let error):
                print("Error:\(error)")
            }
        }
    }
    
}

