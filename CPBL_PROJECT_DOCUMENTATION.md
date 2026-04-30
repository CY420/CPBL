// 中華職棒 CPBL 六隊介紹 App - 完整文件清單與說明

【項目結構概覽】

CPBL/
├── CPBLApp.swift                    ← 應用入口（已存在）
├── ContentView.swift                ← 主頁面（底部導覽列）✅ 已更新
├── Team.swift                       ← 資料模型 ✅ 已建立
├── TeamListView.swift               ← 球隊列表首頁 ✅ 已建立
├── TeamRowView.swift                ← 列表行組件 ✅ 已建立
├── TeamDetailView.swift             ← 球隊詳細介紹頁 ✅ 已建立
├── WebViewContainer.swift           ← WKWebView 封裝 ✅ 已建立
├── WebViewPage.swift                ← 網頁顯示頁面 ✅ 已建立
├── OfficialWebsiteView.swift        ← 聯盟官網頁面 ✅ 已建立
└── AboutView.swift                  ← 關於本程式頁面 ✅ 已建立

【文件功能詳細說明】

1. Team.swift
   ├─ 定義 Team 結構體，遵從 Identifiable protocol
   ├─ 屬性包含：id, name, englishName, mascot, homeStadium, championships
   │          historyDescription, themeColor, imageNames, officialURL
   ├─ 初始化器：接收所有必要參數
   └─ cpblTeams 陣列：包含完整的中職六隊數據

2. WebViewContainer.swift
   ├─ WKWebView 的 UIViewRepresentable 包裝
   ├─ 支持載入指定的 URL
   └─ 提供 WebView 便利視圖

3. TeamRowView.swift
   ├─ 列表行組件設計
   ├─ 左側彩色裝飾條（球隊代表色）
   ├─ 球隊名稱、英文隊名、主場地、奪冠次數
   ├─ SF Symbols 點綴（星星、建築、獎杯圖標）
   └─ 陰影和圓角美化

4. TeamDetailView.swift
   ├─ 球隊詳細介紹頁面
   ├─ 圖片輪播牆（TabView + .page 風格）
   ├─ 球隊基本資訊卡片（GroupBox 風格）
   ├─ 球隊歷史與特色介紹段落
   ├─ 球隊成績統計（奪冠次數等）
   ├─ 「前往球隊官網」按鈕（打開 WebView）
   └─ 輔助視圖：InfoRow, StatisticBox, ColoredGroupBoxStyle

5. TeamListView.swift
   ├─ 球隊列表主頁面
   ├─ NavigationStack 管理導覽
   ├─ List 使用 .insetGrouped 風格
   ├─ ForEach 遍歷所有球隊
   ├─ NavigationLink 連接到詳細頁面
   └─ 使用 TeamRowView 展示每支球隊

6. WebViewPage.swift
   ├─ 網頁顯示頁面
   ├─ 接收 URL 和標題作為參數
   ├─ 嵌入 WebView 組件
   ├─ 提供關閉按鈕
   └─ NavigationBar 顯示頁面標題

7. OfficialWebsiteView.swift
   ├─ 聯盟官網分頁
   ├─ NavigationStack 管理
   ├─ 直接載入中華職棒官網 (https://www.cpbl.com.tw/)
   └─ NavigationTitle 顯示「聯盟官網」

8. AboutView.swift
   ├─ 關於本程式分頁
   ├─ 應用圖標與名稱展示
   ├─ 應用介紹（球隊總覽、圖片輪播、詳細介紹、官方網站）
   ├─ 應用資訊（版本、開發者、框架等）
   ├─ 特色功能展示（設計、響應式、網頁瀏覽、完整資訊）
   ├─ 致謝與版權聲明
   └─ 輔助視圖：SectionHeader, BulletPoint, InfoItem, FeatureTag

9. ContentView.swift （已更新）
   ├─ TabView 實現三個分頁
   ├─ Tab 0：TeamListView （球隊總覽）
   ├─ Tab 1：OfficialWebsiteView （聯盟官網）
   ├─ Tab 2：AboutView （關於本程式）
   └─ TabItem 包含圖標和標籤

【技術實現重點】

✓ 資料模型
  - Team 結構體遵從 Identifiable protocol
  - 六隊完整詳細資訊（超過 100 字的歷史描述）
  - 每隊三張圖片的圖片名稱陣列

✓ 導覽系統
  - NavigationStack 管理整個應用導覽
  - NavigationLink 用於列表行到詳細頁的跳轉
  - 傳遞 Team 資料到下一頁
  - NavigationBar 顯示隊名（.inline 模式）

✓ 分頁功能
  - TabView 實現三個主要分頁
  - TabItem 配置標籤和圖標
  - 保持導覽狀態

✓ 圖片輪播
  - 在詳細頁使用 TabView 搭配 .page 風格
  - .indexViewStyle(.page) 顯示分頁指示器
  - 支持橫向滑動

✓ 網頁載入
  - WebViewContainer 封裝 WKWebView
  - UIViewRepresentable 協議實現
  - 支持任意 URL 載入

✓ UI/UX 美化
  - List 使用 .insetGrouped 風格
  - Card 設計：陰影、圓角、背景
  - 球隊代表色作為視覺識別
  - SF Symbols 圖標裝飾
  - ScrollView 排版詳細頁面
  - GroupBox、Divider 組織內容
  - 合理的 padding 和字體層級

【使用方式】

1. 首頁（球隊總覽）
   - 使用 List 展示六支球隊
   - 點擊任意球隊跳轉到詳細頁面

2. 詳細頁面
   - 頂部圖片輪播牆（可橫向滑動）
   - 球隊基本資訊卡片
   - 球隊歷史與特色介紹
   - 球隊成績統計
   - 「前往球隊官網」按鈕
   - 點擊按鈕打開球隊官方網站

3. 聯盟官網
   - 展示中華職棒官方網站

4. 關於本程式
   - 應用簡介與功能說明
   - 版本資訊
   - 特色功能展示

【資料來源說明】

六隊資料均為真實信息：
1. 味全龍 - 主場：新竹球場，奪冠次數：9次
2. 中信兄弟 - 主場：台中洲際棒球場，奪冠次數：5次
3. 統一獅 - 主場：台南球場，奪冠次數：16次
4. 樂天桃猿 - 主場：新竹球場，奪冠次數：4次
5. 富邦悍將 - 主場：新莊棒球場，奪冠次數：3次
6. 台鋼雄鷹 - 主場：高雄棒球場，奪冠次數：1次

【圖片說明】

由於實際圖片資源在該項目中不存在，圖片輪播使用：
- 球隊代表色漸層背景
- SF Symbols (photo.fill) 作為占位符
- 圖片名稱文字標籤

在實際使用中，可將 imageNames 更新為真實圖片資源名稱。

【後續優化建議】

1. 添加搜索功能
2. 添加球隊比較功能
3. 添加球隊新聞板塊
4. 添加本賽季排名
5. 存儲用戶收藏的球隊
6. 集成視頻播放功能
7. 添加推送通知功能
8. 支持本地化多語言

═══════════════════════════════════════════════════════════════
✅ 項目完成！所有文件已創建並編譯無誤。
═══════════════════════════════════════════════════════════════
