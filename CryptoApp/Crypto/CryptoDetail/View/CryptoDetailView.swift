//
//  CryptoDetailView.swift
//  CryptoApp
//
//  Created by Елена Иванкина on 14.11.2022.
//

import UIKit

protocol CryptoDetailViewProtocol: UIView {
        var cryptoImageView: UIImageView {get}
        var cryptoNameLabel: UILabel {get}
        var cryptoSubNameLabel: UILabel {get}
        var cryptoTimeStampLabel: UILabel {get}
        var priceUsdLabel: UILabel {get}
        var priceBtcLabel: UILabel {get}
        var priceEthLabel: UILabel {get}
        var changeUSDLast24hrsLabel: UILabel {get}
        var changeBTCLast24hrsLabel: UILabel {get}
        var changeETHLast24hrsLabel: UILabel {get}
        var cryptoLastTradeLabel: UILabel {get}
        var cryptoVolatility30daysLabel: UILabel {get}
        var cryptoVolatility90daysLabel: UILabel {get}
        var cryptoVolatility1yearsLabel: UILabel {get}
        var cryptoVolatility3yearsLabel: UILabel {get}
    
        var heightOfContent: CGFloat {get}
}

final class CryptoDetailView: UIView, CryptoDetailViewProtocol {
    
    private enum DimensionsCryptoDetailView {
        static let leadingInset: CGFloat = 16
        static let trailingInset: CGFloat = -16
        static let topInset: CGFloat = 16
        static let betweenInset: CGFloat = 24
        static let heightImageView: CGFloat = 100
        static let widthImageView: CGFloat = 100
        static let largeFontSize: CGFloat = 40
        static let normalFontSize: CGFloat = 16
    }
    
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
        label.font = .systemFont(ofSize: DimensionsCryptoDetailView.largeFontSize)
        label.textAlignment = .left
        return label
    }()
    
    let cryptoSubNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = .systemFont(ofSize: DimensionsCryptoDetailView.normalFontSize)
        label.textAlignment = .left
        return label
    }()
    
    let cryptoTimeStampLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = .systemFont(ofSize: DimensionsCryptoDetailView.normalFontSize)
        label.textAlignment = .left
        return label
    }()
    
    let priceUsdLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: DimensionsCryptoDetailView.normalFontSize)
        label.textAlignment = .left
        return label
    }()
    
    let priceBtcLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: DimensionsCryptoDetailView.normalFontSize)
        label.textAlignment = .left
        return label
    }()
    
    let priceEthLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: DimensionsCryptoDetailView.normalFontSize)
        label.textAlignment = .left
        return label
    }()
    
    let changeUSDLast24hrsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: DimensionsCryptoDetailView.normalFontSize)
        label.textAlignment = .left
        return label
    }()
    
    let changeBTCLast24hrsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: DimensionsCryptoDetailView.normalFontSize)
        label.textAlignment = .left
        return label
    }()
    
    let changeETHLast24hrsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: DimensionsCryptoDetailView.normalFontSize)
        label.textAlignment = .left
        return label
    }()
    
    let cryptoLastTradeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: DimensionsCryptoDetailView.normalFontSize)
        label.textAlignment = .left
        return label
    }()
    
    private let cryptoVolatilityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.text = "Volatility"
        label.font = .systemFont(ofSize: DimensionsCryptoDetailView.largeFontSize)
        label.textAlignment = .left
        return label
    }()
    
    let cryptoVolatility30daysLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = .systemFont(ofSize: DimensionsCryptoDetailView.normalFontSize)
        label.textAlignment = .left
        return label
    }()
    
    let cryptoVolatility90daysLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = .systemFont(ofSize: DimensionsCryptoDetailView.normalFontSize)
        label.textAlignment = .left
        return label
    }()
    
    let cryptoVolatility1yearsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = .systemFont(ofSize: DimensionsCryptoDetailView.normalFontSize)
        label.textAlignment = .left
        return label
    }()
    
    let cryptoVolatility3yearsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = .systemFont(ofSize: DimensionsCryptoDetailView.normalFontSize)
        label.textAlignment = .left
        return label
    }()
    
    init() {
        super.init(frame: CGRect.zero)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        setupCryptoImageView()
        setupCryptoNameLabel()
        setupCryptoSubNameLabel()
        setupCryptoTimeStampLabel()
        setupPriceUsdLabel()
        setupPriceBtcLabel()
        setupPriceEthLabel()
        setupСhangeUSDLast24hrsLabel()
        setupСhangeBTCLast24hrsLabel()
        setupСhangeETHLast24hrsLabel()
        setupСryptoLastTradeLabel()
        setupСryptoVolatilityLabel()
        setupСryptoVolatility30daysLabel()
        setupСryptoVolatility90daysLabel()
        setupСryptoVolatility1yearsLabel()
        setupСryptoVolatility3yearsLabel()
    }
    
    private func setupCryptoImageView() {
        addSubview(cryptoImageView)
        NSLayoutConstraint.activate([
            cryptoImageView.topAnchor.constraint(equalTo: topAnchor, constant: DimensionsCryptoDetailView.topInset),
            cryptoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: DimensionsCryptoDetailView.leadingInset),
            cryptoImageView.heightAnchor.constraint(equalToConstant: DimensionsCryptoDetailView.heightImageView),
            cryptoImageView.widthAnchor.constraint(equalToConstant: DimensionsCryptoDetailView.widthImageView)
        ])
    }
    
    private func setupCryptoNameLabel() {
        addSubview(cryptoNameLabel)
        NSLayoutConstraint.activate([
            cryptoNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: DimensionsCryptoDetailView.topInset),
            cryptoNameLabel.leadingAnchor.constraint(equalTo: cryptoImageView.trailingAnchor, constant: DimensionsCryptoDetailView.leadingInset)
            ])
    }
    
    private func setupCryptoSubNameLabel() {
        addSubview(cryptoSubNameLabel)
        NSLayoutConstraint.activate([
            cryptoSubNameLabel.topAnchor.constraint(equalTo: cryptoNameLabel.bottomAnchor),
            cryptoSubNameLabel.leadingAnchor.constraint(equalTo: cryptoImageView.trailingAnchor, constant: DimensionsCryptoDetailView.leadingInset)
            ])
    }
    
    private func setupCryptoTimeStampLabel() {
        addSubview(cryptoTimeStampLabel)
        NSLayoutConstraint.activate([
            cryptoTimeStampLabel.topAnchor.constraint(equalTo: cryptoSubNameLabel.bottomAnchor),
            cryptoTimeStampLabel.leadingAnchor.constraint(equalTo: cryptoImageView.trailingAnchor, constant: DimensionsCryptoDetailView.leadingInset)
            ])
    }
    
    private func setupPriceUsdLabel() {
        addSubview(priceUsdLabel)
        NSLayoutConstraint.activate([
            priceUsdLabel.topAnchor.constraint(equalTo: cryptoTimeStampLabel.bottomAnchor, constant: DimensionsCryptoDetailView.betweenInset),
            priceUsdLabel.leadingAnchor.constraint(equalTo: cryptoImageView.trailingAnchor, constant: DimensionsCryptoDetailView.leadingInset)
            ])
    }
    
    private func setupPriceBtcLabel() {
        addSubview(priceBtcLabel)
        NSLayoutConstraint.activate([
            priceBtcLabel.topAnchor.constraint(equalTo: priceUsdLabel.bottomAnchor, constant: DimensionsCryptoDetailView.betweenInset),
            priceBtcLabel.leadingAnchor.constraint(equalTo: cryptoImageView.trailingAnchor, constant: DimensionsCryptoDetailView.leadingInset)
            ])
    }
    
    private func setupPriceEthLabel() {
        addSubview(priceEthLabel)
        NSLayoutConstraint.activate([
            priceEthLabel.topAnchor.constraint(equalTo: priceBtcLabel.bottomAnchor, constant: DimensionsCryptoDetailView.betweenInset),
            priceEthLabel.leadingAnchor.constraint(equalTo: cryptoImageView.trailingAnchor, constant: DimensionsCryptoDetailView.leadingInset)
            ])
    }
    
    private func setupСhangeUSDLast24hrsLabel() {
        addSubview(changeUSDLast24hrsLabel)
        NSLayoutConstraint.activate([
            changeUSDLast24hrsLabel.topAnchor.constraint(equalTo: cryptoTimeStampLabel.bottomAnchor, constant: DimensionsCryptoDetailView.betweenInset),
            changeUSDLast24hrsLabel.leadingAnchor.constraint(equalTo: priceBtcLabel.trailingAnchor, constant: DimensionsCryptoDetailView.leadingInset)
            ])
    }
    
    private func setupСhangeBTCLast24hrsLabel() {
        addSubview(changeBTCLast24hrsLabel)
        NSLayoutConstraint.activate([
            changeBTCLast24hrsLabel.topAnchor.constraint(equalTo: priceUsdLabel.bottomAnchor, constant: DimensionsCryptoDetailView.betweenInset),
            changeBTCLast24hrsLabel.leadingAnchor.constraint(equalTo: priceBtcLabel.trailingAnchor, constant: DimensionsCryptoDetailView.leadingInset)
            ])
    }
    
    private func setupСhangeETHLast24hrsLabel() {
        addSubview(changeETHLast24hrsLabel)
        NSLayoutConstraint.activate([
            changeETHLast24hrsLabel.topAnchor.constraint(equalTo: priceBtcLabel.bottomAnchor, constant: DimensionsCryptoDetailView.betweenInset),
            changeETHLast24hrsLabel.leadingAnchor.constraint(equalTo: priceBtcLabel.trailingAnchor, constant: DimensionsCryptoDetailView.leadingInset)
            ])
    }
    
    private func setupСryptoLastTradeLabel() {
        addSubview(cryptoLastTradeLabel)
        NSLayoutConstraint.activate([
            cryptoLastTradeLabel.topAnchor.constraint(equalTo: priceEthLabel.bottomAnchor, constant: DimensionsCryptoDetailView.betweenInset),
            cryptoLastTradeLabel.leadingAnchor.constraint(equalTo: cryptoImageView.trailingAnchor, constant: DimensionsCryptoDetailView.leadingInset)
            ])
    }
    
    private func setupСryptoVolatilityLabel() {
        addSubview(cryptoVolatilityLabel)
        NSLayoutConstraint.activate([
            cryptoVolatilityLabel.topAnchor.constraint(equalTo: cryptoLastTradeLabel.bottomAnchor, constant: DimensionsCryptoDetailView.betweenInset),
            cryptoVolatilityLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: DimensionsCryptoDetailView.leadingInset)
            ])
    }
    
    private func setupСryptoVolatility30daysLabel() {
        addSubview(cryptoVolatility30daysLabel)
        NSLayoutConstraint.activate([
            cryptoVolatility30daysLabel.topAnchor.constraint(equalTo: cryptoVolatilityLabel.bottomAnchor, constant: DimensionsCryptoDetailView.betweenInset),
            cryptoVolatility30daysLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: DimensionsCryptoDetailView.leadingInset)
            ])
    }
    
    private func setupСryptoVolatility90daysLabel() {
        addSubview(cryptoVolatility90daysLabel)
        NSLayoutConstraint.activate([
            cryptoVolatility90daysLabel.topAnchor.constraint(equalTo: cryptoVolatility30daysLabel.bottomAnchor, constant: DimensionsCryptoDetailView.betweenInset),
            cryptoVolatility90daysLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: DimensionsCryptoDetailView.leadingInset)
            ])
    }
    
    private func setupСryptoVolatility1yearsLabel() {
        addSubview(cryptoVolatility1yearsLabel)
        NSLayoutConstraint.activate([
            cryptoVolatility1yearsLabel.topAnchor.constraint(equalTo: cryptoVolatility90daysLabel.bottomAnchor, constant: DimensionsCryptoDetailView.betweenInset),
            cryptoVolatility1yearsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: DimensionsCryptoDetailView.leadingInset)
            ])
    }
    
    private func setupСryptoVolatility3yearsLabel() {
        addSubview(cryptoVolatility3yearsLabel)
        NSLayoutConstraint.activate([
            cryptoVolatility3yearsLabel.topAnchor.constraint(equalTo: cryptoVolatility1yearsLabel.bottomAnchor, constant: DimensionsCryptoDetailView.betweenInset),
            cryptoVolatility3yearsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: DimensionsCryptoDetailView.leadingInset)
            ])
    }

}

extension CryptoDetailView {
    
    var heightOfContent: CGFloat {
        return 700
    }
    
}
