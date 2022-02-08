//
//  FinalViewController.swift
//  Animal Quiz
//
//  Created by Александр Муратов on 30.01.2022.
//

import UIKit

class FinalViewController: UIViewController {
    
    
    @IBOutlet var finalNavigationItem: UINavigationItem!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var resultDescriptionLabel: UILabel!
    
    var answerChosen: [Answer] = []
    
    private var animalsTypesCounts: [AnimalType: Int] = [.turtle: 0,
                                                       .dog: 0,
                                                       .cat: 0,
                                                       .rabbit: 0]
    private var mostFrequentAnimalType: AnimalType!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        finalNavigationItem.setHidesBackButton(true, animated: true)
        
        countAnimalsTypes()
        determineMostFrequentAnimalType()
        
        resultLabel.text = "Вы — \(mostFrequentAnimalType.rawValue)!"
        resultDescriptionLabel.text = mostFrequentAnimalType.definition
    }
    
    
}

// MARK: - Private
extension FinalViewController {
    private func countAnimalsTypes() {
        for animal in answerChosen {
            switch animal.type {
            case .turtle:
                animalsTypesCounts[.turtle]! += 1
            case .rabbit:
                animalsTypesCounts[.rabbit]! += 1
            case .cat:
                animalsTypesCounts[.cat]! += 1
            case .dog:
                animalsTypesCounts[.dog]! += 1
            }
        }
    }
    
    private func determineMostFrequentAnimalType() {
        let type = animalsTypesCounts.max { a, b in a.value < b.value }
        mostFrequentAnimalType = type?.key
    }
}
