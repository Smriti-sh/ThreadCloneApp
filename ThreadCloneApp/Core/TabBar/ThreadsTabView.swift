import SwiftUI

struct ThreadsTabView: View {
    
    //The @State property wrapper allows SwiftUI to rebuild the view when the value changes
    @State private var selectedTab = 0
    
    var body: some View {
        
        //container that holds multiple views, displayed as tabs.
        TabView(selection: $selectedTab){
            
            FeedView()
                .tabItem {
                    Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                        .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                }
            //When this tab appears, it sets selectedTab = 0 to update the UI accordingly.
                .onAppear{selectedTab = 0}
                .tag(0)     //This uniquely identifies the tab.
            
            ExploreView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .onAppear{selectedTab = 1}
                .tag(1)
            
            ThreadView()
                .tabItem {
                    Image(systemName: "plus")
                }
                .onAppear{selectedTab = 2}
                .tag(2)
            
            ActivityView()
                .tabItem {
                    Image(systemName: selectedTab == 3 ? "heart.fill" : "heart")
                        .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
                }
                .onAppear{selectedTab = 3}
                .tag(3)
            
            ProfileView()
                .tabItem {
                    Image(systemName: selectedTab == 4 ? "person.fill" : "person")
                        .environment(\.symbolVariants, selectedTab == 4 ? .fill : .none)
                }
                .onAppear{selectedTab = 4}
                .tag(4)
        }
        .tint(.black)
    }
}

#Preview {
    ThreadsTabView()
}
