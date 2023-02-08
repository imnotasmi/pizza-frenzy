//
//  Arcshape.swift
//  pizza frenzy
//
//  Created by ASMI on 26/01/23.
//

import SwiftUI

struct Arcshape: Shape{
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let midWidth = rect.width/2 //50
        let width = rect.width //100
        path.move(to: .zero)
        path.addCurve(to: CGPoint(x:width,y:0),
                      control1: CGPoint(x: midWidth, y: -80),
                      control2: CGPoint(x: midWidth, y: -80))
        
        return path
        
    }
      
}

//struct RectanglewithCurve: Shape{
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//        let width = rect.width
//       
//        return path
//        
//            
//        
//    }
//    
//}



