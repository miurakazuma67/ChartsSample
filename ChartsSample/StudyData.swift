//
//  StudyData.swift
//  ChartsSample
//
//  Created by 三浦一真 on 2024/04/16.
//

import Foundation

// グラフで使うデータ
struct StudyData: Identifiable {
    var id = UUID() // データを一意に識別するためのID
    var date: Date // 日付
    var studyTime: Double // 学習時間
    var category: String // 教材のカテゴリ
}

// 管理方法
// dateごとに合計の学習時間を計算し、グラフに描画する
// categoryごとに棒グラフの色を変更する
