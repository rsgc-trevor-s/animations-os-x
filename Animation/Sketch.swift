//
//  Sketch.swift
//  Animation
//
//  Created by Russell Gordon on 2015-12-05.
//  Copyright © 2015 Royal St. George's College. All rights reserved.
//

import Foundation

class Sketch {
    
    // NOTE: Every sketch must contain an object of type Canvas named 'canvas'
    //       Therefore, the line immediately below must always be present.
    let canvas : Canvas
    
    // Declare any properties you need for your sketch below this comment, but before init()
    var rectangleHeightTrebble = 0   // Vertical position of rectangle, will be tied to amplitude of mic input
    var rectangleHeightSoprano = 0
    var rectangleHeightBass = 0
    var circleYValues = 0
    var ellipseHeight = 0
    var circleX = 25
    var circleY = 50
    var yY = 0
    var xX=0
    
    var lastX = 0
    var lastY = 0
    var s = 2
    
    var height = 1280
    var width = 800
    
    var gap = 140
    var hue = Float(120) //green
    var hue2 = Float(60) //yellow
    var hue3 = Float(10) //red
    var yPosition = [100,125,150,175,200,225,250,275,300,325,350,375,400,425,450,475,500,525,550,575,600,625,650,675,700,725,750,800,825] //creates an array for the y positions of the rectangles
    
    
    // Objects needed to read mic input and analyze it
    var analyzer: AKAudioAnalyzer!
    let microphone = AKMicrophone()
    let analysisSequence = AKSequence()
    var updateAnalysis: AKEvent?
    
    // This runs once, equivalent to setup() in Processing
    init() {
        
        // Create canvas object – specify size
        canvas = Canvas(width: height, height: width)
        
        // The frame rate can be adjusted; the default is 60 fps
        canvas.framesPerSecond = 60
        
        // Initialize objects used to analyze mic input
        analyzer = AKAudioAnalyzer(input: microphone.output)
        AKOrchestra.addInstrument(microphone)
        AKOrchestra.addInstrument(analyzer)
        analyzer.play()
        microphone.play()
        
        
        canvas.drawRectangle(bottomRightX: 0, bottomRightY: 0, width: canvas.width, height: 100)
    }
    
    // Runs repeatedly, equivalent to draw() in Processing
    func draw() {
        
        
        // Tie the height of the rectangle to the amplitude
        //Instead of having different frequencies, there is just ratios between the 3 main ranges in music
        
        rectangleHeightSoprano = Int(Float(10000) * analyzer.trackedAmplitude.floatValue)
        rectangleHeightTrebble = Int(Float(15000) * analyzer.trackedAmplitude.floatValue)
        rectangleHeightBass = Int(Float(12500) * analyzer.trackedAmplitude.floatValue)
        
        ellipseHeight = Int(Float(500) * analyzer.trackedAmplitude.floatValue)
        
        
        // "Clear" the background with a semi-transparent black rectangle
        canvas.drawShapesWithBorders = false
        canvas.fillColor = Color(hue: 0, saturation: 0, brightness: 0, alpha: 100)
        canvas.drawRectangle(bottomRightX: 0, bottomRightY: 100, width: canvas.width, height: canvas.height)
        
        
        
        //creates a circle that moves along the screen until the end where it then earases everything and restarts
        circleX = circleX+s
        if circleX>canvas.width{
            circleX=25
            canvas.drawRectangle(bottomRightX: 0, bottomRightY: 0, width: canvas.width, height: 100)
        }
        
        canvas.fillColor = Color(hue: 32, saturation: 100, brightness: 100, alpha: 100)
        canvas.drawEllipse(centreX: circleX, centreY: circleY+(2*ellipseHeight), width: 3, height: 3)
        
        yY = circleY+ellipseHeight
                lastX = circleX-s
                lastY = yY
        
                //connects the points from the old circle position to the new one with a line
                canvas.fillColor = Color(hue: 80, saturation: 100, brightness: 90, alpha: 100)
                canvas.drawLine(fromX: lastX, fromY: lastY, toX: circleX, toY: ellipseHeight+circleY)
        
        
        
        
        
        //Create the 3 volume meters for Soprano, Trebble and bass
        canvas.drawShapesWithBorders = false
        //green rectangles Soprano
        canvas.fillColor = Color(hue: hue, saturation: 80, brightness: 90, alpha: 90)
        for index in 0...11 {
            if rectangleHeightSoprano >= yPosition[index] {
                canvas.drawRectangle(bottomRightX: 25, bottomRightY: yPosition[index], width: 100, height: 20, borderWidth: 50)
            }
        }
        //green rectangles Soprano shifted
        canvas.fillColor = Color(hue: hue, saturation: 80, brightness: 90, alpha: 90)
        for index in 0...11 {
            if rectangleHeightSoprano >= yPosition[index] {
                canvas.drawRectangle(bottomRightX: 25+(3*gap), bottomRightY: yPosition[index], width: 100, height: 20, borderWidth: 50)
            }
        }
        //green rectangles Soprano shifted again
        canvas.fillColor = Color(hue: hue, saturation: 80, brightness: 90, alpha: 90)
        for index in 0...11 {
            if rectangleHeightSoprano >= yPosition[index] {
                canvas.drawRectangle(bottomRightX: 25+(6*gap), bottomRightY: yPosition[index], width: 100, height: 20, borderWidth: 50)
            }
        }
        
        
        //green rectangles Trebble
        canvas.fillColor = Color(hue: hue, saturation: 80, brightness: 90, alpha: 90)
        for index in 0...11 {
            if rectangleHeightTrebble >= yPosition[index] {
                canvas.drawRectangle(bottomRightX: 25+gap, bottomRightY: yPosition[index], width: 100, height: 20, borderWidth: 50)
            }
        }
        //green rectangles Trebble shifted
        canvas.fillColor = Color(hue: hue, saturation: 80, brightness: 90, alpha: 90)
        for index in 0...11 {
            if rectangleHeightTrebble >= yPosition[index] {
                canvas.drawRectangle(bottomRightX: 25+(4*gap), bottomRightY: yPosition[index], width: 100, height: 20, borderWidth: 50)
            }
        }
        //green rectangles Trebble shifted again
        canvas.fillColor = Color(hue: hue, saturation: 80, brightness: 90, alpha: 90)
        for index in 0...11 {
            if rectangleHeightTrebble >= yPosition[index] {
                canvas.drawRectangle(bottomRightX: 25+(7*gap), bottomRightY: yPosition[index], width: 100, height: 20, borderWidth: 50)
            }
        }
        
        
        //green rectangles Bass
        canvas.fillColor = Color(hue: hue, saturation: 80, brightness: 90, alpha: 90)
        for index in 0...11 {
            if rectangleHeightBass >= yPosition[index] {
                canvas.drawRectangle(bottomRightX: 25+(2*gap), bottomRightY: yPosition[index], width: 100, height: 20, borderWidth: 50)
            }
        }
        
        
        //green rectangles Bass shifted
        canvas.fillColor = Color(hue: hue, saturation: 80, brightness: 90, alpha: 90)
        for index in 0...11 {
            if rectangleHeightBass >= yPosition[index] {
                canvas.drawRectangle(bottomRightX: 25+(5*gap), bottomRightY: yPosition[index], width: 100, height: 20, borderWidth: 50)
            }
        }
        //green rectangles Bass shifted again
        canvas.fillColor = Color(hue: hue, saturation: 80, brightness: 90, alpha: 90)
        for index in 0...11 {
            if rectangleHeightBass >= yPosition[index] {
                canvas.drawRectangle(bottomRightX: 25+(8*gap), bottomRightY: yPosition[index], width: 100, height: 20, borderWidth: 50)
            }
        }
        
        
        //yellow bars Soprano
        canvas.fillColor = Color(hue: hue2, saturation: 80, brightness: 90, alpha: 90)
        for index2 in 12...24 {
            
            if(rectangleHeightSoprano>=yPosition[index2]){
                canvas.drawRectangle(bottomRightX: 25, bottomRightY: yPosition[index2], width: 100, height: 20, borderWidth: 50)
            }
        }
        
        //yellow bars Soprano shifted
        canvas.fillColor = Color(hue: hue2, saturation: 80, brightness: 90, alpha: 90)
        for index2 in 12...24 {
            
            if(rectangleHeightSoprano>=yPosition[index2]){
                canvas.drawRectangle(bottomRightX: 25+(3*gap), bottomRightY: yPosition[index2], width: 100, height: 20, borderWidth: 50)
            }
        }
        //yellow bars Soprano shifted again
        canvas.fillColor = Color(hue: hue2, saturation: 80, brightness: 90, alpha: 90)
        for index2 in 12...24 {
            
            if(rectangleHeightSoprano>=yPosition[index2]){
                canvas.drawRectangle(bottomRightX: 25+(6*gap), bottomRightY: yPosition[index2], width: 100, height: 20, borderWidth: 50)
            }
        }
        
        
        //yellow bars Trebble
        canvas.fillColor = Color(hue: hue2, saturation: 80, brightness: 90, alpha: 90)
        for index in 12...24 {
            if rectangleHeightTrebble >= yPosition[index] {
                canvas.drawRectangle(bottomRightX: 25+gap, bottomRightY: yPosition[index], width: 100, height: 20, borderWidth: 50)
            }
        }
        //yellow bars Trebble shifted
        canvas.fillColor = Color(hue: hue2, saturation: 80, brightness: 90, alpha: 90)
        for index in 12...24 {
            if rectangleHeightTrebble >= yPosition[index] {
                canvas.drawRectangle(bottomRightX: 25+(4*gap), bottomRightY: yPosition[index], width: 100, height: 20, borderWidth: 50)
            }
        }
        //yellow bars Trebble shifted again
        canvas.fillColor = Color(hue: hue2, saturation: 80, brightness: 90, alpha: 90)
        for index in 12...24 {
            if rectangleHeightTrebble >= yPosition[index] {
                canvas.drawRectangle(bottomRightX: 25+(7*gap), bottomRightY: yPosition[index], width: 100, height: 20, borderWidth: 50)
            }
        }
        
        
        //yellow bars Bass
        canvas.fillColor = Color(hue: hue2, saturation: 80, brightness: 90, alpha: 90)
        for index in 12...24 {
            if rectangleHeightBass >= yPosition[index] {
                canvas.drawRectangle(bottomRightX: 25+(2*gap), bottomRightY: yPosition[index], width: 100, height: 20, borderWidth: 50)
            }
        }
        //yellow bars Bass shifted
        canvas.fillColor = Color(hue: hue2, saturation: 80, brightness: 90, alpha: 90)
        for index in 12...24 {
            if rectangleHeightBass >= yPosition[index] {
                canvas.drawRectangle(bottomRightX: 25+(5*gap), bottomRightY: yPosition[index], width: 100, height: 20, borderWidth: 50)
            }
        }
        //yellow bars Bass shifted again
        canvas.fillColor = Color(hue: hue2, saturation: 80, brightness: 90, alpha: 90)
        for index in 12...24 {
            if rectangleHeightBass >= yPosition[index] {
                canvas.drawRectangle(bottomRightX: 25+(8*gap), bottomRightY: yPosition[index], width: 100, height: 20, borderWidth: 50)
            }
        }
        
        
        
        //red bars soprano
        canvas.fillColor = Color(hue: hue3, saturation: 80, brightness: 90, alpha: 90)
        for index3 in 25...28 {
            if(rectangleHeightSoprano>=yPosition[index3]){
                canvas.drawRectangle(bottomRightX: 25, bottomRightY: yPosition[index3], width: 100, height: 20, borderWidth: 50)
            }
        }
        //red bars soprano shifted
        canvas.fillColor = Color(hue: hue3, saturation: 80, brightness: 90, alpha: 90)
        for index3 in 25...28 {
            if(rectangleHeightSoprano>=yPosition[index3]){
                canvas.drawRectangle(bottomRightX: 25+(3*gap), bottomRightY: yPosition[index3], width: 100, height: 20, borderWidth: 50)
            }
        }
        //red bars soprano shifted again
        canvas.fillColor = Color(hue: hue3, saturation: 80, brightness: 90, alpha: 90)
        for index3 in 25...28 {
            if(rectangleHeightSoprano>=yPosition[index3]){
                canvas.drawRectangle(bottomRightX: 25+(6*gap), bottomRightY: yPosition[index3], width: 100, height: 20, borderWidth: 50)
            }
        }
        
        
        
        //red bars Trebble
        canvas.fillColor = Color(hue: hue3, saturation: 80, brightness: 90, alpha: 90)
        for index in 25...28 {
            if rectangleHeightTrebble >= yPosition[index] {
                canvas.drawRectangle(bottomRightX: 25+gap, bottomRightY: yPosition[index], width: 100, height: 20, borderWidth: 50)
            }
        }
        //red bars Trebble Shifted
        canvas.fillColor = Color(hue: hue3, saturation: 80, brightness: 90, alpha: 90)
        for index in 25...28 {
            if rectangleHeightTrebble >= yPosition[index] {
                canvas.drawRectangle(bottomRightX: 25+(4*gap), bottomRightY: yPosition[index], width: 100, height: 20, borderWidth: 50)
            }
        }
        //red bars Trebble Shifted again
        canvas.fillColor = Color(hue: hue3, saturation: 80, brightness: 90, alpha: 90)
        for index in 25...28 {
            if rectangleHeightTrebble >= yPosition[index] {
                canvas.drawRectangle(bottomRightX: 25+(7*gap), bottomRightY: yPosition[index], width: 100, height: 20, borderWidth: 50)
            }
        }
        
        
        
        //red bars Bass
        canvas.fillColor = Color(hue: hue3, saturation: 80, brightness: 90, alpha: 90)
        for index in 25...28 {
            if rectangleHeightBass >= yPosition[index] {
                canvas.drawRectangle(bottomRightX: 25+(2*gap), bottomRightY: yPosition[index], width: 100, height: 20, borderWidth: 50)
            }
        }
        //red bars Bass shifted
        canvas.fillColor = Color(hue: hue3, saturation: 80, brightness: 90, alpha: 90)
        for index in 25...28 {
            if rectangleHeightBass >= yPosition[index] {
                canvas.drawRectangle(bottomRightX: 25+(5*gap), bottomRightY: yPosition[index], width: 100, height: 20, borderWidth: 50)
            }
        }
        //red bars Bass shifted again
        canvas.fillColor = Color(hue: hue3, saturation: 80, brightness: 90, alpha: 90)
        for index in 25...28 {
            if rectangleHeightBass >= yPosition[index] {
                canvas.drawRectangle(bottomRightX: 25+(8*gap), bottomRightY: yPosition[index], width: 100, height: 20, borderWidth: 50)
            }
        }
        
        
        
        
    }
}
