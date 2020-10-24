//
//  BlogListModel.swift
//  Blogger
//
//  Created by Prabhakar Patil on 24/10/20.
//

import Foundation

public struct BlogListModel: Codable {
    let id: String
    let createdAt: String
    let content: String
    let comments: Int
    let likes: Int
    let media: [MediaModel]
    let user: [UserModel]
}


public struct MediaModel: Codable {
    let id: String
    let blogId: String
    let createdAt: String
    let image: String
    let title: String
    let url: String
    
}

public struct UserModel: Codable {
    
    let id: String
    let blogId: String
    let createdAt: String
    let name: String
    let lastname: String
    let city: String
    let designation: String
    let about: String
    let avatar: String
    
}
