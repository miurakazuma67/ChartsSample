//
//  TagView.swift
//  ChartsSample
//
//  Created by 三浦一真 on 2024/05/04.
//

import UIKit

class TagView: UIView {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    init(frame: CGRect, color: UIColor, title: String) {
        super.init(frame: frame)
        self.backgroundColor = color
        self.layer.cornerRadius = frame.height / 2
        self.translatesAutoresizingMaskIntoConstraints = false

        setupTitleLabel(with: title)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupTitleLabel(with title: String) {
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        titleLabel.text = title
    }
}
