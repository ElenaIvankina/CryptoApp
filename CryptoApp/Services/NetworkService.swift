//
//  NetworkService.swift
//  CryptoApp
//
//  Created by Елена Иванкина on 10.11.2022.
//

import Foundation

protocol NetworkServiceProtocol {
    func getCurrencyData(currency: String, completion: @escaping (CryptoResponse?, NetworkingErrors?) -> Void)
}

enum NetworkingErrors: Error {
    case noInternetConnection (String)
}

final class NetworkService: NetworkServiceProtocol {
    
    private let defaultSession = URLSession(configuration: .default)
    
    private var components: URLComponents = {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "data.messari.io"
        return components
    }()

    func getCurrencyData(currency: String, completion: @escaping (CryptoResponse?, NetworkingErrors?) -> Void) {

        components.path = "/api/v1/assets/\(currency)/metrics"
        
        guard let url = components.url else {return}
        
        let dataTask = defaultSession.dataTask(with: url) { data, response, error in
            
          if let error = error {
              DispatchQueue.main.async {
                  completion(nil, NetworkingErrors.noInternetConnection("\(error.localizedDescription)"))
              }
          } else if
            let data = data {
              do {
                let decoder = JSONDecoder()
                let cryptoResponse = try decoder.decode(CryptoResponse.self, from: data)
                  DispatchQueue.main.async {
                      completion(cryptoResponse, nil)
                  }
              } catch let parseError as NSError {
                print(parseError.localizedDescription)
                return
              }
          } else {
              print("No data, no error")
          }
        }
        dataTask.resume()
    }
    
}
