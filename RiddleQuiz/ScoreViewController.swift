//
//  ScoreViewController.swift
//  RiddleQuiz
//
//  Created by 中田誠 on 2022/12/13.
//

import UIKit

class ScoreViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    
    var correct = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "\(correct)問正解!"
    }
    @IBAction func toTopButtonAction(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: true)
    }
    



}
