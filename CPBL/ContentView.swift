//
//  ContentView.swift
//  CPBL
//
//  Created by 114-2Student03 on 2026/4/30.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            // MARK: - 球隊總覽 Tab
            TeamListView()
                .tabItem {
                    Label {
                        Text("球隊總覽")
                    } icon: {
                        Image(systemName: "baseball")
                    }
                }
                .tag(0)
            
            // MARK: - 聯盟官網 Tab
            OfficialWebsiteView()
                .tabItem {
                    Label {
                        Text("聯盟官網")
                    } icon: {
                        Image(systemName: "globe")
                    }
                }
                .tag(1)
            
            // MARK: - 關於本程式 Tab
            AboutView()
                .tabItem {
                    Label {
                        Text("關於本程式")
                    } icon: {
                        Image(systemName: "info.circle")
                    }
                }
                .tag(2)
        }
    }
}

#Preview {
    ContentView()
}
