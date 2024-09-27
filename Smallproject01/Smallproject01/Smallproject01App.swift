//
//  Smallproject01App.swift
//  Smallproject01
//
//  Created by Lane Affield on 9/23/24.
//

import SwiftUI

@main
struct Smallproject01App: App {
    @State private var blogs = BlogPost.sampleData
    var body: some Scene {
        WindowGroup {
            BlogsView(blogs: $blogs)
        }
    }
}
