//
//  ExtensionCryptoResponse.swift
//  CryptoApp
//
//  Created by Елена Иванкина on 11.11.2022.
//

import Foundation
import UIKit.UIImageView

extension CryptoResponse {
    
    var imageConverted: UIImage {
        return UIImage(named: currencyType.rawValue) ?? UIImage()
    }
    
    var nameConverted: String {
        return name.lowercased().capitalized
    }
    
    var subNameConverted: String {
        return symbol.lowercased()
    }
    
    var timeStampConverted: String {
        let timeToConvert = timestamp.components(separatedBy: ".")[0] + "Z"
        guard let data = CryptoResponse.dateFormatterISO8601.date(from:timeToConvert) else {return ""}
        let dataToShow = CryptoResponse.dateFormatter.string(from: data)
        return dataToShow
    }
    
    var priceUsdConverted: String {
        return priceUsd?.usdFormat ?? "No data"
    }
      
    var priceBtcConverted: String {
        return priceBtc?.btcFormat ?? "No data"
    }
    
    var priceEthConverted: String {
        return priceEth?.ethFormat ?? "No data"
    }
      
    var changeUSDLast24hrsConverted: String {
        return percentChangeUsdLast24Hours?.percentChangeFormat ?? ""
    }
    
    var changeBTCLast24hrsConverted: String {
        return percentChangeBtcLast24Hours?.percentChangeFormat ?? ""
    }
    
    var changeETHLast24hrsConverted: String {
        return percentChangeEthLast24Hours?.percentChangeFormat ?? ""
    }
      
    var colorOfChangingUSDConverted: UIColor {
        guard let change = percentChangeUsdLast24Hours else { return .white }
        return change >= 0 ? .green : .red
    }
    
    var colorOfChangingBTCConverted: UIColor {
        guard let change = percentChangeBtcLast24Hours else { return .white }
        return change >= 0 ? .green : .red
    }
    
    var colorOfChangingETHConverted: UIColor {
        guard let change = percentChangeEthLast24Hours else { return .white }
        return change >= 0 ? .green : .red
    }
    
    var lastTradeConverted: String {
        guard let lastTrade = lastTradeAt else {return ""}
        guard let data = CryptoResponse.dateFormatterISO8601.date(from: lastTrade) else {return ""}
        let dataToShow = CryptoResponse.dateFormatter.string(from: data)
        return "Last trade " + dataToShow
    }
    
    var volatility30daysConverted: String {
        guard let volatility = volatilityLast30Days else { return "No data" }
        return "Volatility last 30 days: " + volatility.volatilityFormat
    }
    
    var volatility90daysConverted: String {
        guard let volatility = volatilityLast90Days else { return "" }
        return "Volatility last 90 days: " + volatility.volatilityFormat
    }
    
    var volatility1yearConverted: String {
        guard let volatility = volatilityLast1Year else { return "" }
        return "Volatility last 1 year: " + volatility.volatilityFormat
    }
    
    var volatility3yearsConverted: String {
        guard let volatility = volatilityLast3Years else { return "" }
        return "Volatility last 3 years: " + volatility.volatilityFormat
    }
}
