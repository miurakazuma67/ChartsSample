//
//  DateUtility.swift
//  ChartsSample
//
//  Created by 三浦一真 on 2024/04/16.
//

import Foundation
import SwiftUI

func createWeek() -> [Date] {
    // 現在の日付を取得
    let today = Date()
    // カレンダーインスタンスを取得
    let calendar = Calendar.current
    // 7日分の日付を格納するための配列を初期化
    var dates = [Date]()
    
    // 現在の日付を含めて7日分の日付を配列に追加
    for day in 0..<7 {
        if let date = calendar.date(byAdding: .day, value: day, to: today) {
            dates.append(date)
        }
    }
    return dates
}

extension Date {
    // 曜日に応じたグラデーションを返す関数
    func gradientForDayOfWeek() -> LinearGradient {
        let color = self.colorForDayOfWeek() // 既存のcolorForDayOfWeekを使用
        // グラデーションの作成
        let gradient = LinearGradient(gradient: Gradient(colors: [color.opacity(0.5), color]), startPoint: .top, endPoint: .bottom)
        return gradient
    }
    
    // 曜日に応じた色を返す関数
    func colorForDayOfWeek() -> Color {
        let calendar = Calendar.current
        let dayOfWeek = calendar.component(.weekday, from: self)
        
        switch dayOfWeek {
        case 1: // 日曜日
            return Color.orange
        case 2: // 月曜日
            return Color.yellow
        case 3: // 火曜日
            return Color.red
        case 4: // 水曜日
            return Color.blue
        case 5: // 木曜日
            return Color.green
        case 6: // 金曜日
            return Color.pink
        case 7: // 土曜日
            return Color.purple
        default:
            return Color.gray // 万が一曜日が取得できない場合はグレーを返す
        }
    }
}
