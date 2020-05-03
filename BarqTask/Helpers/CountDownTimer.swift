//
//  CountDownTimer.swift
//  Azayem_customer
//
//  Created by Mena Gamal on 1/15/20.
//  Copyright © 2020 Waqood. All rights reserved.

import Foundation



func defaultUpdateActionHandler(string:[String:String])->(){

}

func defaultCompletionActionHandler()->(){

}

public class DateCountDownTimer{

    var countdownTimer: Timer!
    var totalTime = 60
    var dateString = "March 4, 2018 13:20:10" as String
    var UpdateActionHandler:([String:String])->() = defaultUpdateActionHandler
    var CompletionActionHandler:()->() = defaultCompletionActionHandler

    public init(){
        countdownTimer = Timer()
        totalTime = 60
        dateString = "March 4, 2018 13:20:10" as String
        UpdateActionHandler = defaultUpdateActionHandler
        CompletionActionHandler = defaultCompletionActionHandler
    }

    public func initializeTimer(pYear:Int, pMonth:Int, pDay:Int, pHour:Int, pMin:Int, pSec:Int){

        self.dateString = "\(pMonth) \(pDay), \(pYear) \(pHour):\(pMin):\(pSec)" as String

        // Setting Today's Date
        let currentDate = Date()

        // Setting TargetDate
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm:ss"
        dateFormatter.timeZone = NSTimeZone.local
        let targedDate = dateFormatter.date(from: dateString) as! Date

        // Calculating the difference of dates for timer
        let calendar = Calendar.current.dateComponents([.day, .hour, .minute, .second], from: currentDate, to: targedDate)
        let days = calendar.day!
        let hours = calendar.hour!
        let minutes = calendar.minute!
        let seconds = calendar.second!
        totalTime = hours * 60 * 60 + minutes * 60 + seconds
        totalTime = days * 60 * 60 * 24 + totalTime
    }

    func numberOfDaysInMonth(month:Int) -> Int{
        let dateComponents = DateComponents(year: 2015, month: 7)
        let calendar = Calendar.current
        let date = calendar.date(from: dateComponents)!

        let range = calendar.range(of: .day, in: .month, for: date)!
        let numDays = range.count
        print(numDays)
        return numDays
    }

    public func startTimer(pUpdateActionHandler:@escaping ([String:String])->(),pCompletionActionHandler:@escaping ()->()) {
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        self.CompletionActionHandler = pCompletionActionHandler
        self.UpdateActionHandler = pUpdateActionHandler
    }

    @objc func updateTime() {
        self.UpdateActionHandler(timeFormatted(totalTime))

        if totalTime > 0 {
            totalTime -= 1
        } else {
            endTimer()
        }
    }

    func endTimer() {
        self.CompletionActionHandler()
        countdownTimer.invalidate()
    }

    func timeFormatted(_ totalSeconds: Int) -> [String:String] {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        let hours: Int = (totalSeconds / 60 / 60) % 24
        let days: Int = (totalSeconds / 60 / 60 / 24)
        var collection = [String:String]()
        
        let s = String(format: "%02d", seconds)
        let m = String(format: "%02d", minutes)
        let h = String(format: "%02d", hours)
        let d = String(format: "%02d", days)
        collection["s"] = s
        collection["m"] = m
        collection["h"] = h
        collection["d"] = d
        
        return collection
    }

}
extension Date {

    func interval(ofComponent comp: Calendar.Component, fromDate date: Date) -> Int {

        let currentCalendar = Calendar.current

        guard let start = currentCalendar.ordinality(of: comp, in: .era, for: date) else { return 0 }
        guard let end = currentCalendar.ordinality(of: comp, in: .era, for: self) else { return 0 }

        return end - start
    }
}
