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
    var mpg = 0
    var distance = 0
    var size = 0
    
    
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
    
    
    func getEmoji(for index: Int) -> String? {
        return imageArray[index].modifier ? imageArray[index].emoji : "❌"
    }
    
}



