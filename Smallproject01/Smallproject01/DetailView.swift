import SwiftUI

struct DetailView: View {
    @Binding var blog: BlogPost
    @State private var editingBlog = BlogPost.emptyBlogPost
    @State private var isPresentingEditView = false
    
    var body: some View {
        List {
            Section(header: Text(blog.title)
                .font(.title)
                .foregroundColor(.orange)) {

                HStack {
                    Label(blog.topics.joined(separator: ", "), systemImage: "brain")
                    Label(blog.author, systemImage: "pencil")
                }
                
                Label("Read Length: \(blog.length) minutes", systemImage: "clock")
                    .foregroundColor(.secondary)
            }
            
            Section(header: Text("Post")) {
                Text(blog.blog_body)
            }
        }
        .toolbar {
            // Edit button to trigger the edit view
            Button("Edit") {
                editingBlog = blog // Set current blog for editing
                isPresentingEditView = true // Show edit view
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            // Present BlogFormView modally for editing
            NavigationStack {
                BlogFormView(blog: $editingBlog)
                    .navigationTitle("Edit Blog")
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Save") {
                                blog = editingBlog // Save edited changes
                                isPresentingEditView = false
                            }
                        }
                    }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DetailView(blog: .constant(BlogPost.sampleData[0]))
        }
    }
}
