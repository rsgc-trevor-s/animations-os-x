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
    var height = 1280
    var width = 800
    var hue = Float(100) //green
    var hue2 = Float(60) //yellow
    var hue3 = Float(10) //red
    var yPosition = [75,100,125,150,175,200,225,250,275,300,325,350,375,400,425,450,475,500,525,550,575,600,625,650,675,700,725,750,800] //creates an array for the y positions of the rectangles
    
    
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
    }
    
    // Runs repeatedly, equivalent to draw() in Processing
    func draw() {
        
        // Print amplitude of mic input (seems to vary between 0 and 1)
        //print("Amplitude as a float is: \(analyzer.trackedAmplitude.floatValue)")
        
        // Tie the height of the rectangle to the amplitude
        rectangleHeightTrebble = Int(Float(10000) * analyzer.trackedAmplitude.floatValue )
        
        
        //create an array for the y position of each rectangle
        
        
        
        
        // "Clear" the background with a semi-transparent black rectangle
        canvas.drawShapesWithBorders = false
        canvas.fillColor = Color(hue: 0, saturation: 0, brightness: 0, alpha: 20)
        canvas.drawRectangle(bottomRightX: 0, bottomRightY: 0, width: canvas.width, height: canvas.height)
        
        
        canvas.drawShapesWithBorders = false
        //green rectangles
        canvas.fillColor = Color(hue: hue, saturation: 80, brightness: 90, alpha: 90)
        for index in 0...11 {
            if rectangleHeightTrebble >= yPosition[index] {
                canvas.drawRectangle(bottomRightX: 25, bottomRightY: yPosition[index], width: 100, height: 20, borderWidth: 50)
            }
        }
        
        //yellow bars
        canvas.fillColor = Color(hue: hue2, saturation: 80, brightness: 90, alpha: 90)
        for index2 in 12...24 {
            
            if(rectangleHeightTrebble>=yPosition[index2]){
                canvas.drawRectangle(bottomRightX: 25, bottomRightY: yPosition[index2], width: 100, height: 20, borderWidth: 50)
            }
        }
        //        //red rectangles
        canvas.fillColor = Color(hue: hue3, saturation: 80, brightness: 90, alpha: 90)
        for index3 in 25...28 {
            if(rectangleHeightTrebble>=yPosition[index3]){
                canvas.drawRectangle(bottomRightX: 25, bottomRightY: yPosition[index3], width: 100, height: 20, borderWidth: 50)
            }
        }
        
    }
}
