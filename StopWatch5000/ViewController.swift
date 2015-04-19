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
    timeLabel.text = dateStringFromTimeInterval(0)
  }

  // Method Stubs
  func start() {
    if timer == nil {
      timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("updateTimer:"), userInfo: nil, repeats: true)

      if stopTime != nil { // calculate the duration elapsted from start to stop, then subtract from new start time
        var duration = stopTime?.timeIntervalSinceDate(startTime!)
        startTime = NSDate(timeInterval: -duration!, sinceDate: NSDate())
      } else { // new start time
        startTime = NSDate()
      }

    } else {
      // don't start a timer

    }
  }

  func updateTimer(timer: NSTimer) {
//    println("timer: \(timer.timeInterval)")

    currentTime = NSDate()

    if let startTime = startTime {
      var duration = currentTime?.timeIntervalSinceDate(startTime)
      timeLabel.text = dateStringFromTimeInterval(duration!)
    }

  }

  func dateStringFromTimeInterval(timeInterval: NSTimeInterval) -> String{
    var dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "HH:mm:ss:SS"
    dateFormatter.timeZone = NSTimeZone(name: "UTC")

    var date = NSDate(timeIntervalSince1970: timeInterval)

    return dateFormatter.stringFromDate(date)
  }

  func stop() {
    stopTime = NSDate()

    // stop the timer
    timer?.invalidate()
    timer = nil

  }

  func reset() {
    // Stop the timer
    timer?.invalidate()
    timer = nil

    startTime = nil
    stopTime = nil
    currentTime = nil

    timeLabel.text = dateStringFromTimeInterval(0)
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

