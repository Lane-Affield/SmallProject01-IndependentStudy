import SwiftUI

struct CardView: View {
    @Binding var blog: BlogPost
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(blog.title)
                .font(.headline)
            HStack {
                Label("\(blog.length)", systemImage: "clock")
                Label(formattedDate(blog.date), systemImage: "calendar")
            }
            .font(.caption)
        }
    }
    
    // Function to format the date
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium // e.g., Sep 26, 2024
        return formatter.string(from: date)
    }
}

struct CardView_Previews: PreviewProvider {
    static var blog = BlogPost.sampleData[0]
    
    static var previews: some View {
        CardView(blog: .constant(blog))
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
