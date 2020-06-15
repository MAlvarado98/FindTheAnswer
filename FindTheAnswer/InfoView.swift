//
//  InfoView.swift
//  FindTheAnswer
//
//  Created by Mario Alvarado on 6/14/20.
//  Copyright © 2020 Mario Alvarado. All rights reserved.
//

import SwiftUI

struct InfoView: View {
    @ObservedObject var viewRouter: ViewRouter
    var body: some View {
        VStack{
            Spacer()
            Button(action: {
                self.viewRouter.currentPage = "home"
            }){
                Text("↩︎ Go Back")
            }
            Spacer()
            Text("FindTheAnswer")
            Text("FindTheAnswer is a simple educational game for children. This game makes children think and improve their math and spelling skills.")
            Text("Version 1.0")
            Text("By: Mario Alvarado")
            Spacer()
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(viewRouter: ViewRouter())
    }
}
