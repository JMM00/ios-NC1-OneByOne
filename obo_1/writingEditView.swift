//
//  writingEditView.swift
//  obo_1
//
//  Created by Jeon Jimin on 2022/04/30.
//

import SwiftUI

extension View {
  func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
    background(
      GeometryReader { geometryProxy in
        Color.clear
          .preference(key: SizePreferenceKey.self, value: geometryProxy.size)
      }
    )
    .onPreferenceChange(SizePreferenceKey.self, perform: onChange)
  }
}

private struct SizePreferenceKey: PreferenceKey {
  static var defaultValue: CGSize = .zero
  static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}

struct writingEditView: View {
    let sentence: String = "I just wanted to take another looak at you"
    
    var body: some View {
        Color.clear
            .frame(height: 1)
            .readSize { size in }
    }
}

struct writingEditView_Previews: PreviewProvider {
    static var previews: some View {
        writingEditView()
    }
}
