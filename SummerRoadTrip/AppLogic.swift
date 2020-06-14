//
//  AppLogic.swift
//  SummerRoadTrip
//
//  Created by Ryan Belan on 6/13/20.
//  Copyright © 2020 University of Rochester. All rights reserved.
//

import Foundation
//This struct holds visual emoji for button and states if modifier is on
struct Image {
    var modifier = false
    var emoji = ""
}

//main class for apps calculations
class AppLogic {
    private var imageArray = [Image]() //Struct button info
    //input data
    var mpg: Int = 0
    var distance: Int = 0
    var size: Int = 0
    
    //output results
    var outConsumed = 0.0
    var outStops = 0.0
    
    //initialize buttons
    func initModifier(with numberOfImages: Int){
        for _ in 0..<numberOfImages {
            let image = Image(modifier: false, emoji: "❌")
            imageArray.append(image)
        }
    }
    //cycles through buttons emojis when tapped and sets modifier
    func emojiCycle(for index: Int) {
        if(imageArray[index].emoji == "❌"){
            imageArray[index].modifier = true
            imageArray[index].emoji = "🏬"
        }else if(imageArray[index].emoji == "🏬"){
            imageArray[index].emoji = "🏔"
        }else if(imageArray[index].emoji == "🏔"){
            imageArray[index].emoji = "🏜"
        }else if(imageArray[index].emoji == "🏜"){
            imageArray[index].emoji = "❌"
            imageArray[index].modifier = false
        }
    }
    //This method caclulates apps results and inputs modifiers
    func caclulate() {
        if((mpg==0 || distance==0 || size==0)){
            return
        }else{
            var temp = mpg
            if(imageArray.contains(where: {$0.modifier == true})){ //checks if there are any modifiers
                temp = Int(Double(mpg)/getModifier())
            }
            outConsumed = Double(distance/temp)
            if(outConsumed >= Double(size)) {
                outStops = outConsumed/Double(size)
                outStops.round(.up)
            }
        }
    }
    //This method adds modifiers for the caclulate method
    func getModifier() -> Double {
        var temp = 1.0
        for i in imageArray {
            switch i.emoji {
            case "🏬":
                temp+=0.2
            case "🏔":
                temp+=0.5
            case "🏜":
                temp+=0.1
            default:
                break
            }
        }
        return temp
    }
    
    //Getter method for buttons
    func getEmoji(for index: Int) -> String? {
        return imageArray[index].modifier ? imageArray[index].emoji : "❌"
    }
}



