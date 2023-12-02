//
//  AppRouter.swift
//  BeChill
//
//  Created by Krzysztof Kubiak on 29/11/2023.
//

import Foundation
import SwiftUI

class AppRouter: ObservableObject {
    // MARK: - Injected vars
    // MARK: - Published vars
    // MARK: - Private vars

    // MARK: - Initialization
//    init() {
//        Logger.print("init:\(#file)")
//    }
//
//    deinit {
//        Logger.print("deinit:\(#file)")
//    }

    // MARK: - Methods
    @ViewBuilder func content() -> some View {
        Text("Hello world!")
    }
}

struct AppRouterView: View {
    @StateObject var router: AppRouter = AppRouter()

    var body: some View {
        NavigationView {
           self.router.content()
        }
    }
}
