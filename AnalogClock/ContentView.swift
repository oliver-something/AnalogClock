//
//  ContentView.swift
//  AnalogClock
//
//  Created by Oliver Something on 12/23/22.
//

import SwiftUI

struct ContentView: View {
    @State var isDark: Bool = false
    var body: some View {
        NavigationView {
            VStack {
                // Top Bar
                TopBarView(isDark: $isDark)
                    .navigationBarHidden(true)
                    .preferredColorScheme(isDark ? .dark : .light)
                    .padding()
                Spacer(minLength: 0)
                // Body
                ClockView()
                Spacer(minLength: 0)
                
                Text(Locale.current.localizedString(forRegionCode: Locale.current.language.region!.identifier) ?? "Unknown")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(.top, 35)
                
                Text(getTime())
                    .font(.system(size: 45))
                    .fontWeight(.semibold)
                Spacer()
            }
        }
    }
    
    func getTime() -> String {
        let format = DateFormatter()
        format.dateFormat = "hh:mm a"
        return format.string(from: Date())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
