//
//  WebViewPage.swift
//  CPBL
//
//  Created by 114-2Student03 on 2026/4/30.
//

import SwiftUI

struct WebViewPage: View {
    let url: String
    let title: String
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                WebView(urlString: url)
                
                VStack {
                    HStack {
                        Button(action: { dismiss() }) {
                            HStack(spacing: 4) {
                                Image(systemName: "chevron.left")
                                Text("關閉")
                            }
                            .foregroundStyle(.blue)
                        }
                        Spacer()
                    }
                    .padding()
                    .background(Color(.systemBackground))
                    
                    Spacer()
                }
            }
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    WebViewPage(url: "https://www.cpbl.com.tw/", title: "中華職棒")
}
