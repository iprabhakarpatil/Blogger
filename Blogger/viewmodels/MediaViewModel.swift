//
//  MediaViewModel.swift
//  Blogger
//
//  Created by Prabhakar Patil on 24/10/20.
//

import Foundation

struct MediaViewModel {
    
    let id: String
    let blogId: String
    let mediaCreatedAt: String
    var mediaImage: URL?
    let mediaTitle: String
    var mediaLink: URL?
    
    init(media: MediaModel) {
        self.id = media.id
        self.blogId = media.blogId
        self.mediaCreatedAt = media.createdAt
        self.mediaImage = URL(string: media.image)
        self.mediaTitle = media.title
        self.mediaLink = URL(string: media.url)
    }
}
