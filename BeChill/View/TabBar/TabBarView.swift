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
    @State private var showNewPostSheet = false
    @State private var sheetHeight: CGFloat = .zero
    @State private var currentUser: User = User.mocks[0]

    var body: some View {
        TabView(selection: $selectedTab) {
            Group {
                NavigationStack {
                    TabStateScrollView(axis: .vertical, showsIndicator: false, tabState: $tabState) {
                        LazyVStack {
                            ForEach(Post.mocks, id: \.self) { post in
                                PostView(post: .constant(post))
                                Divider()
                            }
                        }
                    }
                    .navigationTitle("Home")
                    .background(Color.BackgroundColor)
                }
                .toolbar(tabState, for: .tabBar)
                .animation(.easeInOut(duration: 0.3), value: tabState)
                .tabItem {
                    Image(systemName: selectedTab == .feed ? "house.fill" : "house")
                        .environment(\.symbolVariants, selectedTab == .feed ? .fill : .none)
                }
                .onAppear { selectedTab = .feed }
                .tag(Tab.feed)
                .overlay {
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Button(action: { showNewPostSheet = true }) {
                                Image(systemName: "plus.circle.fill")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                            }
                            .padding(20)
                        }
                    }
                }

                NavigationStack {
                    TabStateScrollView(axis: .vertical, showsIndicator: false, tabState: $tabState) {
                        LazyVStack {
                            ForEach(Post.mocks, id: \.self) { post in
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
                .overlay {
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Button(action: { showNewPostSheet = true }) {
                                Image(systemName: "plus.circle.fill")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                            }
                            .padding(20)
                        }
                    }
                }

                ProfileView(user: $currentUser)
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

        .sheet(isPresented: $showNewPostSheet) {
            AddPostView(isPresented: $showNewPostSheet)
                .overlay {
                    GeometryReader { geometry in
                        Color.clear.preference(key: InnerHeightPreferenceKey.self, value: geometry.size.height)
                    }
                }
                .onPreferenceChange(InnerHeightPreferenceKey.self) { newHeight in
                    sheetHeight = newHeight
                }
                .presentationDetents([.height(sheetHeight)])
                .presentationDragIndicator(.visible)
        }
    }
}


struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}


struct InnerHeightPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
