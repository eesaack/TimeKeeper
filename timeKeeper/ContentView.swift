//
//  ContentView.swift
//  timeKeeper
//
//  Created by eesaack on 22.09.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var timerMode: TimerMode = .initial
    
    @State var selectedPickerIndex = 0
    
    let avaiableMinutes = Array(1...59)
    
    var body: some View {
        
        
        NavigationView {

            VStack {
                Text("00:59")
                    .font(.system(size: 80))
                    .padding(.top, 10 )
                    .foregroundColor(.black)
                
                HStack {
                    Spacer()
                    
                    Image(systemName: timerMode == .running ? "pause.circle.fill" : "play.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 100)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Image(systemName: "arrow.counterclockwise.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 100)
                        .foregroundColor(.black)
                    
                    Spacer()
                }
                
                if timerMode == .initial {
                    Picker(selection: $selectedPickerIndex, label: Text("")) {
                        ForEach(0 ..< avaiableMinutes.count) {
                            Text("\(self.avaiableMinutes[$0]) min")
                                .foregroundColor(.black)
                        }
                    }
                    .labelsHidden()
                }
        
            }
            .navigationTitle("Timer")
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
