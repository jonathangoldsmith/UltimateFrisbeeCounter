//
//  ContentView.swift
//  UltiCounter
//
//  Created by Jonathan Goldsmith on 1/23/22.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var stallViewModel = StallViewModel()
  @ObservedObject var textToTalkViewModel = TextToTalkViewModel()
  
  @State private var callMade = false
  @State private var startingOnOffense = false
  @State private var startingOnLeft = false
  @State private var tapCount = 0
  @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
  
  var body: some View {
    VStack {
      Spacer()
      VStack {
        Button("Starting") {
          tapCount += 1
          if tapCount == 0 {
            startingOnLeft = false
            startingOnOffense = false
          } else if tapCount == 2 {
            startingOnLeft = false
            startingOnOffense = true
          } else if tapCount == 4 {
            startingOnLeft = true
            startingOnOffense = true
          } else if tapCount == 6 {
            startingOnLeft = true
            startingOnOffense = false
          } else if tapCount == 8 {
            tapCount = 0
          }
        }
        HStack {
          if startingOnOffense && startingOnLeft {
            Image(systemName: "arrow.left.circle")
            Text("Offense")
          } else if startingOnOffense && !startingOnLeft {
            Text("Offense")
            Image(systemName: "arrow.right.circle")
          } else if !startingOnOffense && startingOnLeft {
            Image(systemName: "arrow.left.circle")
            Text("Defense")
          } else if !startingOnOffense && !startingOnLeft {
            Text("Defense")
            Image(systemName: "arrow.right.circle")
          }
        }
      }
      Spacer()
      HStack {
        Spacer()
        VStack {
          Text("Us")
          ScoreCounterView(countViewModel: stallViewModel.usCount,
                           otherTeamViewModel: stallViewModel.themCount,
                           textToTalkViewModel: textToTalkViewModel)
        }
        Spacer()
        VStack {
          Text("Them")
          ScoreCounterView(countViewModel: stallViewModel.themCount,
                           otherTeamViewModel: stallViewModel.usCount,
                           textToTalkViewModel: textToTalkViewModel)
        }
        Spacer()
      }
      Group {
        Spacer()
        Image(systemName: "\(stallViewModel.stallCount).square")
          .onReceive(timer) { _ in
            if stallViewModel.stallCount < 10 {
              stallViewModel.stallCount += 1
              textToTalkViewModel.speak(text: "\(stallViewModel.stallCount)")
            } else if stallViewModel.stallCount == 10 {
              textToTalkViewModel.speak(text: "Stall")
              timer.upstream.connect().cancel()
            }
          }
          .font(.system(size: 60))
        Spacer()
        Button("Stall") {
          timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
          if !callMade {
            stallViewModel.stallCount = 0
          } else {
            callMade = false
          }
        }
        Spacer()
        Button("Turn") {
          timer.upstream.connect().cancel()
          textToTalkViewModel.speak(text: "Turn")
          stallViewModel.stallCount = 0
        }
        Spacer()
        Button("Call Made") {
          timer.upstream.connect().cancel()
          textToTalkViewModel.speak(text: "Call Made")
          stallViewModel.showStallView.toggle()
        }
        .sheet(isPresented: $stallViewModel.showStallView){
          CallMadeView(stallViewModel: stallViewModel, textToTalkViewModel: textToTalkViewModel)
        }
      }
    }
    .font(.largeTitle)
    .onAppear {
      timer.upstream.connect().cancel()
    }
    .onReceive(stallViewModel.$showStallView) { showStallView in
      callMade = true
    }
    Spacer()
      .frame(height: 20)
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
