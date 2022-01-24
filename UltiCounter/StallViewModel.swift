//
//  StallViewModel.swift
//  UltiCounter
//
//  Created by Jonathan Goldsmith on 1/23/22.
//

import Combine

class StallViewModel: ObservableObject {
  @Published var showStallView: Bool = false
  @Published var stallCount: Int = 0
  @Published var usCount = CountViewModel()
  @Published var themCount = CountViewModel()
}

class CountViewModel: ObservableObject {
  @Published var counter: Int = 0
}


