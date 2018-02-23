//
//  Settings.swift
//  OrchidApp
//
//  Created by Jade Meyer on 2/3/18.
//  Copyright © 2018 Jade Meyer. All rights reserved.
//

import UIKit

class Settings: UIViewController {
    
    @IBOutlet weak var numPillsSettingsTxtFld: UITextField!
    @IBOutlet weak var numPlacebosSettingsTxtFld: UITextField!
    @IBOutlet weak var numDaysOffSettingsTxtFld: UITextField!
    
    @IBAction func backTouched(_ sender: Any) {
        SetUpPage.GlobalVariable.numPills = numPillsSettingsTxtFld.text!
        SetUpPage.GlobalVariable.numPlacebos = numPlacebosSettingsTxtFld.text!
        SetUpPage.GlobalVariable.numDaysOff = numDaysOffSettingsTxtFld.text!
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numPillsSettingsTxtFld.text = SetUpPage.GlobalVariable.numPills
        numPlacebosSettingsTxtFld.text = SetUpPage.GlobalVariable.numPlacebos
        numDaysOffSettingsTxtFld.text = SetUpPage.GlobalVariable.numDaysOff

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
