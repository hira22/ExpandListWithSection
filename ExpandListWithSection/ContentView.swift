//
//  ContentView.swift
//  ExpandListWithSection
//
//  Created by hiraoka on 2022/02/07.
//

import SwiftUI

struct Station: Identifiable {
    var id: String { company + line + (name ?? "base") }
    let company: String
    let line: String
    let name: String?
    var stations: [Station]?
}

let items: [Station] = [
    .init(company: "JR", line: "JR山手線", name: nil, stations: [
        .init(company: "JR", line: "JR山手線", name: "大崎"),
        .init(company: "JR", line: "JR山手線", name: "五反田"),
        .init(company: "JR", line: "JR山手線", name: "目黒"),
        .init(company: "JR", line: "JR山手線", name: "恵比寿"),
        .init(company: "JR", line: "JR山手線", name: "渋谷"),
    ]),
    .init(company: "JR", line: "JR南武線", name: nil, stations: [
        .init(company: "JR", line: "JR南武線", name: "川崎"),
        .init(company: "JR", line: "JR南武線", name: "尻手"),
        .init(company: "JR", line: "JR南武線", name: "矢向"),
        .init(company: "JR", line: "JR南武線", name: "鹿島田"),
        .init(company: "JR", line: "JR南武線", name: "平間"),
    ]),
    .init(company: "京王", line: "京王線", name: nil, stations: [
        .init(company: "京王", line: "京王線", name: "新宿"),
        .init(company: "京王", line: "京王線", name: "笹塚"),
        .init(company: "京王", line: "京王線", name: "代田橋"),
        .init(company: "京王", line: "京王線", name: "明大前"),
        .init(company: "京王", line: "京王線", name: "下高井戸"),
    ]),
    .init(company: "東急", line: "東急東横線", name: nil, stations: [
        .init(company: "東急", line: "東急東横線", name: "渋谷"),
        .init(company: "東急", line: "東急東横線", name: "代官山"),
        .init(company: "東急", line: "東急東横線", name: "中目黒"),
        .init(company: "東急", line: "東急東横線", name: "祐天寺"),
        .init(company: "東急", line: "東急東横線", name: "学芸大学"),
    ]),
]

let itemDictionary = Dictionary(grouping: items, by: \.company)

struct ContentView: View {
    var body: some View {
        List {
            let companies = Array(itemDictionary.keys)
            ForEach(companies, id: \.self) { company in
                Section(company) {
                    let lines = itemDictionary[company] ?? []
                    ForEach(lines) { line in
                        DisclosureGroup(content: {
                            ForEach(line.stations ?? []) { station in
                                Text(station.name!)
                            }
                        }, label: {
                            Text(line.line)
                        })
                    }
                }
            }
        }
        .listStyle(.plain)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
