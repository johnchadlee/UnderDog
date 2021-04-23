import Foundation
import SwiftUI
import UIKit
import Combine
import Firebase

struct BettingView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    let tipPercentages = [10,15,20,25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
    var body: some View {
            Form{
                Section {
                    TextField("Betting Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                
                    Picker("Number of people" , selection: $numberOfPeople){
                        ForEach(2 ..< 100 ){
                            Text("\($0) people")
                        }
                    }
                }
                
                Section(header: Text("ODDS")) {
                    Picker("Tip Selection", selection: $tipPercentage){
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
        }
    }
    






///Calculator Option
/*
enum CalcButton: String {
    case zero  = "0"
    case one   = "1"
    case two   = "2"
    case three = "3"
    case four  = "4"
    case five  = "5"
    case six   = "6"
    case seven = "7"
    case eight = "8"
    case nine  = "9"
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "x"
    case equal = "="
    case clear = "<-"
    case decimal = "."
    case percent = "%"
    case negative = "-/+"
    
    var buttonColor: Color {
        switch self{
        case .add, .subtract, .multiply, .divide, .equal:
            return . orange
        case .clear, .negative, .percent  :
            return .orange
        default:
            return Color(UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1))
        }
    }
}
enum Operation {
    case add, subtract, multiply, divide, none
}

struct BettingView: View {
    @State var value = "0"
    @State var runningNumber = 0
    @State var currentOperation: Operation = .none

    let buttons: [[CalcButton]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal],
    ]

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()

                // Text display
                HStack {
                    Spacer()
                    Text(value)
                        .bold()
                        .font(.system(size: 100))
                        .foregroundColor(.white)
                }
                .padding()

                // Our buttons
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { item in
                            Button(action: {
                                self.didTap(button: item)
                            }, label: {
                                Text(item.rawValue)
                                    .font(.system(size: 32))
                                    .frame(
                                        width: self.buttonWidth(item: item),
                                        height: self.buttonHeight()
                                    )
                                    .background(item.buttonColor)
                                    .foregroundColor(.white)
                                    .cornerRadius(self.buttonWidth(item: item)/2)
                            })
                        }
                    }
                    .padding(.bottom, 3)
                }
            }
        }
    }
    func didTap(button: CalcButton) {
            switch button {
            case .add, .subtract, .multiply, .divide, .equal:
                if button == .add {
                    self.currentOperation = .add
                    self.runningNumber = Int(self.value) ?? 0
                }
                else if button == .subtract {
                    self.currentOperation = .subtract
                    self.runningNumber = Int(self.value) ?? 0
                }
                else if button == .multiply {
                    self.currentOperation = .multiply
                    self.runningNumber = Int(self.value) ?? 0
                }
                else if button == .divide {
                    self.currentOperation = .divide
                    self.runningNumber = Int(self.value) ?? 0
                }
                else if button == .equal {
                    let runningValue = self.runningNumber
                    let currentValue = Int(self.value) ?? 0
                    switch self.currentOperation {
                    case .add: self.value = "\(runningValue + currentValue)"
                    case .subtract: self.value = "\(runningValue - currentValue)"
                    case .multiply: self.value = "\(runningValue * currentValue)"
                    case .divide: self.value = "\(runningValue / currentValue)"
                    case .none:
                        break
                    }
                }

                if button != .equal {
                    self.value = "0"
                }
            case .clear:
                self.value = "0"
            case .decimal, .negative, .percent:
                break
            default:
                let number = button.rawValue
                if self.value == "0" {
                    value = number
                }
                else {
                    self.value = "\(self.value)\(number)"
                }
            }
        }

        func buttonWidth(item: CalcButton) -> CGFloat {
            if item == .zero {
                return ((UIScreen.main.bounds.width - (4*12)) / 4) * 2
            }
            return (UIScreen.main.bounds.width - (5*12)) / 4
        }

        func buttonHeight() -> CGFloat {
            return (UIScreen.main.bounds.width - (5*12)) / 4
        }
    }
struct bettingView_Pre : PreviewProvider {
    @EnvironmentObject var session: SessionStore
    static var previews: some View{
      BettingView()
    }
    
}
*/