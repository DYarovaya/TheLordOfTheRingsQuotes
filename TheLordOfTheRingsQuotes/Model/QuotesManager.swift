//
//  quotesManager.swift
//  TheLordOfTheRingsQuotes
//
//  Created by Дарья Яровая on 07.02.2021.
//

import Foundation
protocol QuotesManagerDelegate {
    func didUpdateQuote(quote: String)
}

struct QuotesManager {
    let apiUrl = "https://the-one-api.dev/v2/"
    var delegate: QuotesManagerDelegate?
    
    func fetchQuotes(characterId: String) {
        let urlString = "\(apiUrl)character/\(characterId)/quote"
        perfomeRequest(urlString: urlString)
    }
    
    func perfomeRequest(urlString: String) {
        if let url = URL(string: urlString) {
            //Create a URLSession
            let session = URLSession(configuration: .default)
            
            var request = URLRequest(url: url)
            request.setValue("Bearer wri8bZss_xM8kzyu-CJ3", forHTTPHeaderField: "Authorization")
            
            //Give the session a task
            let task = session.dataTask(with: request) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    if let quote = self.parseJSON(quotesData: safeData) {
                        self.delegate?.didUpdateQuote(quote: quote)
                    }
                    
                }
            }
            
            //Start the task
            task.resume()
           
        }
        
    }
    
    func parseJSON(quotesData: Data) -> String? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(QuotesData.self, from: quotesData)
            let randomNum = Int.random(in: 1..<decodedData.docs.count)
            print(decodedData.docs.count)
            return decodedData.docs[randomNum].dialog
        } catch{
            print(error)
            return nil
            
        }
    }
}
