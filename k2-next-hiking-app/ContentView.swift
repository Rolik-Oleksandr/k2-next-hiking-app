import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "info.circle")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("k2-next")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
