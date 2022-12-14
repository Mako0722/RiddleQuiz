//
//  SelectLevelViewController.swift
//  RiddleQuiz
//
//  Created by 中田誠 on 2022/12/14.
//

import UIKit

class SelectLevelViewController: UIViewController {

    var selectTag = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let quizVC = segue.destination as! QuizViewController
        quizVC.selectLebel = selectTag
    }
    
    @IBAction func levelButtonAction(sender:UIButton){
        print(sender.tag)
        selectTag = sender.tag
        performSegue(withIdentifier: "toQuizVC", sender: nil)
    }

}
