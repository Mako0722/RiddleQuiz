//
//  SelectLevelViewController.swift
//  RiddleQuiz
//
//  Created by 中田誠 on 2022/12/14.
//

import UIKit

class SelectLevelViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func levelButtonAction(sender:UIButton){
        print(sender.tag)
    }

}
