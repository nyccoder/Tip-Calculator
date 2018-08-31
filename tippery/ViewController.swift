//
//  ViewController.swift
//  tippery
//
//  Created by Hein Soe on 8/27/18.
//  Copyright © 2018 Hein Soe. All rights reserved.
//

//TODO: Add Simple and advance tipping button
//TODO: Update On Design


import UIKit


class ViewController: UIViewController {
   
   var billAmt:Double = 0.0
   var tip:Double = 0.0
   var total:Double {
      get {
         return billAmt + tip
      }
   }
   
   @IBOutlet weak var billLabel: UITextField!
   @IBOutlet weak var tipAmt: UILabel!
   @IBOutlet weak var totalAmt: UILabel!
   @IBOutlet weak var presetPercent: UISegmentedControl!
   
   @IBOutlet weak var tipSlider: UISlider!
   @IBOutlet weak var customSlideLbl: UILabel!
   
   @IBOutlet weak var customSwitch: UISwitch!
   
   let tipPercent = [0.1, 0.15, 0.2]
   
   @IBAction func switchChanged(_ sender: Any) {
      if (customSwitch.isOn) {
//         print("Switch is on")
         tipSlider.value = Float(tipPercent[presetPercent.selectedSegmentIndex])
         customSlideLbl.text = String(format: "(%.2f %%)", tipSlider.value * 100)
         tipSlider.isHidden = false
         presetPercent.isHidden = true
      } else {
         tipSlider.value = Float(tipPercent[presetPercent.selectedSegmentIndex])
         tipSlider.isHidden = true
         presetPercent.isHidden = false
      }
   }
   
   @IBAction func calTipSlider(_ sender: Any) {
      if (customSwitch.isOn) {
         let gettipPercent = Double(tipSlider.value)
         customSlideLbl.text = String(format: "(%.2f %%)", gettipPercent * 100)
         billAmt = Double(billLabel.text!) ?? 0
         tip = billAmt * gettipPercent
         tipAmt.text = String(format: "$ %.2f", tip)
         totalAmt.text = String(format: "$ %.2f", total)
      }
   }
   
   @IBAction func calTip(_ sender: Any) {
      if (!customSwitch.isOn) {
         let gettipPercent = tipPercent[presetPercent.selectedSegmentIndex]
         
         billAmt = Double(billLabel.text!) ?? 0
         
         tip = billAmt * gettipPercent
   //      total = billAmt + tip
         customSlideLbl.text = String(format: "(%.2f %%)", gettipPercent * 100)
         tipAmt.text = String(format: "$ %.2f", tip)
         totalAmt.text = String(format: "$ %.2f", total)
      }
   }
   
   @IBAction func onTap(_ sender: Any) {
      view.endEditing(true)
   }
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }


}

