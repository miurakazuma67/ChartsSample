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
            .foregroundColor(.white)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(color)
            .cornerRadius(10)
    }
}
