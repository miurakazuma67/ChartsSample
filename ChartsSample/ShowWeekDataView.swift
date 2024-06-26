//
//  ShowWeekDataView.swift
//  ChartsSample
//
//  Created by 三浦一真 on 2024/04/28.
//

import SwiftUI

// カテゴリ押下したらセルごと色変わってテキストも白くする
struct ShowWeekDataView: View {
    // タグのタイトルと色
    var tagTitle: String
    var tagColor: Color
    // 曜日とタグの色も渡せるように
    // 配列で1週間分の学習データをもらってくると良さそう
    
    var body: some View {
        
        LazyVGrid(columns: [GridItem(.fixed(300))], alignment: .leading, content: {
            TagView(color: tagColor, title: tagTitle)
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
                    .frame(maxWidth: .infinity, alignment: .leading) // 左寄せでも見切れないように調整
                }
            }
// ------------------- 曜日＋学習時間 E-------------------------------------
        })
    }
}

//#Preview {
//    ShowWeekDataView()
//}
