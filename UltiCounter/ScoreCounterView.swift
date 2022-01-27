//
//  ScoreCounterView.swift
//  UltiCounter
//
//  Created by Jonathan Goldsmith on 1/23/22.
//

import SwiftUI

struct ScoreCounterView: View {
  @ObservedObject var countViewModel: CountViewModel
  @ObservedObject var otherTeamViewModel: CountViewModel
  @ObservedObject var textToTalkViewModel: TextToTalkViewModel
  let teamName: String
  let otherTeamName: String
  
  var body: some View {
    VStack {
      Text("\(countViewModel.counter)")
      HStack {
        Button {
          if countViewModel.counter > 0 {
            countViewModel.counter -= 1
          }
          textToTalkViewModel.speakScore(teamOne: teamName,
                                         teamOneScore: countViewModel.counter,
                                         teamTwo: otherTeamName,
                                         teamTwoScore: otherTeamViewModel.counter)
        } label: {
          Image(systemName: "minus.square")
        }
        Spacer().frame(width: 30)
        Button {
          countViewModel.counter += 1
          textToTalkViewModel.speakScore(teamOne: teamName,
                                         teamOneScore: countViewModel.counter,
                                         teamTwo: otherTeamName,
                                         teamTwoScore: otherTeamViewModel.counter)
        } label: {
          Image(systemName: "plus.square")
        }
      }
    }
  }
}
