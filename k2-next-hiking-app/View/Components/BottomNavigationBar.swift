import SwiftUI

struct BottomNavigationBar: View {
    @State var selectedView: String = "home-view"
    
    var body: some View {
        HStack(spacing: 50) {
            TabBarItem(icon: "house.fill",
                       label: "Головна",
                       isSelected: selectedView == "home-view",
                       action: { selectedView = "home-view" }
            )
            
            TabBarItem(icon: "point.bottomleft.forward.to.point.topright.scurvepath",
                       label: "Маршрути",
                       isSelected: selectedView == "route-view",
                       isRotating: true,
                       action: { selectedView = "route-view" }
            )
            
            TabBarItem(icon: "person.fill",
                       label: "Аккаунт",
                       isSelected: selectedView == "account-view",
                       action: { selectedView = "account-view" }
            )
        }
    }
}

struct TabBarItem: View {
    let icon: String
    let label: String
    let isSelected: Bool
    let isRotating: Bool
    let action: () -> Void
    
    @State private var isTapped = false
    
    init(icon: String, label: String, isSelected: Bool, isRotating: Bool = false, action: @escaping () -> Void) {
        self.icon = icon
        self.label = label
        self.isSelected = isSelected
        self.isRotating = isRotating
        self.action = action
    }
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .resizable()
                .frame(width: 22, height: 22)
                .padding(.bottom, 0)
                .scaleEffect(isTapped ? 1.3 : 1.0)
                .rotation3DEffect(
                    .degrees(isRotating && isSelected ? 180 : 0),
                    axis: (x: 0, y: 1, z: 0)
                )
                .animation(.spring(response: 0.3, dampingFraction: 0.4), value: isTapped)
                .animation(.easeInOut(duration: 0.5), value: isSelected)
            
            Text(label)
        }
        .onTapGesture {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.4)) {
                isTapped = true
            }
            action()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                isTapped = false
            }
        }
        .foregroundColor(isSelected ?
                         Color.instance.bottomBarActive :
                            Color.instance.bottomBarNotActive)
    }
    
}

#Preview {
    BottomNavigationBar()
}
