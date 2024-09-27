//
//  BlogPosts.swift
//  Smallproject01
//
//  Created by Lane Affield on 9/24/24.
//

import Foundation

struct BlogPost {
    var title: String
    var blog_body: String
    var length: Int
    var date: Date
    var topics: [String]
    var author: String

}

extension BlogPost{
    static let sampleData: [BlogPost] = [
        BlogPost(title: "How to Count", blog_body: "akdgja;fkjagh lkjfgh alkjsdfaklsjfklsjfghalkfjghalkjfhg", length: 5, date: Date(), topics: ["Math", "Education"], author: "Lane Affield"),
        BlogPost(title: "basic programming", blog_body: "Hello World", length: 10, date: Date(), topics: ["Coding", "Programming","Swift"], author: "Jon Doe"),
        BlogPost(title: "Swift", blog_body: "Swift is a coding language for developing IOS applications", length: 10, date: Date(), topics: ["Swift"], author: "steve    jobs")
                
    ]

static let emptyBlogPost = BlogPost(
    title: "",
    blog_body: "",
    length: 0,
    date: Date(), // Default to the current date
    topics: [],
    author: ""
)

}
