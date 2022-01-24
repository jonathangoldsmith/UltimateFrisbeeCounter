//
//  CallMadeView.swift
//  UltiCounter
//
//  Created by Jonathan Goldsmith on 1/23/22.
//

import SwiftUI

struct CallMadeView: View {
  @ObservedObject var stallViewModel: StallViewModel
  @ObservedObject var textToTalkViewModel: TextToTalkViewModel

  var body: some View {
    VStack {
      Spacer()
        .frame(height: 20)
      Text("Coming in on?")
        .font(.largeTitle)
      Spacer()
      HStack {
        Spacer()
        ComingInOnButton(stallViewModel: stallViewModel, textToTalkViewModel: textToTalkViewModel, stallCount: 0)
        Spacer()
        ComingInOnButton(stallViewModel: stallViewModel, textToTalkViewModel: textToTalkViewModel, stallCount: 1)
        Spacer()
        ComingInOnButton(stallViewModel: stallViewModel, textToTalkViewModel: textToTalkViewModel, stallCount: 2)
        Spacer()
      }
      Spacer()
      HStack {
        Spacer()
        ComingInOnButton(stallViewModel: stallViewModel, textToTalkViewModel: textToTalkViewModel, stallCount: 3)
        Spacer()
        ComingInOnButton(stallViewModel: stallViewModel, textToTalkViewModel: textToTalkViewModel, stallCount: 4)
        Spacer()
        ComingInOnButton(stallViewModel: stallViewModel, textToTalkViewModel: textToTalkViewModel, stallCount: 5)
        Spacer()
      }
      Spacer()
      HStack {
        Spacer()
        ComingInOnButton(stallViewModel: stallViewModel, textToTalkViewModel: textToTalkViewModel, stallCount: 6)
        Spacer()
        ComingInOnButton(stallViewModel: stallViewModel, textToTalkViewModel: textToTalkViewModel, stallCount: 7)
        Spacer()
        ComingInOnButton(stallViewModel: stallViewModel, textToTalkViewModel: textToTalkViewModel, stallCount: 8)
        Spacer()
      }
      Spacer()
    }
  }
}

struct ComingInOnButton: View {
  @ObservedObject var stallViewModel: StallViewModel
  @ObservedObject var textToTalkViewModel: TextToTalkViewModel
  let stallCount: Int
  
  var body: some View {
    Button {
      stallViewModel.stallCount = stallCount
      stallViewModel.showStallView = false
      textToTalkViewModel.speak(text: "Coming in on \(stallCount)")
    } label: {
        Image(systemName: "\(stallCount).square")
        .font(.system(size: 60))
    }
  }
}
