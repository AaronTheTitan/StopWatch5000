//
//  ViewController.swift
//  StopWatch5000
//
//  Created by Aaron Bradley on 4/19/15.
//  Copyright (c) 2015 Aaron Bradley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var timer: NSTimer?
  var startTime: NSDate?
  var currentTime: NSDate?
  var stopTime: NSDate?

  @IBOutlet weak var timeLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  // Method Stubs
  func start() {
    if timer == nil {
      startTime = NSDate()
      timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("updateTimer:"), userInfo: nil, repeats: true)
    }
  }

  func updateTimer(timer: NSTimer) {
//    println("timer: \(timer.timeInterval)")

    currentTime = NSDate()

    if let startTime = startTime {
      var duration = currentTime?.timeIntervalSinceDate(startTime)
//      println("duration: \(duration)")
//      timeLabel.text = duration?.description

      var dateFormatter = NSDateFormatter()
      dateFormatter.dateFormat = "HH:mm:ss:SS"
//      timeLabel.text = dateFormatter.stringFromDate(currentTime!)

      dateFormatter.timeZone = NSTimeZone(name: "UTC")

      var date = NSDate(timeIntervalSince1970: duration!)
      timeLabel.text = dateFormatter.stringFromDate(date)
      
    }

  }

  func stop() {
    stopTime = NSDate()

    // stop the timer
    timer?.invalidate()
    timer = nil

  }

  func reset() {

  }

  @IBAction func startButtonPressed(sender: AnyObject) {
    start()
  }

  @IBAction func stopButtonPressed(sender: AnyObject) {
    stop()
  }

  @IBAction func resetButtonPressed(sender: AnyObject) {
    reset()
  }

}

