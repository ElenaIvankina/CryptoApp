//
//  CryptoTableViewCell.swift
//  CryptoApp
//
//  Created by Елена Иванкина on 09.11.2022.
//

import UIKit

final class CryptoTableViewCell: UITableViewCell {

    private enum DimensionsCryptoTableViewCell {
        static let topInset: CGFloat = 8
        static let bottomInset: CGFloat = 8
        static let leadingInset: CGFloat = 16
        static let trailingInset: CGFloat = 16
        static let betweenInset: CGFloat = 8
        static let heightImageView: CGFloat = 44
        static let widthImageView: CGFloat = 44
        static let largeFontSize: CGFloat = 20
        static let normalFontSize: CGFloat = 16
    }
    
    static let reuseIdentifier = "cryptoTableCell"
    
    let cryptoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let cryptoNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: DimensionsCryptoTableViewCell.largeFontSize)
        label.textAlignment = .left
        return label
    }()
    
    let priceUsdLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: DimensionsCryptoTableViewCell.normalFontSize)
        label.textAlignment = .left
        return label
    }()
    
    let priceBtcLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = .systemFont(ofSize: DimensionsCryptoTableViewCell.normalFontSize)
        label.textAlignment = .left
        return label
    }()
    
    let changeUSDLast24hrsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: DimensionsCryptoTableViewCell.normalFontSize)
        label.textAlignment = .left
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupCryptoImageView()
        setupCryptoNameLabel()
        setupPriceUsdLabel()
        setupPriceBtcLabel()
        setupChangeUSDLast24hrsLabel()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cryptoImageView.image = nil
        cryptoNameLabel.text = nil
        priceUsdLabel.text = nil
        priceBtcLabel.text = nil
        changeUSDLast24hrsLabel.text = nil
        changeUSDLast24hrsLabel.textColor = nil
    }
        
    private func setupCryptoImageView() {
        contentView.addSubview(cryptoImageView)
        NSLayoutConstraint.activate([
            cryptoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: DimensionsCryptoTableViewCell.topInset),
            cryptoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: DimensionsCryptoTableViewCell.leadingInset),
            cryptoImageView.heightAnchor.constraint(equalToConstant: DimensionsCryptoTableViewCell.heightImageView),
            cryptoImageView.widthAnchor.constraint(equalToConstant: DimensionsCryptoTableViewCell.widthImageView)
        ])
    }
    
    private func setupCryptoNameLabel() {
        contentView.addSubview(cryptoNameLabel)
        NSLayoutConstraint.activate([
            cryptoNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: DimensionsCryptoTableViewCell.topInset),
            cryptoNameLabel.leadingAnchor.constraint(equalTo: cryptoImageView.trailingAnchor, constant: DimensionsCryptoTableViewCell.leadingInset)
            ])
    }
    
    private func setupPriceUsdLabel() {
        contentView.addSubview(priceUsdLabel)
        NSLayoutConstraint.activate([
            priceUsdLabel.topAnchor.constraint(equalTo: cryptoNameLabel.bottomAnchor, constant: DimensionsCryptoTableViewCell.betweenInset),
            priceUsdLabel.leadingAnchor.constraint(equalTo: cryptoImageView.trailingAnchor, constant: DimensionsCryptoTableViewCell.leadingInset)
            ])
    }
    
    private func setupPriceBtcLabel() {
        contentView.addSubview(priceBtcLabel)
        NSLayoutConstraint.activate([
            priceBtcLabel.topAnchor.constraint(equalTo: priceUsdLabel.bottomAnchor, constant: DimensionsCryptoTableViewCell.betweenInset),
            priceBtcLabel.leadingAnchor.constraint(equalTo: cryptoImageView.trailingAnchor, constant: DimensionsCryptoTableViewCell.leadingInset)
            ])
        
    }
    
    private func setupChangeUSDLast24hrsLabel() {
        contentView.addSubview(changeUSDLast24hrsLabel)
        NSLayoutConstraint.activate([
            changeUSDLast24hrsLabel.topAnchor.constraint(equalTo: cryptoNameLabel.bottomAnchor, constant: DimensionsCryptoTableViewCell.betweenInset),
            changeUSDLast24hrsLabel.leadingAnchor.constraint(equalTo: priceBtcLabel.trailingAnchor, constant: DimensionsCryptoTableViewCell.leadingInset)
            ])
        
    }
    
    
}
