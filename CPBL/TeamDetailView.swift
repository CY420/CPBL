//
//  TeamDetailView.swift
//  CPBL
//
//  Created by patrick on 2026/4/30.
//

import SwiftUI
import MapKit

struct TeamDetailView: View {
    let team: Team
    @State private var showWebView = false
    @State private var cameraPosition: MapCameraPosition
    
    init(team: Team) {
        self.team = team
        let position = MapCameraPosition.region(
            MKCoordinateRegion(
                center: team.stadiumCoordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            )
        )
        _cameraPosition = State(initialValue: position)
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 0) {
                    // MARK: - 圖片輪播牆 (Carousel)
                    imageCarousel
                        .frame(height: 300)
                        .clipped()
                    
                    VStack(spacing: 20) {
                        // MARK: - 球隊基本資訊卡片
                        teamInfoCard
                        
                        Divider()
                            .padding(.vertical, 8)
                        
                        // MARK: - 歷史與特色介紹
                        historySection
                        
                        Divider()
                            .padding(.vertical, 8)
                        
                        // MARK: - 統計數據
                        statisticsSection
                        
                        Divider()
                            .padding(.vertical, 8)
                        
                        // MARK: - 主場位置地圖
                        stadiumMapSection
                        
                        Divider()
                            .padding(.vertical, 8)
                        
                        // MARK: - 官方網站按鈕
                        Button(action: { showWebView = true }) {
                            HStack {
                                Image(systemName: "globe")
                                    .font(.headline)
                                Text("前往球隊官網")
                                    .font(.headline)
                                Spacer()
                                Image(systemName: "arrow.up.right")
                                    .font(.system(size: 14, weight: .semibold))
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundStyle(.white)
                            .background(team.themeColor)
                            .cornerRadius(12)
                        }
                        .padding(.vertical, 16)
                    }
                    .padding(20)
                }
            }
            .navigationTitle(team.name)
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $showWebView) {
                WebViewPage(url: team.officialURL, title: team.name)
            }
        }
    }
    
    // MARK: - 圖片輪播
    private var imageCarousel: some View {
        TabView {
            ForEach(team.imageNames, id: \.self) { imageName in
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .clipped()
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .automatic))
        .indexViewStyle(.page(backgroundDisplayMode: .automatic))
    }
    
    // MARK: - 球隊基本資訊卡片
    private var teamInfoCard: some View {
        GroupBox(label: Label("球隊資訊", systemImage: "info.circle.fill")) {
            VStack(alignment: .leading, spacing: 12) {
                InfoRow(label: "球隊名稱", value: team.name, icon: "pencil")
                Divider()
                InfoRow(label: "英文隊名", value: team.englishName, icon: "globe")
                Divider()
                InfoRow(label: "吉祥物", value: team.mascot, icon: "pawprint.fill")
                Divider()
                InfoRow(label: "主場地", value: team.homeStadium, icon: "building.2.fill")
            }
        }
        .groupBoxStyle(ColoredGroupBoxStyle(color: team.themeColor))
    }
    
    // MARK: - 歷史介紹段落
    private var historySection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Label("球隊歷史與特色", systemImage: "book.fill")
                .font(.headline)
                .foregroundStyle(team.themeColor)
            
            Text(team.historyDescription)
                .font(.body)
                .lineSpacing(6)
                .foregroundStyle(.primary)
        }
    }
    
    // MARK: - 統計數據
    private var statisticsSection: some View {
        VStack(spacing: 12) {
            Label("球隊成績", systemImage: "chart.bar.fill")
                .font(.headline)
                .foregroundStyle(team.themeColor)
            
            HStack(spacing: 16) {
                StatisticBox(
                    title: "奪冠次數",
                    value: "\(team.championships)",
                    icon: "trophy.fill",
                    color: team.themeColor
                )
                
                Spacer()
                
                StatisticBox(
                    title: "聯盟",
                    value: "CPBL",
                    icon: "circle.grid.2x2.fill",
                    color: team.themeColor
                )
            }
        }
    }
    
    // MARK: - 主場位置地圖
    private var stadiumMapSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("主場位置", systemImage: "location.fill")
                .font(.headline)
                .foregroundStyle(team.themeColor)
            
            Map(position: $cameraPosition) {
                Annotation("", coordinate: team.stadiumCoordinate) {
                    ZStack {
                        Circle()
                            .fill(team.themeColor)
                            .frame(width: 50, height: 50)
                        
                        Image(systemName: "baseball.fill")
                            .font(.system(size: 24))
                            .foregroundStyle(.white)
                    }
                }
            }
            .frame(height: 250)
            .cornerRadius(15)
            .shadow(color: team.themeColor.opacity(0.3), radius: 8, x: 0, y: 4)
            .overlay(
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Image(systemName: "mappin.circle.fill")
                            .foregroundStyle(team.themeColor)
                        VStack(alignment: .leading, spacing: 2) {
                            Text(team.homeStadium)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            Text("主場球場")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        Spacer()
                    }
                    .padding(10)
                    .background(Color(.systemBackground))
                    .cornerRadius(10)
                    .padding(10)
                    
                    Spacer()
                },
                alignment: .topLeading
            )
        }
    }
}

// MARK: - 輔助視圖

struct InfoRow: View {
    let label: String
    let value: String
    let icon: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.system(size: 16))
                .frame(width: 20)
                .foregroundStyle(.blue)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(label)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Text(value)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.primary)
            }
            
            Spacer()
        }
    }
}

struct StatisticBox: View {
    let title: String
    let value: String
    let icon: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.system(size: 24))
                .foregroundStyle(color)
            
            Text(value)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(.primary)
            
            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(16)
        .background(color.opacity(0.1))
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(color.opacity(0.2), lineWidth: 1)
        )
    }
}

struct ColoredGroupBoxStyle: GroupBoxStyle {
    let color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            configuration.label
                .font(.headline)
                .foregroundStyle(color)
            
            configuration.content
        }
        .padding(16)
        .background(color.opacity(0.05))
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(color.opacity(0.2), lineWidth: 1)
        )
    }
}

#Preview {
    TeamDetailView(team: cpblTeams[2])
}
