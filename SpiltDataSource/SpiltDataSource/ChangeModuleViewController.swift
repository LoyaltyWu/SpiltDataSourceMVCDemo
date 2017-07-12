//
//  ChangeModuleViewController.swift
//  SpiltDataSource
//
//  Created by LoyaltyWu on 17/7/12.
//  Copyright © 2017年 LoyaltyWu. All rights reserved.
//

import UIKit

class ChangeModuleViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBAction func addBtnTapped(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.SwallowedArray.instance.append(ModuleData(xx: Int(self.textField.text!)!))
        self.navigationController?.popViewController(animated: true)
        // self.performSegue(withIdentifier: "back", sender: nil)
    }
    @IBAction func deleteBtnTapped(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        // Controller can talk directly to their module
        if (appDelegate.SwallowedArray.instance.count > Int(textField.text!)! ){
            appDelegate.SwallowedArray.instance.remove(at: Int(textField.text!)!)
        }
        // appDelegate.SwallowedArray.instance.append(ModuleData(xx: Int(self.textField.text!)!))
        self.navigationController?.popViewController(animated: true)
        // self.performSegue(withIdentifier: "back", sender: nil)
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
