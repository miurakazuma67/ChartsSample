//
//  ColorManager.swift
//  ChartsSample
//
//  Created by 三浦一真 on 2024/04/18.
// カテゴリごとの色を管理するクラス

import Foundation
import SwiftUI

final class ColorManager {
    private var colorDictionary: [String: Color] = [:]
    
    // for: 引数ラベル
    // ex) let categoryColor = colorManager.color(for: "数学")
    // この文脈では、for: ラベルが color(for category: String) メソッドの呼び出しを読みやすくしています。
    // これにより、「"数学"カテゴリーのための色を取得する」という操作が明確に伝わります。
    func createColor(for category: String) -> Color {
        if let color = colorDictionary[category] {
            return color
        } else {
            let newColor = Color.random
            colorDictionary[category] = newColor
            return newColor
        }
    }
}

extension Color {
    static var random: Color {
        return Color(red: Double.random(in: 0...1),
                     green: Double.random(in: 0...1),
                     blue: Double.random(in: 0...1))
    }
}
