//
//  TabView.swift
//  BeChill
//
//  Created by Krzysztof Kubiak on 02/12/2023.
//

import SwiftUI

struct TabBarView: View {
    enum Tab {
        case feed, hot, profile
    }

    @State private var selectedTab: Tab = .feed
    @State private var tabState: Visibility = .visible
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Group {
                //Non-hiding tab bar - change to TabStateScrollView
                FeedView()
                    .tabItem {
                        Image(systemName: selectedTab == .feed ? "house.fill" : "house")
                            .environment(\.symbolVariants, selectedTab == .feed ? .fill : .none)
                    }
                    .onAppear { selectedTab = .feed }
                    .tag(Tab.feed)

                NavigationStack {
                    TabStateScrollView(axis: .vertical, showsIndicator: false, tabState: $tabState) {
                        LazyVStack {
                            ForEach(0 ... 50, id: \.self) { post in
                                PostView(post: .constant(Post.mocks[0]))
                                Divider()
                            }
                        }
                    }
                    .navigationTitle("Hot")
                    .background(Color.BackgroundColor)
                }
                .toolbar(tabState, for: .tabBar)
                .animation(.easeInOut(duration: 0.3), value: tabState)
                .tabItem {
                    Image(systemName: selectedTab == .hot ? "flame.fill" : "flame")
                        .environment(\.symbolVariants, selectedTab == .hot ? .fill : .none)
                }
                .onAppear { selectedTab = .hot }
                .tag(Tab.hot)
                
                ProfileView(user: .constant(User.mocks[0]))
                    .tabItem {
                        Image(systemName: selectedTab == .profile ? "person.fill" : "person")
                            .environment(\.symbolVariants, selectedTab == .profile ? .fill : .none)
                    }
                    .onAppear { selectedTab = .profile }
                    .tag(Tab.profile)
            }
//            .toolbar(tabState, for: .tabBar)
//            .animation(.easeInOut(duration: 0.3), value: tabState)
//            .toolbarBackground(Color.BackgroundColor, for: .tabBar)
        }
//        .foregroundStyle(Color.BackgroundColor)
        .tint(Color.TextColor)
        .background(Color.BackgroundColor, ignoresSafeAreaEdges: .all)
    }
}


struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
