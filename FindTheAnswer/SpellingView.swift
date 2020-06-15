//
//  SpellingView.swift
//  FindTheAnswer
//
//  Created by Mario Alvarado on 6/14/20.
//  Copyright © 2020 Mario Alvarado. All rights reserved.
//

import SwiftUI

struct SpellingView: View {
    @ObservedObject var viewRouter: ViewRouter
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Button(action: {
                    self.viewRouter.currentPage = "home"
                }){
                    Text("↩︎ Go Back")
                }
                Spacer()
                Text("Score: ")
                Spacer()
                Text("Lifes: ")
                Spacer()
            }
            Spacer()
            Text("RANDOM_WORD")
            Spacer()
            HStack{
                Spacer()
                Text("Answer")
                Spacer()
                ForEach (1 ..< 5){number in
                    Button(action: {
                       
                    }){
                        Text("A")
                    }
                    Spacer()
                }
            }
            Spacer()
        }
    }
}

struct SpellingView_Previews: PreviewProvider {
    static var previews: some View {
        SpellingView(viewRouter: ViewRouter())
    }
}
