//
//  ContentView.swift
//  ChartsSample
//
//  Created by 三浦一真 on 2024/04/16.
//

import SwiftUI
import Charts

struct ContentView: View {
    @State private var scale: CGFloat = 0.0
    @State private var selectedTab = 0
    @StateObject private var viewModel = BarChartViewModel()

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Text("学習記録")
//                        .centerHorizontally()
                    Picker("Options", selection: $selectedTab) {
                        Text("日").tag(0)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: geometry.size.width, height: 32, alignment: .center)
                    .padding()

                    // 選択されたタブに応じたコンテンツを表示
                    if selectedTab == 0 {
                        Chart {
                            ForEach(viewModel.studyData) { dataItem in
                                BarMark(
                                    x: .value("日付", dataItem.date, unit: .day),
                                    y: .value("勉強時間", dataItem.studyTime),
                                    width: 20 // 棒グラフの幅
                                )
                                .foregroundStyle(dataItem.color)
                            }
                        }
                        .chartXAxis {
                            AxisMarks(position: .bottom, values: .stride(by: .day)) { _ in
                                AxisGridLine(centered: nil, stroke: .init(StrokeStyle(lineWidth: 0)))
                                AxisValueLabel(format: .dateTime.weekday(.abbreviated))
                            }
                        }
                        .chartYAxis {
                            AxisMarks(values: .automatic(desiredCount: 5)) { _ in
                                AxisGridLine()
                                AxisValueLabel()
                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: 300) //TODO: FIX
                    }
                    
                    // categoryの個数分だけ、タグと一週間分のビューを作る
                    LazyVGrid(columns: [GridItem(.fixed(300))], alignment: .leading, content: {
                        ForEach(viewModel.studyData, id: \.category) { dataItem in
                            ShowWeekDataView(tagTitle: dataItem.category, tagColor: dataItem.color)
                        }
                    })
                } // vstack
            }
            
        }
    }
}
#Preview {
    ContentView()
}
