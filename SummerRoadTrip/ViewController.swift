//
//  ViewController.swift
//  SummerRoadTrip
//
//  Created by Ryan Belan on 6/11/20.
//  Copyright © 2020 University of Rochester. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let imageLogic = AppLogic()
    
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
        imageLogic.initModifier(with: buttonModifier.count)
    }
    
    
    @IBAction func whenTapped(_ sender: EmojiFilter) {
        imageLogic.emojiCycle(for: sender.index)
        print("title \(sender.index) tapped")
        updateAll()
    }
    
    func updateAll(){
        for image in buttonModifier {
            if let temp = imageLogic.getEmoji(for: image.index) {
                image.setTitle(temp, for: .normal)
            }
        }
    }
    
    
    private var setupStage = 0
    @IBAction func KeyboardTap(sender: AnyObject) {
        if (setupStage == 0){
            inputMPG.resignFirstResponder()
            inputDistance.becomeFirstResponder()
            imageLogic.mpg = Int(inputMPG.text!)!
            setupStage+=1
            updateAll()
        }else if(setupStage == 1){
            inputDistance.resignFirstResponder()
            inputSize.becomeFirstResponder()
            imageLogic.distance = Int(inputDistance.text!)!
            setupStage+=1
            updateAll()
        }else if(setupStage == 2){
            imageLogic.size = Int(inputSize.text!)!
            inputSize.resignFirstResponder()
            updateAll()
        }else{
            imageLogic.mpg = Int(inputDistance.text!)!
            imageLogic.distance = Int(inputMPG.text!)!
            imageLogic.size = Int(inputSize.text!)!
            updateAll()
        }
    }
}

