//
//  ViewController.swift
//  The Ultimate Quiz
//
//  Created by Jonathan Quinn on 28/4/17.
//  Copyright © 2017 Jonathan Quinn. All rights reserved.
//
//
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ultimatequiztitle: UILabel!
    
    @IBAction func quit(_ sender: Any)
    {
        exit(0)
    }
    
    @IBAction func EasyMode(_ sender: Any)
    {
        // performSegue(withIdentifer: "easysegue", sender: self)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ultimatequiztitle.layer.borderWidth = 1.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

