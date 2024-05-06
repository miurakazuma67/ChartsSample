//
//  ShowWeekDataView.swift
//  ChartsSample
//
//  Created by 三浦一真 on 2024/04/28.
//

import SwiftUI

// カテゴリ押下したらセルごと色変わってテキストも白くする
struct ShowWeekDataView: View {
    var body: some View {
        LazyVGrid(columns: [GridItem(.fixed(300))], alignment: .leading, content: {
//            VStack(content: {
//                Text("color")
//                Rectangle()
//                    .frame(height: 1)  // 線の厚さを1に設定
//                    .foregroundColor(.gray)  // 線の色をグレーに設定
//                Text("category")
//            })
//                .frame(width: 100, height: 100)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 10)  // 角の丸い枠線
//                        .stroke(Color.blue, lineWidth: 2)
//                )
            
            TagView(color: Color.green, title: "Swift")
            // データ受け取れるようにする
            
// ------------------- 曜日＋学習時間 S-------------------------------------
            // forループでデータの個数(1週間分)生成
            HStack(spacing: 0) {
                ForEach(0..<7, id: \.self) { _ in
                    VStack {
                        Text("日")
                            .font(.system(size: 12))
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.gray)
                        Text("10分")
                            .font(.system(size: 12))
                    }
                    .padding(8)
                    .background(Color(UIColor.tertiarySystemGroupedBackground))
                }
            }
// ------------------- 曜日＋学習時間 E-------------------------------------
        })
    }
}

#Preview {
    ShowWeekDataView()
}
