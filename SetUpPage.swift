//
//  SetUpPage.swift
//  OrchidApp
//
//  Created by Jade Meyer on 2/4/18.
//  Copyright © 2018 Jade Meyer. All rights reserved.
//

import UIKit

class SetUpPage: UIViewController {

    @IBOutlet weak var numPillsTxtFld: UITextField!
    @IBOutlet weak var numPlacebosTxtFld: UITextField!
    @IBOutlet weak var numDaysOffTxtFld: UITextField!
    
    @IBAction func goTouched(_ sender: UIButton) {
        GlobalVariable.numPills = numPillsTxtFld.text!
        GlobalVariable.numPlacebos = numPlacebosTxtFld.text!
        GlobalVariable.numDaysOff = numDaysOffTxtFld.text!
        performSegue(withIdentifier: "toMainSegue", sender: UIButton())
    }
    
    struct GlobalVariable {
        static var numPills = String()
        static var numPlacebos = String()
        static var numDaysOff = String()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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

