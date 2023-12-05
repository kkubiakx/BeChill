//
//  ContentView.swift
//  PlzStahp
//
//  Created by Krzysztof Kubiak on 25/11/2023.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    @State private var isDarkModeOn = false

    @Query private var items: [Item]

    var ToggleThemeView: some View {
        Toggle("Dark Mode", isOn: $isDarkModeOn).onChange(of: isDarkModeOn, {changeDarkMode(state: isDarkModeOn)})
        .labelsHidden()
    }

    var body: some View {
        NavigationView {
           ZStack {
            Color.BackgroundColor.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
              Text("Switch theme")
                    .foregroundColor(Color.TextColor)
                    .padding(10)
              ToggleThemeView
            }
            .background(Color.BackgroundColor)
//         .font(Font.custom("Baloo-Regular", size: 20))
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(
                leading:
                    Text("DarkModeSwitch").font(Font.custom("Baloo-Regular", size: 20)))
            .navigationBarBackButtonHidden(true)
               foregroundColor(Color.TextColor)
           }
        }
        .background(Color.BackgroundColor)
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear(perform: {
            setAppTheme()
            }
        )
    }

    func setAppTheme() {
        //Saved theme from toggle in app
//        isDarkModeOn = UserDefaultsUtils.shared.getDarkMode()
//        changeDarkMode(state: isDarkModeOn)

        //Device theme
        if (colorScheme == .dark) {
            isDarkModeOn = true
        } else {
            isDarkModeOn = false
        }

        changeDarkMode(state: isDarkModeOn)
    }

    func changeDarkMode(state: Bool) {
        (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first!.overrideUserInterfaceStyle = state ? .dark : .light
        UserDefaultsUtils.shared.setDarkMode(enable: state)
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
