//
//  MotherView.swift
//  FindTheAnswer
//
//  Created by Mario Alvarado on 6/14/20.
//  Copyright © 2020 Mario Alvarado. All rights reserved.
//

import SwiftUI

struct MotherView: View {
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack{
            if viewRouter.currentPage == "home"{
                HomeView(viewRouter: viewRouter)
            }else if viewRouter.currentPage == "math"{
                MathView(viewRouter: viewRouter)
            }else if viewRouter.currentPage == "spelling"{
                SpellingView(viewRouter: viewRouter)
            }else{
                InfoView(viewRouter: viewRouter)
            }
        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView(viewRouter: ViewRouter())
    }
}
