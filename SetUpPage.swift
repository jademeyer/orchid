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
    @IBOutlet weak var pillAlertTxtFld: UITextField!
    @IBOutlet weak var placeboAlertTxtFld: UITextField!
    @IBOutlet weak var refillAlertTxtFld: UITextField!
    
    @IBAction func goTouched(_ sender: Any) {
        UserDefaults.standard.set(numPillsTxtFld.text, forKey: "numPills")
        UserDefaults.standard.set(numPlacebosTxtFld.text, forKey: "numPlacebos")
        UserDefaults.standard.set(numDaysOffTxtFld.text, forKey: "numDaysOff")
        UserDefaults.standard.set(pillAlertTxtFld.text, forKey: "pillAlert")
        UserDefaults.standard.set(placeboAlertTxtFld.text, forKey: "placeboAlert")
        UserDefaults.standard.set(refillAlertTxtFld.text, forKey: "refillAlert")
        performSegue(withIdentifier: "toMainSegue", sender: self)
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
