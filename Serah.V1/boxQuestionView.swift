//
//  circleQuestionView.swift
//  mobPorgrammingHuddle
//
//created by Mohamed Midani 10/3/23.

import SwiftUI

struct boxQuestionView: View {
    func fetchQuestion(_ difficulty : Int)->TriviaQuestion{
        
        return TriviaQuestion(question: "ما هو اسم أم الرسول صلى الله عليه وسلم؟", choices: ["آمنة بنت وهب", "خديجة بنت خويلد", "حليمة السعدية", "خولة بنت الأزور"], correctAnswerIndex: 2)
    }
    
    let timers = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var difficulty : Int
    var isQuestionInProgress = true
    var totalTime : Float = 30.0
    @State var timeRemaining: Float = 0
    var minutes: Int {Int(timeRemaining) / 60}
    var seconds: Int {Int(timeRemaining) % 60}
    
    var body: some View {
        
        timerView
            .onAppear {
                timeRemaining = totalTime
            }
            .onReceive(timers) { _ in
                incrementTimer()
            }
        
    }
    
    
    func incrementTimer() {
        if timeRemaining > 0 {
            timeRemaining -= 1
        } else {
            // Timer expired, you can perform an action here
        }
    }
    
    var timerView: some View {

        VStack{
            var currentQuestion = fetchQuestion(difficulty)

            Image("logo")
                .padding(.bottom, 30)
            ZStack {
                Rectangle()
                    .fill(CustomColor.boxColor)
                    .frame(width: 340, height: 210)
                    .cornerRadius(50)
                    
                Text(currentQuestion.question).font(.headline.italic())
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
                    .overlay( RoundedRectangle(cornerRadius: 50)
                        .trim(from: 0.0, to: CGFloat(1.0 - timeRemaining / totalTime))
                        .stroke(
                            AngularGradient(
                                gradient: Gradient(colors: [.green, .red]),
                                center: .center,
                                startAngle: .degrees(0),
                                endAngle: .degrees(360)), lineWidth: 12)
                              
                              
                            .rotationEffect(.degrees(-90))
                            .frame(width: 210, height: 340)
                            .shadow(radius: 7)
                    )
                
                
//                Text(question).font(.headline.italic())
//                    .fontWeight(.regular)
//                    .multilineTextAlignment(.center)
//                    .padding(.horizontal, 69.0)
                
                if isQuestionInProgress
                //
                
                {Text(String(format: "%02d:%02d", minutes, seconds))
                        .font(.title)
                        .foregroundColor(.black)
                        .padding(.top, 150)
                    
                }
                //                Text(String(timer))
            }
            Spacer()
            Spacer()
            Spacer()
            
            HStack {
                Spacer()
                ZStack{
                    Rectangle()
                        .fill(CustomColor.smallBox)
                        .frame(width: 155, height: 110)
                        .cornerRadius(20)
                    Text(currentQuestion.choices[0]).font(.headline.italic())
                        .fontWeight(.regular)
                        .multilineTextAlignment(.center)
                }
                Spacer()
                ZStack{
                    Rectangle()
                        .fill(CustomColor.smallBox)
                        .frame(width: 155, height: 110)
                        .cornerRadius(20)
                    Text(currentQuestion.choices[1]).font(.headline.italic())
                        .fontWeight(.regular)
                        .multilineTextAlignment(.center)
                }
                Spacer()
                
            }
            Spacer()
            HStack {
                Spacer()
                ZStack{
                    Rectangle()
                        .fill(CustomColor.smallBox)
                        .frame(width: 155, height: 110)
                        .cornerRadius(20)
                    Text(currentQuestion.choices[2]).font(.headline.italic())
                        .fontWeight(.regular)
                        .multilineTextAlignment(.center)
                }
                Spacer()
                
                ZStack{
                    Rectangle()
                        .fill(CustomColor.smallBox)
                        .frame(width: 155, height: 110)
                        .cornerRadius(20)
                    Text(currentQuestion.choices[3]).font(.headline.italic())
                        .fontWeight(.regular)
                        .multilineTextAlignment(.center)
                }
                Spacer()
                
            }
            Spacer()
            Spacer()
            Spacer()
            Spacer()
        }
    }
}


#Preview {
    boxQuestionView(difficulty: 1)
}
