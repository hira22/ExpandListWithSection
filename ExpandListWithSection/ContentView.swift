//
//  ContentView.swift
//  ExpandListWithSection
//
//  Created by hiraoka on 2022/02/07.
//

import SwiftUI

struct Line: Identifiable {
    var id: String { company + name }
    let company: String
    let name: String
    var stations: [Station] = []
}

struct Station: Identifiable {
    var id: String { line + name }
    let line: String
    let name: String
}

let items: [Line] = [
    .init(company: "JR", name: "JR山手線", stations: [
        .init(line: "JR山手線", name: "大崎"),
        .init(line: "JR山手線", name: "五反田"),
        .init(line: "JR山手線", name: "目黒"),
        .init(line: "JR山手線", name: "恵比寿"),
        .init(line: "JR山手線", name: "渋谷"),
    ]),
    .init(company: "JR", name: "JR南武線", stations: [
        .init(line: "JR南武線", name: "川崎"),
        .init(line: "JR南武線", name: "尻手"),
        .init(line: "JR南武線", name: "矢向"),
        .init(line: "JR南武線", name: "鹿島田"),
        .init(line: "JR南武線", name: "平間"),
    ]),
    .init(company: "京王", name: "京王線", stations: [
        .init(line: "京王線", name: "新宿"),
        .init(line: "京王線", name: "笹塚"),
        .init(line: "京王線", name: "代田橋"),
        .init(line: "京王線", name: "明大前"),
        .init(line: "京王線", name: "下高井戸"),
    ]),
    .init(company: "東急", name: "東急東横線", stations: [
        .init(line: "東急東横線", name: "渋谷"),
        .init(line: "東急東横線", name: "代官山"),
        .init(line: "東急東横線", name: "中目黒"),
        .init(line: "東急東横線", name: "祐天寺"),
        .init(line: "東急東横線", name: "学芸大学"),
    ]),
]

let itemDictionary = Dictionary(grouping: items, by: \.company)

struct ContentView: View {
    var body: some View {
        List {
            let companies = Array(itemDictionary.keys)
            ForEach(companies, id: \.self) { company in
                Section(company) {
                    let lines = itemDictionary[company]!
                    ForEach(lines) { line in
                        DisclosureGroup(content: {
                            ForEach(line.stations) { station in
                                Text(station.name)
                            }
                        }, label: {
                            Text(line.name)
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
