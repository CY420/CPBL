//
//  OfficialWebsiteView.swift
//  CPBL
//
//  Created by patrick on 2026/4/30.
//

import SwiftUI

struct OfficialWebsiteView: View {
    var body: some View {
        NavigationStack {
            VStack {
                WebView(urlString: "https://www.cpbl.com.tw/")
                    .ignoresSafeArea(edges: .bottom)
            }
            .navigationTitle("聯盟官網")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    OfficialWebsiteView()
}
