//
//  ViewController.swift
//  SummerRoadTrip
//
//  Created by Ryan Belan on 6/11/20.
//  Copyright © 2020 University of Rochester. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var mpgLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var fuelSizeLabel: UILabel!
    
    @IBOutlet weak var inputMPG: UITextField!
    @IBOutlet weak var inputDistance: UITextField!
    @IBOutlet weak var inputSize: UITextField!
    
    @IBOutlet weak var outputStops: UILabel!
    @IBOutlet weak var outputTotal: UILabel!
    @IBOutlet weak var outputRecommendation: UILabel!
    
    @IBOutlet weak var outputStopEdit: UILabel!
    @IBOutlet weak var outputTotalEdit: UILabel!
    @IBOutlet weak var outputRecommendationEdit: UILabel!
    
    @IBOutlet var buttonModifier: [EmojiFilter]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputMPG.becomeFirstResponder()
        for (i, buttonModifier) in buttonModifier.enumerated() {
            buttonModifier.index = i
        }
    }
    
    
    @IBAction func whenTapped(_ sender:
        EmojiFilter) {
        buttonModifier[sender.index] = emojiCycle(sender.index)
        print("title \(sender.index) tapped")
    }
    
    
    private var setupStage = 0
    @IBAction func KeyboardTap(sender: AnyObject) {
        if (setupStage == 0){
            inputMPG.resignFirstResponder()
            inputDistance.becomeFirstResponder()
            setupStage+=1
            print(inputMPG.text!)
        }else if(setupStage == 1){
            inputDistance.resignFirstResponder()
            setupStage+=1
            print(inputDistance.text!)
        }else{
            mpgLabel.resignFirstResponder()
            print(inputSize!)
        }
    }
}

