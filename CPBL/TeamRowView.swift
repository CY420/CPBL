//
//  TeamRowView.swift
//  CPBL
//
//  Created by 114-2Student03 on 2026/4/30.
//

import SwiftUI

struct TeamRowView: View {
    let team: Team
    
    var body: some View {
        HStack(spacing: 12) {
            // 左側裝飾條
            RoundedRectangle(cornerRadius: 6)
                .fill(team.themeColor)
                .frame(width: 5)
            
            // 隊徽圖片
            Image(team.logoImageName)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    VStack(alignment: .leading, spacing: 2) {
                        Text(team.name)
                            .font(.headline)
                            .foregroundStyle(.primary)
                        
                        Text(team.englishName)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    
                    Spacer()
                    
                    // SF Symbols 點綴
                    Image(systemName: "star.fill")
                        .foregroundStyle(team.themeColor)
                        .font(.system(size: 12))
                }
                
                HStack(spacing: 16) {
                    HStack(spacing: 4) {
                        Image(systemName: "building.2.fill")
                            .font(.system(size: 12))
                            .foregroundStyle(team.themeColor)
                        Text(team.homeStadium)
                            .font(.caption)
                    }
                    
                    HStack(spacing: 4) {
                        Image(systemName: "trophy.fill")
                            .font(.system(size: 12))
                            .foregroundStyle(.orange)
                        Text("\(team.championships)次")
                            .font(.caption)
                    }
                    
                    Spacer()
                }
                .foregroundStyle(.secondary)
                .font(.caption2)
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemBackground))
                .shadow(color: team.themeColor.opacity(0.2), radius: 4, x: 0, y: 2)
        )
    }
}

#Preview {
    VStack {
        TeamRowView(team: cpblTeams[0])
        TeamRowView(team: cpblTeams[2])
    }
    .padding()
}
