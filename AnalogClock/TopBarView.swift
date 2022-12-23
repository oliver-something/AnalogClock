//
//  TopBarView.swift
//  AnalogClock
//
//  Created by Oliver Something on 12/23/22.
//

import SwiftUI

struct TopBarView: View {
    @Binding var isDark: Bool
    
    var body: some View {
        HStack {
            Text("Analog Clock")
                .font(.title)
                .fontWeight(.heavy)
            
            Spacer(minLength: 0)
            
            Button(action: {
                isDark.toggle()
            }) {
                Image(systemName: isDark ? "sun.min.fill" : "moon.fill")
                    .foregroundColor(isDark ? .black : .white)
                    .padding()
                    .background(Color.primary)
                    .clipShape(Circle())
                
            }
        }
    }
}
