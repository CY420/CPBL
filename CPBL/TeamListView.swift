//
//  TeamListView.swift
//  CPBL
//
//  Created by 114-2Student03 on 2026/4/30.
//

import SwiftUI

struct TeamListView: View {
    var body: some View {
        NavigationStack {
            List {
                Section(header: Label("中華職棒隊伍", systemImage: "baseball")) {
                    ForEach(cpblTeams) { team in
                        NavigationLink(destination: TeamDetailView(team: team)) {
                            TeamRowView(team: team)
                        }
                    }
                }
                .listSectionSeparator(.hidden)
            }
            .listStyle(.insetGrouped)
            .navigationTitle("球隊總覽")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    TeamListView()
}
