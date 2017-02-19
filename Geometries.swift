//
//  Geometries.swift
//  GeometryClasses
//
//  Created by Mats Hammarqvist on 2017-02-19.
//  Copyright © 2017 Mats Hammarqvist. All rights reserved.
//

import Foundation

class MHTPoint {
    var x : Float
    var y : Float
    var z : Float
    
    init(x : Float,y : Float, z: Float) {
        self.x = x
        self.y = y
        self.z = z
    }
}


class MHTLine {
    var point1 : MHTPoint
    var point2 : MHTPoint
    
    var xDiff: Float {
        get{
            return point2.x - point1.x
        }
    }
    var yDiff: Float {
        get {
            return point2.y - point1.y
        }
    }
    var zDiff: Float {
        get {
            return point2.z - point1.z
        }
    }
    
    func getVinkel (cmpLinje: MHTLine) -> MHTPoint{
        
        return MHTPoint(x: acos(cmpLinje.enhetsvektor().x * self.enhetsvektor().x), y: acos(cmpLinje.enhetsvektor().y * self.enhetsvektor().y), z: acos(cmpLinje.enhetsvektor().z * self.enhetsvektor().z))
        
        
    }
    
    func distans () -> Float{
        
        let xDiff2 = powf(xDiff, 2)
        let yDiff2 = powf(yDiff, 2)
        let zDiff2 = powf(zDiff, 2)
        let tempDist = powf(xDiff2 + yDiff2 + zDiff2, 0.5)
        return tempDist
    }
    
    func enhetsvektor() -> MHTPoint {
        // let vektor : MHTPoint
        
        return MHTPoint(x: xDiff/distans(), y: yDiff/distans(), z: zDiff/distans())
    }
    init(point1: MHTPoint, point2: MHTPoint) {
        self.point1 = point1
        self.point2 = point2
    }
    
}

class MHTTriangel {
    var point1 : MHTPoint
    var point2 : MHTPoint
    var point3 : MHTPoint
    
    var line1 : MHTLine
    var line2 : MHTLine
    var line3 : MHTLine
    
    var area : Float = 1 // TODO
    
    init(point1: MHTPoint, point2:MHTPoint, point3:MHTPoint) {
        
        self.point1 = point1
        self.point2 = point2
        self.point3 = point3
        
        self.line1 = MHTLine(point1: point1, point2: point2)
        self.line2 = MHTLine(point1: point2, point2: point3)
        self.line3 = MHTLine(point1: point3, point2: point1)
        
        
    }
    
}

