//
//  BarChartViewModel.swift
//  ChartsSample
//
//  Created by 三浦一真 on 2024/04/16.
//

import Foundation

class BarChartViewModel: ObservableObject {
    @Published var studyData: [StudyData] = []

    init() {
        generateDummyData()
    }

    private func generateDummyData() {
        let categories = ["数学", "歴史", "科学", "言語学", "プログラミング"]

        // DateFormatterの設定
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"

        // 今日から30日前までの日付を生成
        let calendar = Calendar.current
        var stubStudyData = [StudyData]()
        for i in 0..<30 {
            if let date = calendar.date(byAdding: .day, value: -i, to: Date()) {
                let studyTime = Double.random(in: 0.5...5.0)
                let category = categories.randomElement()!
                stubStudyData.append(StudyData(date: date, studyTime: studyTime, category: category))
            }
        }
        self.studyData = stubStudyData
    }
}
