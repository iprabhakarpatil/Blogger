//
//  AuthorViewModel.swift
//  Blogger
//
//  Created by Prabhakar Patil on 24/10/20.
//

import Foundation

struct AuthorViewModel {
    
    let authorId: String
    let authorBlogId: String
    let authorJoinDate: String
    let name: String
    let city: String
    let designation: String
    let bio: String
    var profileImage: URL?
    
    init(author: UserModel) {
        self.name = author.name + author.lastname
        self.authorId = author.id
        self.authorBlogId = author.blogId
        self.authorJoinDate = author.createdAt
        self.city = author.city
        self.designation = author.designation
        self.bio = author.about
        self.profileImage = URL(string: author.avatar)
    }
    
}
