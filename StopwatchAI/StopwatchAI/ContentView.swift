//
//  ContentView.swift
//  StopwatchAI
//
//  Created by Simon Corpuz on 9/6/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isRunning = false
    @State private var elapsedTime = 0.0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            Text(String(format: "%.1f", elapsedTime))
                .font(.system(size: 60))
                .padding()

            HStack {
                Button(action: {
                    // Start or Stop the stopwatch
                    self.isRunning.toggle()
                }) {
                    Text(isRunning ? "Stop" : "Start")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                Button(action: {
                    // Reset the stopwatch
                    self.elapsedTime = 0.0
                    self.isRunning = false
                }) {
                    Text("Reset")
                        .font(.title)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
        .onReceive(timer) { _ in
            if self.isRunning {
                self.elapsedTime += 0.1
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
