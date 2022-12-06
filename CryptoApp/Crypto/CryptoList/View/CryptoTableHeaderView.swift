//
//  CryptoTableHeaderView.swift
//  CryptoApp
//
//  Created by Елена Иванкина on 15.11.2022.
//

import UIKit

final class CryptoTableHeaderView: UIView {
    
    private enum DimensionsCryptoTableHeaderView {
        static let leadingInset: CGFloat = 8
        static let trailingInset: CGFloat = -8
        static let topInset: CGFloat = 8
        static let betweenInset: CGFloat = 8
        static let normalFontSize: CGFloat = 20
    }
    
    let headerNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.text = "Current prices"
        label.font = .systemFont(ofSize: DimensionsCryptoTableHeaderView.normalFontSize)
        label.textAlignment = .left
        return label
    }()
    
    let buttonNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.text = "Sort by: "
        label.font = .systemFont(ofSize: DimensionsCryptoTableHeaderView.normalFontSize)
        label.textAlignment = .left
        return label
    }()
    
    let descendingSortButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBackground
        button.tintColor = .green
        button.setImage(UIImage(systemName: "arrow.down"), for: .normal)
        return button
    }()
    
    let ascendingSortButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBackground
        button.tintColor = .red
        button.setImage(UIImage(systemName: "arrow.up"), for: .normal)
        return button
    }()
    
    init() {
        super.init(frame: CGRect.zero)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        setupHeaderNameLabel()
        setupAscendingSortButton()
        setupDescendingSortButton()
        setupButtonNameLabel()
    }
    
    private func setupHeaderNameLabel() {
        addSubview(headerNameLabel)
        NSLayoutConstraint.activate([
            headerNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: DimensionsCryptoTableHeaderView.topInset),
            headerNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: DimensionsCryptoTableHeaderView.leadingInset)
            ])
    }
    
    private func setupAscendingSortButton() {
        addSubview(ascendingSortButton)
        NSLayoutConstraint.activate([
            ascendingSortButton.topAnchor.constraint(equalTo: topAnchor, constant: DimensionsCryptoTableHeaderView.topInset),
            ascendingSortButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: DimensionsCryptoTableHeaderView.trailingInset)
            ])
    }
    
    private func setupDescendingSortButton() {
        addSubview(descendingSortButton)
        NSLayoutConstraint.activate([
            descendingSortButton.topAnchor.constraint(equalTo: topAnchor, constant: DimensionsCryptoTableHeaderView.topInset),
            descendingSortButton.trailingAnchor.constraint(equalTo: ascendingSortButton.leadingAnchor, constant: -DimensionsCryptoTableHeaderView.betweenInset)
            ])
    }
    
    private func setupButtonNameLabel() {
        addSubview(buttonNameLabel)
        NSLayoutConstraint.activate([
            buttonNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: DimensionsCryptoTableHeaderView.topInset),
            buttonNameLabel.trailingAnchor.constraint(equalTo: descendingSortButton.leadingAnchor, constant: -DimensionsCryptoTableHeaderView.betweenInset)
            ])
    }
    
    
}
