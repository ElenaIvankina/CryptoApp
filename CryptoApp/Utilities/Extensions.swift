//
//  Extensions.swift
//  CryptoApp
//
//  Created by Елена Иванкина on 01.12.2022.
//

import Foundation

extension Double {
    
    var usdFormat: String {
        return "$ " + String(format: "%.2f", self)
    }
    
    var btcFormat: String {
        return String(format: "%.8f", self) + " BTC"
    }
    
    var ethFormat: String {
        return String(format: "%.8f", self) + " ETH"
    }
    
    var percentChangeFormat: String {
        return String(format: "%.2f", self) + "%"
    }
    
    var volatilityFormat: String {
        return String(format: "%.8f", self)
    }
    
}

