//
//  ContentView.swift
//  OptionalPattern
//
//  Created by ramil on 17.01.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear {
                switchOnAnOptionalType()
                collectionsOfOptionals()
            }
    }
    
    let capital: String? = "London"
    
    let capitals = ["Paris", "Rome", nil, "Madrid"]
    
    func switchOnAnOptionalType() {
        switch capital {
        case .none:
            print("value is nil")
        case .some(let capital):
            print("value is \(capital)")
        }
    }
    
    func collectionsOfOptionals() {
        for case let capital? in capitals {
            print(capital)
        }
        print(compare("Paris", nil).rawValue)
        print(compare(nil, "Paris").rawValue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    func compare(_ lhs: String?, _ rhs: String?) -> ComparisonResult {
        switch (lhs, rhs) {
        case (.none, .none): return .orderedSame
        case (.some, .none): return .orderedDescending
        case (.none, .some): return .orderedAscending
        case let (lhs?, rhs?):
            if lhs == rhs { return .orderedSame }
            return lhs < rhs ? .orderedAscending : .orderedDescending
        }
    }
}
