## 📖 專案介紹 (Introduction)
這是一個使用 SwiftUI 開發的 iOS 應用程式，專為中華職棒（CPBL）球迷打造的電子書與球隊資訊圖鑑。本專案深度整合了原生的 MapKit 與 WebKit，提供球迷最完整、流暢的六隊（味全龍、中信兄弟、統一獅、樂天桃猿、富邦悍將、台鋼雄鷹）資訊瀏覽體驗。

## ✨ 核心功能 (Features)

*   **📊 球隊總覽列表**：首頁使用 `List` 搭配 `.insetGrouped` 風格，以專屬的彩色裝飾條（球隊代表色）與 SF Symbols 設計出自訂的精美卡片列表。
*   **📱 豐富的詳細圖鑑**：
    *   上方具備使用 `TabView` 搭配 `.page` 風格實作的橫向圖片輪播牆。
    *   提供超過百字的歷史與特色介紹、奪冠次數統計等詳細資訊。
*   **🗺️ 主場地圖導覽 (MapKit Integration)**：
    *   使用支援 iOS 16+ 的最新 Map API，透過 `@State` 管理相機狀態，自動將地圖中心定位於球隊真實的主場座標。
    *   自訂精緻的地圖標記卡片，融合球隊代表色背景、`mappin.circle.fill` 圖示，以及陰影和圓角設計。
    *   地圖區塊高度固定（250 pt），確保 `ScrollView` 具備完美平滑的滑動互動體驗。
*   **🌐 內建網頁瀏覽 (WebView)**：
    *   透過 `UIViewRepresentable` 封裝 UIKit 的 `WKWebView`，讓使用者在 App 內即可無縫瀏覽聯盟首頁與各隊官方網站。
*   **🧭 直覺的導覽架構**：
    *   採用 `NavigationStack` 處理頁面傳遞（`Team` 資料結構）與跳轉。
    *   使用 `TabView` 實作底部的三大主分頁（球隊總覽、聯盟官網、關於本程式）。

## 🛠 技術棧 (Tech Stack)

*   **程式語言**: Swift
*   **UI 框架**: SwiftUI
*   **地圖整合**: MapKit / CoreLocation
*   **網頁整合**: WebKit (WKWebView)
*   **資料結構**: 自訂 `Team` 結構體（遵從 `Identifiable` protocol）

## 📂 專案結構 (Project Structure)

*   `CPBLApp.swift`：應用入口
*   `ContentView.swift`：主頁面（包含底部導覽列 TabView）
*   `Team.swift`：資料模型與六隊詳細數據
*   `TeamListView.swift` / `TeamRowView.swift`：球隊列表首頁與列表行組件
*   `TeamDetailView.swift`：球隊詳細介紹頁（包含 MapKit 地圖區塊）
*   `WebViewContainer.swift` / `WebViewPage.swift`：WKWebView 封裝與網頁顯示視圖
*   `OfficialWebsiteView.swift` / `AboutView.swift`：聯盟官網與關於本程式分頁
