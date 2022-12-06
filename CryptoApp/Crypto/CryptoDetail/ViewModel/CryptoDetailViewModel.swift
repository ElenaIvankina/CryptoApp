//
//  CryptoDetailViewModel.swift
//  CryptoApp
//
//  Created by Елена Иванкина on 15.11.2022.
//

import Foundation
import UIKit.UIImageView

protocol CryptoDetailViewModelConfigureViewProtocol {
    func configureCryptoDetailView (view: CryptoDetailViewProtocol, cryptoModel: CryptoResponse)
}

final class CryptoDetailViewModel: CryptoDetailViewModelConfigureViewProtocol {
    
    func configureCryptoDetailView (view: CryptoDetailViewProtocol, cryptoModel: CryptoResponse) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.cryptoImageView.image = cryptoModel.imageConverted
        view.cryptoNameLabel.text = cryptoModel.nameConverted
        view.cryptoSubNameLabel.text = cryptoModel.subNameConverted
        view.cryptoTimeStampLabel.text = cryptoModel.timeStampConverted
        view.priceUsdLabel.text = cryptoModel.priceUsdConverted
        view.priceBtcLabel.text = cryptoModel.priceBtcConverted
        view.priceEthLabel.text = cryptoModel.priceEthConverted
        view.changeUSDLast24hrsLabel.text = cryptoModel.changeUSDLast24hrsConverted
        view.changeUSDLast24hrsLabel.textColor = cryptoModel.colorOfChangingUSDConverted
        view.changeBTCLast24hrsLabel.text = cryptoModel.changeBTCLast24hrsConverted
        view.changeBTCLast24hrsLabel.textColor = cryptoModel.colorOfChangingBTCConverted
        view.changeETHLast24hrsLabel.text = cryptoModel.changeETHLast24hrsConverted
        view.changeETHLast24hrsLabel.textColor = cryptoModel.colorOfChangingETHConverted
        view.cryptoLastTradeLabel.text = cryptoModel.lastTradeConverted
        view.cryptoVolatility30daysLabel.text = cryptoModel.volatility30daysConverted
        view.cryptoVolatility90daysLabel.text = cryptoModel.volatility90daysConverted
        view.cryptoVolatility1yearsLabel.text = cryptoModel.volatility1yearConverted
        view.cryptoVolatility3yearsLabel.text = cryptoModel.volatility3yearsConverted
    }
    
}
