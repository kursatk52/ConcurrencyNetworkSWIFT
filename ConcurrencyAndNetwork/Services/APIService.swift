//
//  UserAPIService.swift
//  ConcurrencyAndNetwork
//
//  Created by Kursat Korkmaz on 13.02.2023.
//

import Foundation

class APIService{
    static let shared = APIService()
    
    func fetchJSON<T:Decodable>(url: String) async throws -> [T]{
        

        
        guard let dataURL = URL(string: url)
        else{
            throw APIErrors.URLError
        }
        
        do{
            let (data,response) = try await URLSession.shared.data(from: dataURL)
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200
            else{
                throw APIErrors.ServerError
            }
            
            let jsonDecoder = JSONDecoder()
            do{
                return try jsonDecoder.decode([T].self, from: data)
            }catch{
                throw APIErrors.DataDecodingError
            }
            
        }catch{
            throw APIErrors.FetchError
        }
    }
}
