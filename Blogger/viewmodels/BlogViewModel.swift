//
//  BlogViewModel.swift
//  Blogger
//
//  Created by Prabhakar Patil on 24/10/20.
//

import Foundation

struct BlogViewModel {
    
    let blogId: String
    let blogCreationDate: String
    let blogContent: String
    let blogComments: Int
    let likesOnBlog: Int
    let blogMedia: [MediaModel]?
    let blogAuthor: [UserModel]
    
    init(blog: BlogListModel) {
        
        self.blogId = blog.id
        self.blogCreationDate = blog.createdAt
        self.blogContent = blog.content
        self.blogComments = blog.comments
        self.likesOnBlog = blog.likes
        self.blogMedia = blog.media
        self.blogAuthor = blog.user
    }
    
}
