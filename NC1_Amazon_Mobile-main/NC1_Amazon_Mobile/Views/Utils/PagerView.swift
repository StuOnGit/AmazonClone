//
//  PagerView.swift
//  NC1_Amazon_Mobile
//
//  Created by Francesco De Stasio on 22/11/22.
//

import SwiftUI

struct PagerView<Content : View> : View {
    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    let pageCount: Int
       @Binding var currentIndex: Int
       let content: Content

    init(pageCount: Int, currentIndex: Binding<Int>, @ViewBuilder content: () -> Content) {
        self.pageCount = pageCount
        self._currentIndex = currentIndex
        self.content = content()
        
        
    }
}

struct PagerView_Previews: PreviewProvider {
    static var previews: some View {
        PagerView(pageCount: 3, currentIndex: .constant(2)) {
            Text("hello") as! Content
        }
    }
}
