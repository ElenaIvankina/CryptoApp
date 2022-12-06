//
//  CryptoResponseDecoded.swift
//  CryptoApp
//
//  Created by Елена Иванкина on 14.11.2022.
//

import Foundation

enum CryptoCurrency: String, Decodable {
    case btc, eth, tron, polkadot, dogecoin, tether, stellar, cardano, xrp, luna, unknown
}

struct CryptoResponse: Decodable {
    
    static let dateFormatterISO8601 = ISO8601DateFormatter()

    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        return dateFormatter
    } ()
    
    
    let timestamp: String
    
    let symbol: String
    let name: String
    let slug: String
    let currencyType: CryptoCurrency
    
    let priceUsd: Double?
    let priceBtc: Double?
    let priceEth: Double?
    let percentChangeUsdLast24Hours: Double?
    let percentChangeBtcLast24Hours: Double?
    let percentChangeEthLast24Hours: Double?
    let lastTradeAt: String?
    
    let volatilityLast30Days: Double?
    let volatilityLast90Days: Double?
    let volatilityLast1Year: Double?
    let volatilityLast3Years: Double?
    
    static let currencyDictionary: [String: CryptoCurrency] = [
        "Bitcoin" : .btc,
        "Ethereum" : .eth,
        "TRON" : .tron,
        "Polkadot" : .polkadot,
        "Dogecoin" : .dogecoin,
        "Tether" : .tether,
        "Stellar" : .stellar,
        "Cardano" : .cardano,
        "XRP" : .xrp,
        "Terra" : .luna
    ]

    enum CodingKeys: CodingKey {
        case status
        case data
    }
    
    enum StatusKeys: CodingKey {
        case timestamp
    }
    
    enum DataKeys: String, CodingKey {
        case symbol, name, slug
        case marketData = "market_data"
        case riskMetrics = "risk_metrics"
    }
    
    enum MarketDataKeys: String, CodingKey {
        case priceUsd = "price_usd"
        case priceBtc = "price_btc"
        case priceEth = "price_eth"
        case percentChangeUsdLast24Hours = "percent_change_usd_last_24_hours"
        case percentChangeBtcLast24Hours = "percent_change_btc_last_24_hours"
        case percentChangeEthLast24Hours = "percent_change_eth_last_24_hours"
        case lastTradeAt = "last_trade_at"
    }
    
    enum RiskMetricsKeys: String, CodingKey {
        case volatilityStats = "volatility_stats"
    }
    
    enum VolatilityKeys: String, CodingKey {
        case volatilityLast30Days = "volatility_last_30_days"
        case volatilityLast90Days = "volatility_last_90_days"
        case volatilityLast1Year = "volatility_last_1_year"
        case volatilityLast3Years = "volatility_last_3_years"
    }
    
    init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      let statusContainer = try container.nestedContainer(keyedBy: StatusKeys.self, forKey: .status)
        self.timestamp = try statusContainer.decode(String.self, forKey: .timestamp)
      let dataContainer = try container.nestedContainer(keyedBy: DataKeys.self, forKey: .data)
        self.symbol = try dataContainer.decode(String.self, forKey: .symbol)
        self.name = try dataContainer.decode(String.self, forKey: .name)
        self.slug = try dataContainer.decode(String.self, forKey: .slug)
        if let currencyType = CryptoResponse.currencyDictionary[name] {
            self.currencyType = currencyType
        } else {
            self.currencyType = .unknown
        }
      let marketDataContainer = try dataContainer.nestedContainer(keyedBy: MarketDataKeys.self, forKey: .marketData)
        self.priceUsd = try marketDataContainer.decode(Double?.self, forKey: .priceUsd)
        self.priceBtc = try marketDataContainer.decode(Double?.self, forKey: .priceBtc)
        self.priceEth = try marketDataContainer.decode(Double?.self, forKey: .priceEth)
        self.percentChangeUsdLast24Hours = try marketDataContainer.decode(Double?.self, forKey: .percentChangeUsdLast24Hours)
        self.percentChangeBtcLast24Hours = try marketDataContainer.decode(Double?.self, forKey: .percentChangeBtcLast24Hours)
        self.percentChangeEthLast24Hours = try marketDataContainer.decode(Double?.self, forKey: .percentChangeEthLast24Hours)
        self.lastTradeAt = try marketDataContainer.decode(String?.self, forKey: .lastTradeAt)
      let riskMetricsContainer = try dataContainer.nestedContainer(keyedBy: RiskMetricsKeys.self, forKey: .riskMetrics)
      let volatilityContainer = try riskMetricsContainer.nestedContainer(keyedBy: VolatilityKeys.self, forKey: .volatilityStats)
        self.volatilityLast30Days = try volatilityContainer.decode(Double?.self, forKey: .volatilityLast30Days)
        self.volatilityLast90Days = try volatilityContainer.decode(Double?.self, forKey: .volatilityLast90Days)
        self.volatilityLast1Year = try volatilityContainer.decode(Double?.self, forKey: .volatilityLast1Year)
        self.volatilityLast3Years = try volatilityContainer.decode(Double?.self, forKey: .volatilityLast3Years)
    }
    

}




