

import SwiftUI


struct BlogFormView: View {
    @State private var blogTitle = ""
    @State private var blogAuthor = ""
    @State private var blogBody = ""
    @State private var topics: [String] = []
    @State private var date = Date()
    @Binding var blog: BlogPost

    var body: some View {
        Form {
            Section(header: Text("New Blog")) {
                TextField("Title", text: $blogTitle)
                TextField("Author", text: $blogAuthor)
                TextEditor(text: $blogBody)
                    .frame(width: 200, height: 300)
                TextField("Topics (comma separated)", text: $topicsString)
                    .onChange(of: topicsString) { newValue in
                        topics = newValue.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) }
                    }
            }
            Section {
                Button("Save") {
                    // Save logic here
                    blog.title = blogTitle
                    blog.author = blogAuthor
                    blog.blog_body = blogBody
                    blog.topics = topics
                    blog.date = Date() // Update the date to now
                    blog.length = blogBody.count // Update the length based on body text
                }
            }
        }
        .onAppear {
            // Prepopulate fields with current blog data if editing
            blogTitle = blog.title
            blogAuthor = blog.author
            blogBody = blog.blog_body
            topics = blog.topics
            topicsString = topics.joined(separator: ", ")
        }
    }

    @State private var topicsString = "" // Used for text input of topics
}

struct BlogFormView_Previews: PreviewProvider {
    static var previews: some View {
        BlogFormView(blog: .constant(BlogPost.sampleData[0]))
    }
}
