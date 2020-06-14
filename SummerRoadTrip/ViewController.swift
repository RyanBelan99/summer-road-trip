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
        //localization
        mpgLabel.text = NSLocalizedString("str_mpgLabel", comment: "")
        distanceLabel.text = NSLocalizedString("str_distanceLabel", comment: "")
        fuelSizeLabel.text = NSLocalizedString("str_fuelSizeLabel", comment: "")
        outputStops.text = NSLocalizedString("str_outputStops", comment: "")
        outputTotal.text = NSLocalizedString("str_outputTotal", comment: "")
        outputRecommendation.text = NSLocalizedString("str_outputRecommendation", comment: "")
        
        inputMPG.becomeFirstResponder()
        for (i, buttonModifier) in buttonModifier.enumerated() {
            buttonModifier.index = i
        }
        imageLogic.initModifier(with: buttonModifier.count)
        self.view.backgroundColor = UIColor.green
    }
    
    
    @IBAction func whenTapped(_ sender: EmojiFilter) {
        imageLogic.emojiCycle(for: sender.index)
        updateAll()
    }
    
    func updateAll(){
        for image in buttonModifier {
            if let temp = imageLogic.getEmoji(for: image.index) {
                image.setTitle(temp, for: .normal)
            }
        }
        imageLogic.caclulate()
        outputStopEdit.text = String(imageLogic.outStops)
        outputTotalEdit.text = String(imageLogic.outConsumed)
        if(imageLogic.outStops > 4 || imageLogic.outConsumed > 100){
            self.view.backgroundColor = UIColor.red
            outputRecommendationEdit.text = "👎"
        }else{
            self.view.backgroundColor = UIColor.green
            outputRecommendationEdit.text = "👍"
        }
    }
    
    
    private var setupStage = 0
    @IBAction func KeyboardTap(sender: AnyObject) {
        if (setupStage == 0){
            inputMPG.resignFirstResponder()
            inputDistance.becomeFirstResponder()
            imageLogic.mpg = Int(inputMPG.text!) ?? 0
            setupStage+=1
            updateAll()
        }else if(setupStage == 1){
            inputDistance.resignFirstResponder()
            inputSize.becomeFirstResponder()
            imageLogic.distance = Int(inputDistance.text!) ?? 0
            setupStage+=1
            updateAll()
        }else if(setupStage == 2){
            imageLogic.size = Int(inputSize.text!) ?? 0
            inputSize.resignFirstResponder()
            setupStage+=1
            updateAll()
        }else{
            inputSize.resignFirstResponder()
            inputDistance.resignFirstResponder()
            inputMPG.resignFirstResponder()
            imageLogic.distance = Int(inputDistance.text!) ?? 0
            imageLogic.mpg = Int(inputMPG.text!) ?? 0
            imageLogic.size = Int(inputSize.text!) ?? 0
            updateAll()
        }
    }
}

