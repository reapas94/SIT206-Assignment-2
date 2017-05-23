//
//  QuizPage.swift
//  The Ultimate Quiz
//
//  Created by Jonathan Quinn on 18/5/17.
//  Copyright © 2017 Jonathan Quinn. All rights reserved.
//
//
import UIKit
var easyscore = String()

class QuizPage: UIViewController {
    
    let questions = ["How many bones in the adult human body?", "Which of these words is NOT a preposition", "What is a quagmire?", "How often do we have a leap year?", "What is the next number in the sequence: 2,1,3,4,7,11,18,29, ...?", "What do we call water in its solid form?", "What direction is opposite of East", "Which of these chemical elements is NOT a noble gas?", "What is part of the nervous system?", "Which of these is a hot sauce?", "What land is barren and rough, with little vegetation?", "What produces pearls?", "What is the term for a meteoroid that enters Earth's atmosphere?", "Which of these cities is the northernmost?", "What was the castle of the legendary King Arthur?","How many horns did a triceratops have?","Where is with ~425 m below sea level Earth's lowest elevation on land?","What is a male non-castrated horse that is older then 4 years?","In which of these countries is Buddhism the main religion?"]
    let answers = [["206", "512", "340"], ["her", "but", "since"], ["Difficult situtation", "A happy turn of events", "Vengeance"], ["Every four years", "Every two years", "Every six years"], ["47", "49", "53"], ["Ice", "Vapor", "Liquid"], ["West","South","North"], ["Bromine","Xenon","Argon"], ["Cerebellum","Gallbaldder","Prostate"], ["Tabasco sauce","Jelly sauce","Tartar sauce"], ["Badlands","Forest","Greenland"], ["Oyster","Sloth","Cow"], ["Meteor","Comet","Pulsar"], ["Aberdeen","Dundee","Glasgow"], ["Camelot","Norwich","Warwick"],["3","4","2"],["Dead Sea","Aral Sea","Caspian Sea"],["Stallion","Mare","Colt"],["Thailand","Mexico","Iraq"]]
    
    //Variables
    var currentQuestion = 0
    var rightAnswerPlacement:UInt32 = 0
    var score = 0
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    
    @IBOutlet weak var btnsave: UIButton!
    @IBOutlet weak var lblCorrectFalse: UILabel!
    
    @IBOutlet weak var btnagain: UIButton!
    
    @IBOutlet weak var btnmenu: UIButton!
    // Score label
    @IBOutlet weak var scorelbl: UILabel!
    
    @IBOutlet weak var nextbtn: UIButton!
    
    // Quiz label
    @IBOutlet weak var quizquestion: UILabel!
    
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
    
    
    @IBAction func SaveButton(_ sender: Any)
    {
        easyscore = scorelbl.text!
        
        let alertController = UIAlertController(title: "Easy score saved!", message: "", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        self.present(alertController, animated: true, completion: nil)
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
            quizquestion.text = "Congratulations you got  \(score)/20 on easy mode !"
            btn1.isHidden = true;
            btn2.isHidden = true;
            btn3.isHidden = true;
            lblCorrectFalse.isHidden = true;
            nextbtn.isHidden = true;
            btnmenu.isHidden = false;
            btnagain.isHidden = false;
            btnsave.isHidden = false;
            
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
