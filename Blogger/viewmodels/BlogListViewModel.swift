//
//  BlogListViewModel.swift
//  Blogger
//
//  Created by Prabhakar Patil on 24/10/20.
//

import Foundation

class BlogListViewModel {
    
    var blogList: [BlogViewModel] = [BlogViewModel]()
    
    var hasMoreData: Bool = false
    private var page = 1
    private var completion: ()-> Void = {  }
    
    init(completion: @escaping () -> Void) {
        self.completion = completion
        fetchBlogs()
    }
    
    func fetchBlogs(onCompletion: (() -> ())? = nil) {
        
        if hasMoreData {
            page = (blogList.count/10) + 1
        }
        
        NetworkService.shared.fetchBlogs(for: page) {[weak self] (result: Result<[BlogListModel], NetworkError>) in
            switch result {
            case .success(let blogs):
                
                guard let self = self else {
                    assert(false, "Failed to retain self")
                    return
                }
                
                if blogs.count >= 10 {
                    self.hasMoreData = true
                } else {
                    self.hasMoreData = false
                }
                
                if self.blogList.isEmpty {
                    self.blogList = blogs.compactMap{ BlogViewModel(blog: $0) }
                } else {
                    for blog in blogs {
                        self.blogList.append(BlogViewModel(blog: blog))
                    }
                }
                print("Response: \(blogs)")
                self.completion()
                
            case .failure(let error):
                print("Error:\(error)")
                guard let self = self else {
                    assert(false, "Failed to retain self")
                    return
                }
                self.completion()
            }
        }
    }
    
    func blogAt(index: Int) -> BlogViewModel {
        return self.blogList[index]
    }
    
}
