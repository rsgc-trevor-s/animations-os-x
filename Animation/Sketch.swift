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
    var height1 = 0
    
    
    
    // Objects needed to read mic input and analyze it
    var analyzer: AKAudioAnalyzer!
    let microphone = AKMicrophone()
    let analysisSequence = AKSequence()
    var updateAnalysis: AKEvent?
    
    // This runs once, equivalent to setup() in Processing
    init() {
        
        // Create canvas object – specify size
        canvas = Canvas(width: 1280, height: 800)
        
        // The frame rate can be adjusted; the default is 60 fps
        canvas.framesPerSecond = 60
        
        // Initialize objects used to analyze mic input
        analyzer = AKAudioAnalyzer(input: microphone.output)
        AKOrchestra.addInstrument(microphone)
        AKOrchestra.addInstrument(analyzer)
        analyzer.play()
        microphone.play()
        height1 = Int(Float(canvas.height))
    }
    
    // Runs repeatedly, equivalent to draw() in Processing
    func draw() {
        
        // Print amplitude of mic input (seems to vary between 0 and 1)
        print("Amplitude as a float is: \(analyzer.trackedAmplitude.floatValue)")
        
        // Tie the height of the rectangle to the amplitude
        y = Int(Float(10000) * analyzer.trackedAmplitude.floatValue )
    
              // "Clear" the background with a semi-transparent black rectangle
        canvas.drawShapesWithBorders = false
        canvas.fillColor = Color(hue: 0, saturation: 0, brightness: 0, alpha: 100)
        canvas.drawRectangle(bottomRightX: 0, bottomRightY: 0, width: canvas.width, height: canvas.height)
        
        
        
    }
    
}

func rectangle(let canvas : Canvas,hue: Float ){
    //draw rectangle
    //hue = 100
    canvas.drawShapesWithBorders = false
    canvas.fillColor = Color(hue: 100, saturation: 80, brightness: 90, alpha: 100)
    canvas.drawRectangle(bottomRightX: 25, bottomRightY: 80, width: 100, height: 20, borderWidth: 50)
   
}

