//
//  CryptoViewModel.swift
//  CryptoApp
//
//  Created by Елена Иванкина on 04.11.2022.
//

import Foundation
import UIKit.UIImageView

protocol CryptoViewModelGetDataProtocol {
    var boxIsLoading: Box<Bool>{get set}
    var boxCryptoResponses: Box<[CryptoResponse]>{get set}
    var boxErrorDescription: Box<(hasError: Bool,describing: String)>{get set}
    func getData()
    func sort(descending: Bool)
}

protocol CryptoViewModelConfigureTableViewCellProtocol {
    func configureCryptoTableViewCell (cell: CryptoTableViewCell, cryptoModel: CryptoResponse)
}

final class CryptoViewModel: CryptoViewModelGetDataProtocol, CryptoViewModelConfigureTableViewCellProtocol {
    
    private let networkService: NetworkServiceProtocol = NetworkService()
    var boxIsLoading: Box<Bool> = Box(false)    
    private var cryptoResponses: [CryptoResponse] = []
    var boxCryptoResponses: Box<[CryptoResponse]> = Box([])
    var boxErrorDescription: Box<(hasError: Bool,describing: String)> = Box((false, ""))
    
    func getData() {
        let group = DispatchGroup()
                    
        for (_,value) in CryptoResponse.currencyDictionary {
            boxIsLoading.value = true
            group.enter()
            networkService.getCurrencyData(currency: value.rawValue) { [weak self] (data, error) in
                if let self = self, let crypto = data {
                    self.cryptoResponses.append(crypto)
                    self.boxErrorDescription.value = (false, "")
                    group.leave()
                } else if let self = self, let error = error {
                    switch error {
                    case .noInternetConnection(let describing): self.boxErrorDescription.value = (true, describing)
                    }
                }
            }
        }
            
        group.notify(queue: .main) { [weak self] in
                guard let self = self else {return}
                self.boxIsLoading.value = false
                self.boxCryptoResponses.value = self.cryptoResponses
        }
    }
    
    func sort(descending: Bool) {
        if descending {
            boxCryptoResponses.value.sort(by: {$0.percentChangeUsdLast24Hours ?? -100 > $1.percentChangeUsdLast24Hours ?? -100})
        } else {
            boxCryptoResponses.value.sort(by: {$0.percentChangeUsdLast24Hours ?? 100 < $1.percentChangeUsdLast24Hours ?? 100})
        }
    }
    
    func configureCryptoTableViewCell (cell: CryptoTableViewCell, cryptoModel: CryptoResponse) {
        cell.accessoryType = .disclosureIndicator
        cell.backgroundColor = .white
        cell.cryptoImageView.image = cryptoModel.imageConverted
        cell.cryptoNameLabel.text = cryptoModel.nameConverted
        cell.priceUsdLabel.text = cryptoModel.priceUsdConverted
        cell.priceBtcLabel.text = cryptoModel.priceBtcConverted
        cell.changeUSDLast24hrsLabel.text = cryptoModel.changeUSDLast24hrsConverted
        cell.changeUSDLast24hrsLabel.textColor = cryptoModel.colorOfChangingUSDConverted
    }
        
}
