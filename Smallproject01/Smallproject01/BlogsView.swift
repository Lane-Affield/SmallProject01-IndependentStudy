import SwiftUI

struct BlogsView: View {
    @Binding var blogs: [BlogPost]
    
    @State private var newBlog = BlogPost.emptyBlogPost // State for the new blog
    @State private var isPresentingNewBlogView = false // State to show the new blog form
    
    var body: some View {
        NavigationStack {
            List($blogs, id: \.title) { $blog in
                NavigationLink(destination: DetailView(blog: $blog)) {
                    CardView(blog: $blog)
                }
            }
            .navigationTitle("My Blogs")
            .toolbar {
                Button(action: {
                    // Show the new blog form
                    newBlog = BlogPost.emptyBlogPost // Reset newBlog to empty
                    isPresentingNewBlogView = true
                }) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("Add a new blog")
            }
        }
        // Show the form for a new blog post in a sheet
        .sheet(isPresented: $isPresentingNewBlogView) {
            NavigationStack {
                BlogFormView(blog: $newBlog)
                    .navigationTitle("New Blog Post")
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingNewBlogView = false // Dismiss the form
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Save") {
                                blogs.append(newBlog) // Append the new blog to the list
                                isPresentingNewBlogView = false // Dismiss the form
                            }
                        }
                    }
            }
        }
    }
}

struct BlogsView_Previews: PreviewProvider {
    static var previews: some View {
        // Wrap in a State for previews since BlogsView requires a Binding
        BlogsView(blogs: .constant(BlogPost.sampleData))
    }
}
