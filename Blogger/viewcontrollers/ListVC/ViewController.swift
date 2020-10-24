//
//  ViewController.swift
//  Blogger
//
//  Created by Prabhakar Patil on 24/10/20.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var blogListViewModel: BlogListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTableView()
        blogListViewModel = BlogListViewModel(completion: {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 290.0
        tableView.tableFooterView = UIView()
        tableView.register(BlogTableViewCell.nib, forCellReuseIdentifier: BlogTableViewCell.reuseIdentifier)
    }
    
    private func setupNavigationBar() {
        navigationItem.largeTitleDisplayMode = .automatic
        navigationItem.title = "Blogs"
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return blogListViewModel?.blogList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BlogTableViewCell.reuseIdentifier, for: indexPath) as! BlogTableViewCell
        let blog = blogListViewModel?.blogAt(index: indexPath.row)
        cell.authorNameLabel.text = blog?.blogAuthor?.name
        cell.authorProfileImageView.sd_setImage(with: blog?.blogAuthor?.profileImage)
        if let media = blog?.blogMedia?.mediaImage {
            cell.blogMediaImageView?.sd_setImage(with: media, completed: nil)
            //            cell.imageView?.sd_setImage(with: media, placeholderImage: nil, options: [.scaleDownLargeImages, .continueInBackground], completed: { (_, _, _, _) in
            //            })
            
        } else {
            cell.imageView?.isHidden = true
        }
        cell.authorDesignationLabel.text = blog?.blogAuthor?.designation
        cell.blogTitleLabe.text = blog?.blogMedia?.mediaTitle
        cell.blogContentLabel.text = blog?.blogContent
        cell.blogCommentsCountLabel.text = blog?.blogComments
        cell.blogLikeCountLabel.text = blog?.likesOnBlog
        cell.blogPostedTimeLabel.text = blog?.blogCreationDate
        cell.blogLinkLable.text = blog?.blogMedia?.mediaLink?.absoluteString
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 290.0
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if scrollView == tableView {
            if ((scrollView.contentOffset.y + scrollView.frame.size.height) >= scrollView.contentSize.height) {
                if blogListViewModel.hasMoreData {
                    blogListViewModel.fetchBlogs()
                }
            }
        }
    }
    
    //    func scrollview(_ scrollView: UIScrollView) {
    //        if scrollView == tableView {
    //            if ((scrollView.contentOffset.y + scrollView.frame.size.height) >= scrollView.contentSize.height) {
    //                if blogListViewModel.hasMoreData {
    //                    blogListViewModel.fetchBlogs()
    //                }
    //            }
    //        }
    //    }
}
