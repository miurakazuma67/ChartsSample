//
//  TagView.swift
//  ChartsSample
//
//  Created by 三浦一真 on 2024/05/04.
//

import SwiftUI

struct TagView: View {
    var color: Color
    var title: String
    
    var body: some View {
        Text(title)
            .font(.caption)
            .foregroundColor(color)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(.white)
            .overlay(
                RoundedRectangle(cornerRadius: 30)  // 枠線を角丸矩形で定義
                    .stroke(color, lineWidth: 1)  // 枠線の色と太さを設定
            )
    }
}
