//
//  QuotesData.swift
//  TheLordOfTheRingsQuotes
//
//  Created by Дарья Яровая on 07.02.2021.
//

import Foundation


struct QuotesData: Decodable {
    
    let docs: [Docs]
    
    struct Docs: Decodable {
        let dialog: String
    }
    
}
