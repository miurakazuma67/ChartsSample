//
//  BarChartViewModel.swift
//  ChartsSample
//
//  Created by 三浦一真 on 2024/04/16.
//

// TODO: カテゴリごとにグラフの色分け done
// TODO: 同じ日だったら、合計時間の計算　done
// TODO: アニメーション
// TODO: dataをModelから受け取って処理する

import Foundation

class BarChartViewModel: ObservableObject {
    @Published var studyData: [StudyData] = []
    private var colorManager = ColorManager() // ColorManagerのインスタンスを追加

    init() {
        generateOneDayDummyData()
    }

    // 1日分 category同じなら合計を計算して1本のグラフにする
    // category違う場合は色を変更する
    private func generateOneDayDummyData() {
        let categories = ["数学", "物理", "英語", "プログラミング", "Swift", "Flutter", "React"]

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let date = Date()  // 1日分のデータだけなので、今日の日付を使用

        var categoryTotals = [String: Double]()  // カテゴリごとの合計時間を保持する辞書

        for _ in 0..<30 {
            let studyTime = Double.random(in: 0.5...5.0)
            if let category = categories.randomElement() {
                if let existingTime = categoryTotals[category] {
                    categoryTotals[category] = existingTime + studyTime
                } else {
                    categoryTotals[category] = studyTime
                }
            }
        }

        var stubStudyData = [StudyData]()
        for (category, totalStudyTime) in categoryTotals {
            let color = colorManager.createColor(for: category)  // カテゴリに色を割り当て
            stubStudyData.append(StudyData(date: date, studyTime: totalStudyTime, category: category, color: color))
        }

        viewDidLoad(stubStudyData: stubStudyData)
    }

    func viewDidLoad(stubStudyData: [StudyData]) {
        self.studyData = stubStudyData
    }
}
// categoryの色と一日あたりの時間を表示するセル的なビューを作る

