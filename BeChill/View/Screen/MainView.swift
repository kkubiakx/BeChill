////
////  MainView.swift
////  BeChill
////
////  Created by Krzysztof Kubiak on 29/11/2023.
////
//
//import SwiftUI
//
//struct MainView: View {
//
//    @StateObject private var router: MainRouter
//
//    init(router: MainRouter) {
//    _router = StateObject(wrappedValue: router)
//    }
//
//    var body: some View {
//        RoutingView(router: router) {
//            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//        }
//    }
//}
//
//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView(router: MainRouter(isPresented: .constant(.main)))
//    }
//}
