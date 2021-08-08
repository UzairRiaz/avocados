//
//  AppView.swift
//  Avocados
//
//  Created by Umair Riaz on 06/08/2021.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView{
            AvodcadosView()
                .tabItem({
                    Image("tabicon-branch")
                    Text("Avocados")
                })
            ContentView(headers: headersData)
                .tabItem({
                        Image("tabicon-book")
                        Text("Recipes")
                })
            RipeningStagesView()
                .tabItem({
                    Image("tabicon-avocado")
                    Text("Ripening")
                })
            SettingsView()
                .tabItem({
                    Image("tabicon-settings")
                    Text("Settings")
                })
        }
        .edgesIgnoringSafeArea(.top)
        .accentColor(.primary)
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
            .preferredColorScheme(.light)
    }
}
