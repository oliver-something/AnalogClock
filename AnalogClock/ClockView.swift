//
//  ClockView.swift
//  AnalogClock
//
//  Created by Oliver Something on 12/23/22.
//

import SwiftUI

struct ClockView: View {
    let width = UIScreen.main.bounds.width - 80
    let height = UIScreen.main.bounds.width - 80
    @State var current_time = Time(min: 0, sec: 0, hour: 0)
    @State var reciever = Timer.publish(every: 1, on: .current, in: .default).autoconnect()
    var body: some View {
        ZStack {
            Circle()
                .fill(Color(.lightGray).opacity(0.2))
            
            ForEach(0..<60, id: \.self) { dot in
                Rectangle()
                    .fill(Color.primary)
                    .frame(width: 2, height: (dot % 5) == 0 ? 15 : 5)
                    .offset(y: (height - 30) / 2)
                    .rotationEffect(.init(degrees: Double(dot) * 6))
                
                Rectangle()
                    .fill(Color(uiColor: .systemGray))
                    .frame(width: 2, height: (height - 100) / 2)
                    .offset(y: -(height - 100) / 4)
                    .rotationEffect(.init(degrees: Double(current_time.sec) * 6))
                
                Rectangle()
                    .fill(Color.primary)
                    .frame(width: 4, height: (height - 120) / 2)
                    .offset(y: -(height - 120) / 4)
                    .rotationEffect(.init(degrees: Double(current_time.min) * 6))
                
                Rectangle()
                    .fill(Color(uiColor: .systemRed))
                    .frame(width: 4.5, height: (height - 140) / 2)
                    .offset(y: -(height - 160) / 4)
                    .rotationEffect(.init(degrees: Double(current_time.hour + current_time.min / 60) * 30))
                
                Circle()
                    .fill(Color.primary)
                    .frame(width: 15, height: 15)
                
            }
        }
        .frame(width: width, height: height)
        .onAppear(perform: {
            let calender = Calendar.current
            let min = calender.component(.minute, from: Date())
            let sec = calender.component(.second, from: Date())
            let hour = calender.component(.hour, from: Date())
            withAnimation(Animation.linear(duration: 0.01)) {
                self.current_time = Time(min: min, sec: sec, hour: hour)
            }
        })
        .onReceive(reciever) { (_) in
            let calender = Calendar.current
            let min = calender.component(.minute, from: Date())
            let sec = calender.component(.second, from: Date())
            let hour = calender.component(.hour, from: Date())
            withAnimation(Animation.linear(duration: 0.01)) {
                self.current_time = Time(min: min, sec: sec, hour: hour)
            }
        }
    }
}
