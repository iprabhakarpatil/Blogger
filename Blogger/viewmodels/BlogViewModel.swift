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
    let blogComments: String
    let likesOnBlog: String
    var blogMedia: MediaViewModel?
    var blogAuthor: AuthorViewModel?
    
    init(blog: BlogListModel) {
        
        self.blogId = blog.id
        self.blogCreationDate = CustomDateFormatter.utcToLocal(date: blog.createdAt)?.timeAgoSinceDate(numericDates: true) ?? ""
        self.blogContent = blog.content
        self.blogComments = blog.comments.roundedWithAbbreviations + " Comments"
        self.likesOnBlog = blog.likes.roundedWithAbbreviations + " Likes"
        
        if let user = blog.user.first {
            self.blogAuthor = AuthorViewModel(author: user)
        }
        
        if let media = blog.media.first {
            self.blogMedia = MediaViewModel(media: media)
        }
    }
    
}


