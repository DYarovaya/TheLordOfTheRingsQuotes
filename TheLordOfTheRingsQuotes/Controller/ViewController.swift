//
//  ViewController.swift
//  TheLordOfTheRingsQuotes
//
//  Created by Дарья Яровая on 07.02.2021.
//

import UIKit

class ViewController: UIViewController, QuotesManagerDelegate {
    var quotesManager = QuotesManager()
    var characterName = "Frodo"
    
    @IBOutlet weak var quoteLbl: UILabel!
    
    var characters = ["Frodo": "5cd99d4bde30eff6ebccfc15",
                      "Gandalf": "5cd99d4bde30eff6ebccfea0",
                      "Legolas": "5cd99d4bde30eff6ebccfd81",
                      "Gollum": "5cd99d4bde30eff6ebccfe9e",
                      "Bilbo": "5cd99d4bde30eff6ebccfc38",
                      "Gimli": "5cd99d4bde30eff6ebccfd23",
                      "Samwise": "5cd99d4bde30eff6ebccfd0d",
                      "Peregrin": "5cd99d4bde30eff6ebccfe2e",
                      "Saruman": "5cd99d4bde30eff6ebccfea4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quotesManager.delegate = self
        quotesManager.fetchQuotes(characterId: characters["Frodo"] ?? "")
    }

    @IBAction func characterBtn(_ sender: UIButton) {
        characterName = (sender.titleLabel?.text)!
        quotesManager.fetchQuotes(characterId: characters[characterName] ?? "")
    }
    
    func didUpdateQuote(quote: String) {
        DispatchQueue.main.async {
            self.quoteLbl.text = quote
        }
    }
    
    @IBAction func anotherQuotesPressed(_ sender: UIButton) {
        quotesManager.fetchQuotes(characterId: characters[characterName] ?? "")
    }
}

