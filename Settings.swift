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
    @IBOutlet weak var pillAlertSettingsTxtFld: UITextField!
    @IBOutlet weak var placeboAlertSettingsTxtFld: UITextField!
    @IBOutlet weak var refillAlertSettingsTxtFld: UITextField!
    
    @IBAction func backTouched(_ sender: Any) {
        UserDefaults.standard.set(numPillsSettingsTxtFld.text, forKey: "numPills")
        UserDefaults.standard.set(numPlacebosSettingsTxtFld.text, forKey: "numPlacebos")
        UserDefaults.standard.set(numDaysOffSettingsTxtFld.text, forKey: "numDaysOff")
        UserDefaults.standard.set(pillAlertSettingsTxtFld.text, forKey: "pillAlert")
        UserDefaults.standard.set(placeboAlertSettingsTxtFld.text, forKey: "placeboAlert")
        UserDefaults.standard.set(refillAlertSettingsTxtFld.text, forKey: "refillAlert")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let numPills = UserDefaults.standard.value(forKey : "numPills") {
            numPillsSettingsTxtFld.text = numPills as? String
        }
        if let numPlacebos = UserDefaults.standard.value(forKey : "numPlacebos") {
            numPlacebosSettingsTxtFld.text = numPlacebos as? String
        }
        if let numDaysOff = UserDefaults.standard.value(forKey : "numDaysOff") {
            numDaysOffSettingsTxtFld.text = numDaysOff as? String
        }
        if let pillAlert = UserDefaults.standard.value(forKey : "pillAlert") {
            pillAlertSettingsTxtFld.text = pillAlert as? String
        }
        if let placeboAlert = UserDefaults.standard.value(forKey : "placeboAlert") {
            placeboAlertSettingsTxtFld.text = placeboAlert as? String
        }
        if let refillAlert = UserDefaults.standard.value(forKey : "refillAlert") {
            refillAlertSettingsTxtFld.text = refillAlert as? String
        }





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
