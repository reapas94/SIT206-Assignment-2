//
//  quizhard.swift
//  The Ultimate Quiz
//
//  Created by Jonathan Quinn on 21/5/17.
//  Copyright © 2017 Jonathan Quinn. All rights reserved.
//

import UIKit
var hardscore = String()

class quizhard: UIViewController {

    
    let questions = ["Who composed 'Swan Lake'?","What is a traditional Korean House?","What genus of bacteria is responsible for leprosy and tuberculosis?","From what country did the Kosovo declare independence in 2008?","What is polyvinyl chloride?","What is measured in Candela?","Where did the religion named Taoism orginiate?","What is the hottest substance ever created?","The reduction of pressure when a liquid passes a choke point of a pipe is called...?","What do we call atoms that have the same atomic number but a different atomic mass?","What is the adherence to accepted religious norms?","Coeliax disease is caused by an immune response to ...?","What planetary system is closest to the solar system?","Which molecule does NOT have oxygen in its structure?","What is the opposite of ebullient?","Who is Alan Greenspan?","In what city were 'The Hanging Gardens' purportedly built?","What is a supernova?","Humans are ...?","What was the capital of Itality between 1865 and 1871",]
    let answers = [["Peter Tchaikovsky", "Vladimir Vavilov", "Nikolei Rimsky"], ["Hanok", "Jeogori", "Jeonjaemu"], ["Mycobacterium", "Acidimicrobium", "Coriobacteriales"], ["Serbia", "Albania", "Croatia"], ["Plastic", "Drug", "Antibiotic"], ["Luminous Intesity", "Magnetic Flux", "Electric Current"], ["China","India","Uganda"], ["Quark gluon plasma","Helium-3","Rydberg Matter"], ["Venturi effect","Kaye effect","Marangoni Effect"], ["Isotapes","Hardrons","Bosons"], ["Orthodoxy","Othogonality","Orthography"], ["Gluten","Peanuts","Garlic"], ["Alpha Centauri","Kepler 64","Delta Cephei"], ["Ammonia","Ozone","Water"], ["Tranquil","Agog","Prevaricate"],["Economist","Novelist","Pianist"],["Babylon","Athens","Damascus"],["Exploding star","Newborn star","Distant quasar"],["Omnivorous","Fossorial","Holometabolic"], ["Florence","Rome","Genoa"]]
    
    var currentQuestion = 0
    var rightAnswerPlacement:UInt32 = 0
    var score = 0
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    
    @IBOutlet weak var lblCorrectFalse: UILabel!
    
    @IBOutlet weak var btnagain: UIButton!
    
    @IBOutlet weak var btnsave: UIButton!
    @IBOutlet weak var btnmenu: UIButton!
    // Score label
    @IBOutlet weak var scorelbl: UILabel!
    
    @IBOutlet weak var nextbtn: UIButton!
    
    // Quiz label
    @IBOutlet weak var quizquestion: UILabel!
    
    @IBAction func SaveBtn(_ sender: Any)
    {
        hardscore = scorelbl.text!
        
        let alertController = UIAlertController(title: "Hard score saved!", message: "", preferredStyle: .alert)
        
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
            quizquestion.text = "Congratulations you got  \(score)/20 on hard mode !"
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
