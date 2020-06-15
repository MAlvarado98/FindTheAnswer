//
//  MathView.swift
//  FindTheAnswer
//
//  Created by Mario Alvarado on 6/14/20.
//  Copyright © 2020 Mario Alvarado. All rights reserved.
//

import SwiftUI

struct MathView: View {
    @ObservedObject var viewRouter: ViewRouter
    @State private var answer: String = ""
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
            Text("x + y = ?")
            Spacer()
            HStack{
                Spacer()
                Text("Answer: ")
                Spacer()
                ForEach(1..<5){number in
                    Button(action: {
                        
                    }){
                        Text("\(number)")
                    }
                    Spacer()
                }
                Spacer()
            }
            Spacer()
        }
    }
}

struct MathView_Previews: PreviewProvider {
    static var previews: some View {
        MathView(viewRouter: ViewRouter())
    }
}
