//
//  AppLogic.swift
//  SummerRoadTrip
//
//  Created by Ryan Belan on 6/13/20.
//  Copyright © 2020 University of Rochester. All rights reserved.
//

import Foundation

struct Image {
    var modifier = false
    var emoji = ""
}

class AppLogic {
    private var imageArray = [Image]()
    var mpg: Int = 0
    var distance: Int = 0
    var size: Int = 0
    
    var outConsumed = 0.0
    var outStops = 0.0
    
    func initModifier(with numberOfImages: Int){
        for _ in 0..<numberOfImages {
            let image = Image(modifier: false, emoji: "❌")
            imageArray.append(image)
        }
    }
    
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
    
    func caclulate() {
        if((mpg==0 || distance==0 || size==0)){
            return
        }else{
            var temp = mpg
            if(imageArray.contains(where: {$0.modifier == true})){
                temp = Int(Double(mpg)/getModifier())
            }
            outConsumed = Double(distance/temp)
            if(outConsumed >= Double(size)) {
                outStops = outConsumed/Double(size)
                outStops.round(.up)
            }
        }
    }
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
    
    func getEmoji(for index: Int) -> String? {
        return imageArray[index].modifier ? imageArray[index].emoji : "❌"
    }
    
}



