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
    var x = 0
    var y = 0   // Vertical position of circle, will be tied to amplitude of mic input
    var s = 1
    var height = 1280
    var width = 800
    var hue = Float(100) //green
    var hue2 = Float(60) //yellow
    var hue3 = Float(10) //red
    var rect = [75,100,125,150,175,200,225,250,275,300,325,350,375,400,425,450,475,500,525,550,575,600,625,650,675,700,725,750,800]
    
    
    
    
    
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
        print("Amplitude as a float is: \(analyzer.trackedAmplitude.floatValue)")
        
        // Tie the height of the rectangle to the amplitude
        y = Int(Float(10000) * analyzer.trackedAmplitude.floatValue )
    
        
        //create an array for the y position of each rectangle
        
        
       
    
              // "Clear" the background with a semi-transparent black rectangle
        canvas.drawShapesWithBorders = false
        canvas.fillColor = Color(hue: 0, saturation: 0, brightness: 0, alpha: 20)
        canvas.drawRectangle(bottomRightX: 0, bottomRightY: 0, width: canvas.width, height: canvas.height)
        
        
        canvas.drawShapesWithBorders = false
        //green rectangles
        canvas.fillColor = Color(hue: hue, saturation: 80, brightness: 90, alpha: 90)
        if(y>=rect[0]){
                canvas.drawRectangle(bottomRightX: 25, bottomRightY: rect[0], width: 100, height: 20, borderWidth: 50)
        }
        if(y>=rect[1]){
        canvas.drawRectangle(bottomRightX: 25, bottomRightY: rect[1], width: 100, height: 20, borderWidth: 50)
        }
        if(y>=rect[2]){
        canvas.drawRectangle(bottomRightX: 25, bottomRightY: rect[2], width: 100, height: 20, borderWidth: 50)
        }
        if(y>=rect[3]){
        canvas.drawRectangle(bottomRightX: 25, bottomRightY: rect[3], width: 100, height: 20, borderWidth: 50)
        }
        if(y>=rect[4]){
        canvas.drawRectangle(bottomRightX: 25, bottomRightY: rect[4], width: 100, height: 20, borderWidth: 50)
        }
        if(y>=rect[5]){
        canvas.drawRectangle(bottomRightX: 25, bottomRightY: rect[5], width: 100, height: 20, borderWidth: 50)
        }
        if(y>=rect[6]){
        canvas.drawRectangle(bottomRightX: 25, bottomRightY: rect[6], width: 100, height: 20, borderWidth: 50)
        }
        if(y>=rect[7]){
        canvas.drawRectangle(bottomRightX: 25, bottomRightY: rect[7], width: 100, height: 20, borderWidth: 50)
        }
        if(y>=rect[8]){
        canvas.drawRectangle(bottomRightX: 25, bottomRightY: rect[8], width: 100, height: 20, borderWidth: 50)
        }
        if(y>=rect[9]){
        canvas.drawRectangle(bottomRightX: 25, bottomRightY: rect[9], width: 100, height: 20, borderWidth: 50)
        }
        if(y>=rect[10]){
        canvas.drawRectangle(bottomRightX: 25, bottomRightY: rect[10], width: 100, height: 20, borderWidth: 50)
        }
        if(y>=rect[11]){
        canvas.drawRectangle(bottomRightX: 25, bottomRightY: rect[11], width: 100, height: 20, borderWidth: 50)
        }
        //yellow bars
        canvas.fillColor = Color(hue: hue2, saturation: 80, brightness: 90, alpha: 90)
        if(y>=rect[12]){
        canvas.drawRectangle(bottomRightX: 25, bottomRightY: rect[12], width: 100, height: 20, borderWidth: 50)
        }
        if(y>=rect[13]){
        canvas.drawRectangle(bottomRightX: 25, bottomRightY: rect[13], width: 100, height: 20, borderWidth: 50)
        }
        if(y>=rect[14]){
        canvas.drawRectangle(bottomRightX: 25, bottomRightY: rect[14], width: 100, height: 20, borderWidth: 50)
        }
        if(y>=rect[15]){
        canvas.drawRectangle(bottomRightX: 25, bottomRightY: rect[15], width: 100, height: 20, borderWidth: 50)
        }
        if(y>=rect[16]){
        canvas.drawRectangle(bottomRightX: 25, bottomRightY: rect[16], width: 100, height: 20, borderWidth: 50)
        }
        if(y>=rect[17]){
        canvas.drawRectangle(bottomRightX: 25, bottomRightY: rect[17], width: 100, height: 20, borderWidth: 50)
        }
        if(y>=rect[18]){
        canvas.drawRectangle(bottomRightX: 25, bottomRightY: rect[18], width: 100, height: 20, borderWidth: 50)
        }
        if(y>=rect[19]){
        canvas.drawRectangle(bottomRightX: 25, bottomRightY: rect[19], width: 100, height: 20, borderWidth: 50)
        }
        if(y>=rect[20]){
        canvas.drawRectangle(bottomRightX: 25, bottomRightY: rect[20], width: 100, height: 20, borderWidth: 50)
        }
         if(y>=rect[21]){
        canvas.drawRectangle(bottomRightX: 25, bottomRightY: rect[21], width: 100, height: 20, borderWidth: 50)
        }
         if(y>=rect[22]){
        canvas.drawRectangle(bottomRightX: 25, bottomRightY: rect[22], width: 100, height: 20, borderWidth: 50)
        }
         if(y>=rect[23]){
        canvas.drawRectangle(bottomRightX: 25, bottomRightY: rect[23], width: 100, height: 20, borderWidth: 50)
        }
         if(y>=rect[24]){
        canvas.drawRectangle(bottomRightX: 25, bottomRightY: rect[24], width: 100, height: 20, borderWidth: 50)
        }
        //red rectangles
       canvas.fillColor = Color(hue: hue3, saturation: 80, brightness: 90, alpha: 90)
         if(y>=rect[25]){
        canvas.drawRectangle(bottomRightX: 25, bottomRightY: rect[25], width: 100, height: 20, borderWidth: 50)
        }
         if(y>=rect[26]){
        canvas.drawRectangle(bottomRightX: 25, bottomRightY: rect[26], width: 100, height: 20, borderWidth: 50)
        }
         if(y>=rect[27]){
        canvas.drawRectangle(bottomRightX: 25, bottomRightY: rect[27], width: 100, height: 20, borderWidth: 50)
        }
         if(y>=rect[28]){
        canvas.drawRectangle(bottomRightX: 25, bottomRightY: rect[28], width: 100, height: 20, borderWidth: 50)
        }
    }
    

}

