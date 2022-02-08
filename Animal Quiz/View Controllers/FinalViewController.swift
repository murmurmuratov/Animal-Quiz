//
//  FinalViewController.swift
//  Animal Quiz
//
//  Created by Александр Муратов on 30.01.2022.
//

import UIKit

class FinalViewController: UIViewController {
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var resultDescriptionLabel: UILabel!
    
    var answerChosen: [Answer] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        let maxAnimal = getMaxAnimal()
        updateUI(with: maxAnimal)
    }
}

// MARK: - Private
extension FinalViewController {
    private func getMaxAnimal() -> AnimalType? {
        return Dictionary(grouping: answerChosen, by: { $0.type })
            .sorted(by: {$0.value.count > $1.value.count})
            .first?.key
    }
    
    private func updateUI(with animal: AnimalType?) {
        resultLabel.text = "Вы — \(animal?.rawValue ?? "🐶" )!"
        resultDescriptionLabel.text = animal?.definition ?? ""
    }
}
