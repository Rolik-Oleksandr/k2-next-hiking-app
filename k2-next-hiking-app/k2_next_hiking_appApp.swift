import SwiftUI

@main
struct k2_next_hiking_appApp: App {
    
    @State var selectedView: String = "home-view"
    
    var body: some Scene {
        WindowGroup {
            TabView {
                HomeView()
                    .tabItem {
                        TabBarItem(icon: "house.fill",
                                   label: "Головна",
                                   isSelected: selectedView == "home-view",
                                   action: { selectedView = "home-view" }
                        )
                    }
                RouteView()
                    .tabItem {
                        TabBarItem(icon: "point.bottomleft.forward.to.point.topright.scurvepath",
                                   label: "Маршрути",
                                   isSelected: selectedView == "route-view",
                                   isRotating: true,
                                   action: { selectedView = "route-view" }
                        )
                    }
                UserAccountView()
                    .tabItem {
                        TabBarItem(icon: "person.fill",
                                   label: "Аккаунт",
                                   isSelected: selectedView == "account-view",
                                   action: { selectedView = "account-view" }
                        )
                    }
            }
            .accentColor(Color.instance.greenButton)
        }
    }
}
