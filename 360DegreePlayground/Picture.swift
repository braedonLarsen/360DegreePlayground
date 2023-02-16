//
//  Picture.swift
//  360DegreePlayground
//
//  Created by BRAEDON LARSEN on 2/10/23.
//

import Foundation
class Picture
{
    
     var image: String
     var xCord: Int
     var yCord: Int
    var whiteSpace: Bool

    
    
    init(i: String, x:Int, y: Int )
    {
        image = i
        xCord = x
        yCord = y
        whiteSpace = false
    }
    
}
