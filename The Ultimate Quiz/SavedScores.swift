//
//  SavedScores.swift
//  The Ultimate Quiz
//
//  Created by Jonathan Quinn on 21/5/17.
//  Copyright © 2017 Jonathan Quinn. All rights reserved.
//
//
import UIKit

class SavedScores: UIViewController {

    
    @IBOutlet weak var scorelabel: UILabel!
    
    @IBAction func Reset(_ sender: Any)
    {
        scorelabel.text = ""
    }
    
    
    @IBAction func loadscores(_ sender: Any)
    {
        scorelabel.text = "Easy \(easyscore)\nMedium \(medscore)\nHard \(hardscore)"

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
