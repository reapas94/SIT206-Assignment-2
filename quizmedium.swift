//
//  quizmedium.swift
//  The Ultimate Quiz
//
//  Created by Jonathan Quinn on 21/5/17.
//  Copyright © 2017 Jonathan Quinn. All rights reserved.
//

import UIKit
var medscore = String()

class quizmedium: UIViewController {

    let questions = ["What is a smaller metropoliton area which is close to, but mostly independent of a larger city? ", "Which of these months is named after a Roman emperor?", "Who discovered Penicillin?", "Which organisms are made of one single cell?", "Which river flows through Paris?", "Which river flows through Paris?", "Which is quickly absorbed through the walls of the stomach?", "How did the female Black Widow spider get its name?", "What is the cause of most earthquakes?", "What is a cod?", "In which country can we find the town called Tequila", "8^(2/3) = ?", "What was the main language in the Roman Empire?", "What is another term for kneecap?", "What is the art of beautiful handwriting?","How did Alaska become part of the USA in 1867?","Which disease is likely to be transmitted during kissing?","What is the defining feature of the Manx cat?","How many eyes does a Cyclops have?"]
    let answers = [["Sattelite town", "Adjuvant town", "Collateral town"], ["August", "Stember", "March"], ["Alexander Fleming", "Marie Curie", "Robert Koch"], ["Bacteria", "Arthropoda", "Viruses"], ["Seine", "Rhone", "Loire"], ["Arizona", "Delaware", "Maine"], ["Alcohol","Butter","Ice Cream"], ["Eats the male after mating","Returns home only once a year","Brings death to humans"], ["Plate movement","Earth rotation","Wind direction"], ["Fish","Insect","Mammal"], ["Mexico","Peru","Bolivia"], ["4","1/2","6"], ["Latin","Greek","Italian"], ["Patella","Sternum","Mandible"], ["Calligraphy","Pantology","Fontacy"],["Purchase","Invasion","Discovery"],["Mononucleosis","Hepatitis B","Diabetes"],["Short Tail","Ears like a rabbit","No claws"],["1","0","2"]]
    
    var currentQuestion = 0
    var rightAnswerPlacement:UInt32 = 0
    var score = 0
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    
    
    @IBOutlet weak var savebtn: UIButton!
    @IBOutlet weak var lblCorrectFalse: UILabel!
    
    @IBOutlet weak var btnagain: UIButton!
    
    @IBOutlet weak var btnmenu: UIButton!
    // Score label
    @IBOutlet weak var scorelbl: UILabel!
    
    @IBOutlet weak var nextbtn: UIButton!
    
    // Quiz label
    @IBOutlet weak var quizquestion: UILabel!
    
    @IBAction func SaveBtn(_ sender: Any)
    {
        medscore = scorelbl.text!
        
        let alertController = UIAlertController(title: "Medium score saved!", message: "", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    // Quiz button
    @IBAction func quizbutton(_ sender: AnyObject)
    {
        if (sender.tag == Int(rightAnswerPlacement))
        {
            
            print ("RIGHT!")
            lblCorrectFalse.isHidden = false
            lblCorrectFalse.text = "Correct"
            lblCorrectFalse.backgroundColor = UIColor.green
            lblCorrectFalse.layer.borderWidth = 1.0
            score += 1
            scorelbl.text = "Score : \(score)"
            nextbtn.isHidden = false
            btn1.isEnabled = false
            btn2.isEnabled = false
            btn3.isEnabled = false
        }
        else
        {
            print ("WRONG!!!")
            lblCorrectFalse.isHidden = false
            lblCorrectFalse.text = "False"
            lblCorrectFalse.backgroundColor = UIColor.red
            lblCorrectFalse.layer.borderWidth = 1.0
            nextbtn.isHidden = false
            btn1.isEnabled = false
            btn2.isEnabled = false
            btn3.isEnabled = false
        }
        
        
        
        //        if (currentQuestion != questions.count)
        //        {
        //
        //            lblCorrectFalse.isHidden = true
        //
        //            newQuestion()
        //            //quizbtnlabel.backgroundColor = UIColor.white
        //        }
        //        else
        //        {
        //
        //        }
    }
    
    @IBAction func btnNext(_ sender: Any)
    {
        if (currentQuestion != questions.count)
        {
            
            lblCorrectFalse.isHidden = true
            nextbtn.isHidden = true
            newQuestion()
            btn1.isEnabled = true
            btn2.isEnabled = true
            btn3.isEnabled = true
            //quizbtnlabel.backgroundColor = UIColor.white
        }
        else
        {
            // performSegue(withIdentifer: "easysegue", sender: self)
            // performSegue(withIdentifier: "easyfinish", sender: nil)
            quizquestion.text = "Congratulations you got  \(score)/20 on medium mode !"
            btn1.isHidden = true;
            btn2.isHidden = true;
            btn3.isHidden = true;
            lblCorrectFalse.isHidden = true;
            nextbtn.isHidden = true;
            btnmenu.isHidden = false;
            btnagain.isHidden = false;
            savebtn.isHidden = false;
            
        }
    }
    
    @IBAction func mainmenu(_ sender: Any)
    {
        
    }
    
    @IBAction func PlayAgain(_ sender: Any)
    {
        btnmenu.isHidden = true;
        btnagain.isHidden = true;
        btn1.isHidden = false;
        btn2.isHidden = false;
        btn3.isHidden = false;
        btn1.isEnabled = true
        btn2.isEnabled = true
        btn3.isEnabled = true
        score = 0
        scorelbl.text = "Score : \(score)"
        currentQuestion = 0
        rightAnswerPlacement = 0
        newQuestion()
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        newQuestion()
    }
    
    // Function that displays new question
    func newQuestion()
    {
        
        
        quizquestion.text = questions[currentQuestion]
        
        rightAnswerPlacement = arc4random_uniform(3)+1
        
        //Create a button
        var button:UIButton = UIButton()
        
        var x = 1
        
        for i in 1...3
        {
            //Create a button
            button = view.viewWithTag(i) as! UIButton
            
            if (i == Int(rightAnswerPlacement))
            {
                button.setTitle(answers[currentQuestion][0], for: .normal)
            }
            else
            {
                button.setTitle(answers[currentQuestion][x], for: .normal)
                x = 2
            }
        }
        
        currentQuestion += 1
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //scorelbl.layer.borderWidth = 1.0
        quizquestion.layer.borderWidth = 1.0
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
