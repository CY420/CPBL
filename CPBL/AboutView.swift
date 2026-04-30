//
//  AboutView.swift
//  CPBL
//
//  Created by 114-2Student03 on 2026/4/30.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    // 應用圖標區域
                    VStack(spacing: 12) {
                        Image(systemName: "baseball.fill")
                            .font(.system(size: 60))
                            .foregroundStyle(.red)
                        
                        Text("CPBL 隊伍介紹")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text("中華職棒電子書")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    .padding(.vertical, 32)
                    
                    // 應用說明
                    VStack(alignment: .leading, spacing: 16) {
                        SectionHeader(title: "應用介紹", icon: "info.circle.fill")
                        
                        VStack(alignment: .leading, spacing: 12) {
                            BulletPoint(
                                icon: "baseball",
                                title: "球隊總覽",
                                description: "瀏覽中華職棒所有六支球隊的詳細資訊"
                            )
                            
                            BulletPoint(
                                icon: "photo.on.rectangle",
                                title: "圖片輪播",
                                description: "橫向滑動觀看各隊的精彩照片"
                            )
                            
                            BulletPoint(
                                icon: "book.fill",
                                title: "詳細介紹",
                                description: "深入了解每支球隊的歷史與特色"
                            )
                            
                            BulletPoint(
                                icon: "globe",
                                title: "官方網站",
                                description: "一鍵前往球隊及聯盟官方網站"
                            )
                        }
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    
                    // 版本與開發者資訊
                    VStack(alignment: .leading, spacing: 16) {
                        SectionHeader(title: "應用資訊", icon: "app.fill")
                        
                        InfoItem(label: "應用名稱", value: "CPBL 隊伍介紹")
                        InfoItem(label: "版本", value: "1.0.0")
                        InfoItem(label: "開發者", value: "Patrick")
                        InfoItem(label: "開發日期", value: "2026年4月")
                        InfoItem(label: "框架", value: "SwiftUI")
                        InfoItem(label: "最低需求", value: "iOS 16.0+")
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    
                    // 特色功能
                    VStack(alignment: .leading, spacing: 16) {
                        SectionHeader(title: "特色功能", icon: "star.fill")
                        
                        FeatureTag(emoji: "🎨", text: "精美的 UI/UX 設計")
                        FeatureTag(emoji: "📱", text: "響應式版面配置")
                        FeatureTag(emoji: "🌐", text: "內嵌網頁瀏覽器")
                        FeatureTag(emoji: "⚾", text: "完整的球隊資訊")
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    
                    // 致謝與版權
                    VStack(alignment: .leading, spacing: 8) {
                        Text("致謝與版權")
                            .font(.headline)
                        
                        Text("本應用程式所使用的球隊資訊及品牌內容為教育用途。所有球隊商標、隊名及相關資產的版權屬於各自的持有者。")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .lineSpacing(4)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    
                    // 底部間距
                    Spacer()
                        .frame(height: 20)
                }
                .padding(20)
            }
            .navigationTitle("關於本程式")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// MARK: - 輔助視圖

struct SectionHeader: View {
    let title: String
    let icon: String
    
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: icon)
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(.blue)
            
            Text(title)
                .font(.headline)
                .foregroundStyle(.primary)
            
            Spacer()
        }
    }
}

struct BulletPoint: View {
    let icon: String
    let title: String
    let description: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 18))
                .foregroundStyle(.red)
                .frame(width: 24)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text(description)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
        }
    }
}

struct InfoItem: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack {
            Text(label)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
            Spacer()
            
            Text(value)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
        }
        .padding(.vertical, 4)
    }
}

struct FeatureTag: View {
    let emoji: String
    let text: String
    
    var body: some View {
        HStack(spacing: 8) {
            Text(emoji)
                .font(.system(size: 20))
            
            Text(text)
                .font(.subheadline)
            
            Spacer()
        }
        .padding(12)
        .background(Color(.systemBackground))
        .cornerRadius(8)
    }
}

#Preview {
    AboutView()
}
