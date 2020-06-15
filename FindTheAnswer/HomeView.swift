//
//  HomeView.swift
//  FindTheAnswer
//
//  Created by Mario Alvarado on 6/14/20.
//  Copyright © 2020 Mario Alvarado. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewRouter: ViewRouter
    var body: some View {
        VStack{
            Spacer()
            Text("Find The Answer!")
            Spacer()
            HStack{
                Spacer()
                Button(action: {
                    self.viewRouter.currentPage = "math"
                }){
                    Text("Math")
                }
                Spacer()
                Button(action: {
                    self.viewRouter.currentPage = "spelling"
                }){
                    Text("Spelling")
                }
                Spacer()
            }
            Spacer()
            Button(action: {
                self.viewRouter.currentPage = "information"
            }){
                Text("Information")
            }
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewRouter: ViewRouter())
    }
}
