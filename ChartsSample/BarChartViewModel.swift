//
//  BarChartViewModel.swift
//  ChartsSample
//
//  Created by 三浦一真 on 2024/04/16.
//

// TODO: カテゴリごとにグラフの色分け
// TODO: 同じ日だったら、合計時間の計算
// TODO: アニメーション
// TODO: dataをModelから受け取って処理する

import Foundation

class BarChartViewModel: ObservableObject {
    @Published var studyData: [StudyData] = []
    private var colorManager = ColorManager() // ColorManagerのインスタンスを追加

    init() {
        generateOneDayDummyData()
    }

    // 30日分ランダム生成
    private func generateOneMonthDummyData() {
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
                let color = colorManager.createColor(for: category) // カテゴリに色を割り当て
                stubStudyData.append(StudyData(date: date, studyTime: studyTime, category: category, color: color))
            }
        }
        self.studyData = stubStudyData
    }

    // 1日分 category同じなら合計を計算して1本のグラフにする
    // category違う場合は色を変更する
    private func generateOneDayDummyData() {
        let categories = ["数学", "物理", "英語", "プログラミング", "Swift", "Flutter", "React"]

        // DateFormatterの設定
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"

        let calendar = Calendar.current
        var stubStudyData = [StudyData]()
        for _ in 0..<30 {
            if let date = calendar.date(byAdding: .day, value: 1, to: Date()) {
                let studyTime = Double.random(in: 0.5...5.0)
                let category = categories.randomElement()!
                let color = colorManager.createColor(for: category) // カテゴリに色を割り当て
                stubStudyData.append(StudyData(date: date, studyTime: studyTime, category: category, color: color))
            }
        }
        self.studyData = stubStudyData
        print(self.studyData)
    }
}
