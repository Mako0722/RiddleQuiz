//
//  QuizViewController.swift
//  RiddleQuiz
//
//  Created by 中田誠 on 2022/12/13.
//

import UIKit

class QuizViewController: UIViewController {
    @IBOutlet weak var quizNumberLabel: UILabel!
    @IBOutlet weak var quizTextView: UITextView!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
    @IBOutlet weak var judgelmageView: UIImageView!
    var csvArray: [String] = []
    var quizArray: [String] = []
    var quizCount = 0
    var correctCount = 0
    var selectLebel = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("選択したのはレベル\(selectLebel)")
        
        csvArray = loadCSV(fileName: "quiz\(selectLebel)")
        print(csvArray)
        
        quizArray = csvArray[quizCount].components(separatedBy: ",")
        quizNumberLabel.text = "第\(quizCount + 1)問"
        quizTextView.text = quizArray[0]
        answerButton1.setTitle(quizArray[2], for: .normal)
        answerButton2.setTitle(quizArray[3], for: .normal)
        answerButton3.setTitle(quizArray[4], for: .normal)
        answerButton4.setTitle(quizArray[5], for: .normal)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let scoreVC = segue.destination as! ScoreViewController
        scoreVC.correct = correctCount
    }
    
    
    @IBAction func btnAction(sender: UIButton) {
        if sender.tag == Int(quizArray[1]) {
            print("正解")
            correctCount += 1
            judgelmageView.image = UIImage(named: "correct")
        } else {
            print("不正解")
            judgelmageView.image = UIImage(named: "incorrect")
        }
        judgelmageView.isHidden = false
        answerButton1.isEnabled = false
        answerButton2.isEnabled = false
        answerButton3.isEnabled = false
        answerButton4.isEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            self.judgelmageView.isHidden = true
            self.answerButton1.isEnabled = true
            self.answerButton2.isEnabled = true
            self.answerButton3.isEnabled = true
            self.answerButton4.isEnabled = true
            self.nextQuiz()
        }
        
    }
        
        func nextQuiz() {
            quizCount += 1
            if quizCount < csvArray.count {
                quizArray = csvArray[quizCount].components(separatedBy: ",")
                quizNumberLabel.text = "第\(quizCount + 1)問"
                quizTextView.text = quizArray[0]
                answerButton1.setTitle(quizArray[2], for: .normal)
                answerButton2.setTitle(quizArray[3], for: .normal)
                answerButton3.setTitle(quizArray[4], for: .normal)
                answerButton4.setTitle(quizArray[5], for: .normal)
            } else {
                performSegue(withIdentifier: "toScoreVC", sender: nil)
            }
        }
    
    func loadCSV(fileName: String) -> [String] {
        let csvBundle = Bundle.main.path(forResource: fileName, ofType: "csv")!
        do {
            let csvDate = try String(contentsOfFile: csvBundle, encoding: String.Encoding.utf8)
            let lineChange = csvDate.replacingOccurrences(of: "\r", with: "\n")
            csvArray = lineChange.components(separatedBy: "\n")
            csvArray.removeLast()
        } catch {
            print("エラー")
        }
        return csvArray
    }

}
