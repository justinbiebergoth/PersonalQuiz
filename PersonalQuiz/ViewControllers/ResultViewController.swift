//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by hiirari on 06.10.2022.
//

import UIKit

class ResultViewController: UIViewController {
    

    @IBOutlet var animalLogoLabel: UILabel!
    @IBOutlet var animalDiscriptionTV: UITextView!
    
    var answersChosen: [Answer]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
}
extension ResultViewController {
    private func updateResult() {
        var CommonAnimal: [Animal: Int] = [:]
        let animals = answersChosen.map { $0.animal }
        
        for animal in animals {
            CommonAnimal[animal, default: 0] += 1
        }
        
        let sortedCommonAnimal = CommonAnimal.sorted{$0.value > $1.value}
        guard let mostCommonAnimal = sortedCommonAnimal.first?.key else { return }
        
        updateUI(with: mostCommonAnimal)
    }
    private func updateUI(with animal: Animal) {
        animalLogoLabel.text = "Вы - \(animal.rawValue)"
        animalDiscriptionTV.text = animal.definition
}
}


