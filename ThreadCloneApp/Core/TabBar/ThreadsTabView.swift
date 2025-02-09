import SwiftUI

struct ThreadsTabView: View {
    
    //The @State property wrapper allows SwiftUI to rebuild the view when the value changes
    @State private var selectedTab = 0
    @State private var lastTab = 0
    @State private var showCreateThreadView = false
    
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
            
//            CreateThreadView()
            Text("")
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
        
        //after dismiss it opens feedView by default
        
//        .onChange(of: selectedTab, perform: { newValue in
//            showCreateThreadView = selectedTab == 2
//        })
//        .sheet(isPresented: $showCreateThreadView, onDismiss: {
//            selectedTab = 0
//        }, content: {
//            CreateThreadView()
//        })
        
        //after dismiss it opens last opened tab
        .onChange(of: selectedTab, perform: { newValue in
            showCreateThreadView = selectedTab == 2
            if selectedTab != 2 {
                lastTab = selectedTab
            }
        })
        .sheet(isPresented: $showCreateThreadView, onDismiss: {
            selectedTab = lastTab
        }, content: {
            CreateThreadView()
        })
        .tint(.black)
    }
}

#Preview {
    ThreadsTabView()
}
