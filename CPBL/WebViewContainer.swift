//
//  WebViewContainer.swift
//  CPBL
//
//  Created by 114-2Student03 on 2026/4/30.
//

import SwiftUI
import WebKit

struct WebViewContainer: UIViewRepresentable {
    let urlString: String
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        // 更新邏輯（如需要）
    }
}

// 用於 SwiftUI Preview 的代理視圖
struct WebView: View {
    let urlString: String
    
    var body: some View {
        ZStack {
            WebViewContainer(urlString: urlString)
            
            // 提供載入提示
            if urlString.isEmpty {
                VStack {
                    ProgressView()
                    Text("載入中...")
                        .foregroundStyle(.gray)
                        .padding(.top, 8)
                }
            }
        }
    }
}

#Preview {
    WebView(urlString: "https://www.cpbl.com.tw/")
}
