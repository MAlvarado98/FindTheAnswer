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
    
    @State private var problem: String = ""
    @State private var answer: String = ""
    @State private var options: [String] = ["a","a","a","a"]
    @State private var operators = ["+","-","x","/"]
    @State private var showMessage: Bool = false
    @State private var activeAlert: Int = 0 //0 is correct, 1 is error, 2 lost
    @State private var score: Int = 0
    @State private var lifes: Int = 3
    
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
                Text("Score: \(self.score)")
                Spacer()
                Text("Lifes: \(self.lifes)")
                Spacer()
            }
            Spacer()
            Text("\(self.problem)")
            Spacer()
            HStack{
                Spacer()
                Text("Answer: ")
                Spacer()
                ForEach(0..<self.options.count){n in
                    Button(action: {
                        if self.options[n] == self.answer{
                            self.activeAlert = 0
                            self.showMessage = true
                            self.score += 1
                            self.getProblem()
                        }else{
                            if self.lifes > 0{
                                self.activeAlert = 1
                                self.showMessage = true
                                self.lifes -= 1
                                self.getProblem()
                            }else{
                                self.activeAlert = 2
                                self.showMessage = true
                                DispatchQueue.main.asyncAfter(deadline: .now()+3){
                                    self.viewRouter.currentPage = "home"
                                }
                            }
                            
                        }
                    }){
                        Text("\(self.options[n])")
                    }
                    .alert(isPresented: self.$showMessage){
                        switch self.activeAlert{
                        case 0:
                            return Alert(title: Text("✔︎"))
                        case 1:
                            return Alert(title: Text("✖︎"))
                        case 2:
                            return Alert(title: Text("✖︎"), message: Text("Sorry, you've lost\nThe correct answer was \(self.answer) \nYour score was \(self.score)"))
                        default:
                            return Alert(title: Text("Default"))
                        }
                    }
                    Spacer()
                }
                Spacer()
            }
            Spacer()
        }.onAppear(perform: getProblem)
    }
    
    func getProblem(){
        let op = self.operators[Int.random(in: 0..<self.operators.count)]
        var problemElems = ["","\(op)","","=",""]
        let result = Int.random(in: 5..<1000)
        problemElems[4] = "\(result)"
        var first = 0
        var second = 0
        switch op{
        case "+":
            first = Int.random(in: 1..<result)
            second = result - first
        case "-":
            first = Int.random(in: (result+1)..<999)
            second = abs(result-first)
        case "x":
            let divisors = getAllDivisors(result: result)
            second = divisors[Int.random(in: 0..<divisors.count)]
            first = result/second
        case "/":
            let multipliers = getAllMultipiers(result: result)
            first = multipliers[Int.random(in: 0..<multipliers.count)]
            second = first/result
        default:
            break
        }
        problemElems[0] = "\(first)"
        problemElems[2] = "\(second)"
        
        //Now we choose a random element
        let opts = [0,1,2,4]
        //Now we chose the answer
        let answerIndex = opts[Int.random(in: 0 ..< opts.count)]
        self.problem = ""
        //Asign our answer to the State
        self.answer = problemElems[answerIndex]
        //Write the problem passing by the answer
        for index in 0..<problemElems.count {
            if index != answerIndex{
                self.problem += "\(problemElems[index]) "
            }else{
                self.problem += "? "
            }
        }
        //Now we must generate the options
        if answerIndex == 1{
            let ops = self.operators.shuffled()
            for index in 0 ..< ops.count {
                self.options[index] = "\(ops[index])"
            }
        }else{
            var arr = [self.answer]
            for _ in 0 ..< 3{
                let answerInt:Int? = Int(self.answer)
                if Int.random(in: 1...2) % 2 == 0 {
                    let num = Int.random(in: 0..<(answerInt ?? 0))
                    arr.append("\(num)")
                }else{
                    let num = Int.random(in: ((answerInt ?? 0)+1)..<((answerInt ?? 1)+50))
                    arr.append("\(num)")
                }
            }
            arr = arr.shuffled()
            for index in 0..<4{
                self.options[index] = arr[index]
            }
        }
    }
    
    func getAllDivisors(result:Int) -> [Int]{
        var options = [1]
        for index in 1..<result{
            if result % index == 0{
                options.append(index)
            }
        }
        return options
    }
    
    func getAllMultipiers(result: Int) -> [Int] {
        var options = [result]
        for index in (result+1)..<1000{
            if index % result == 0{
                options.append(index)
            }
        }
        return options
    }
}

struct MathView_Previews: PreviewProvider {
    static var previews: some View {
        MathView(viewRouter: ViewRouter())
    }
}
