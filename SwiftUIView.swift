////
////  circleQuestionView.swift
////  mobPorgrammingHuddle
////
////created by Mohamed Midani 10/3/23.
//
//import SwiftUI
//
//struct boxQuestionView: View {
//    let timers = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
//  //  var choices : String
//    var question : String
//    var isQuestionInProgress = true
//    let timer : Int
//    var totalTime: Float { Float(timer * 60) }
//    @State var timeRemaining: Float = 1
//    
//    var minutes: Int {
//        Int(timeRemaining) / 60
//    }
//    
//    var seconds: Int {
//        Int(timeRemaining) % 60
//    }
//    
//    var body: some View {
//        if (timer == 0) {
//            welcomePage
//        }else{
//            timerView
//                .onAppear {
//                    timeRemaining = totalTime
//                }
//                .onReceive(timers) { _ in
//                    incrementTimer()
//                }
//        }
//    }
//    
//    func incrementTimer() {
//        if timeRemaining > 0 {
//            timeRemaining -= 1
//        } else {
//            // Timer expired, you can perform an action here
//        }
//    }
//    
//    var timerView: some View {
//        VStack{
//            Image("logo")
//                .padding(.bottom, 30)
//            ZStack {
//                Rectangle()
//                    .fill(CustomColor.boxColor)
//                    .frame(width: 340, height: 210)
//                    .cornerRadius(50)
//                
//                    .overlay( RoundedRectangle(cornerRadius: 50)
//                        .trim(from: 0.0, to: CGFloat(1.0 - timeRemaining / totalTime))
//                        .stroke(
//                            AngularGradient(
//                                gradient: Gradient(colors: [.green, .red]),
//                                center: .center,
//                                startAngle: .degrees(0),
//                                endAngle: .degrees(360)), lineWidth: 12)
//                              
//                              
//                            .rotationEffect(.degrees(-90))
//                            .frame(width: 210, height: 340)
//                            .shadow(radius: 7)
//                    )
//                
//                
//                Text(question).font(.headline.italic())
//                    .fontWeight(.regular)
//                    .multilineTextAlignment(.center)
//                    .padding(.horizontal, 69.0)
//                
//                if isQuestionInProgress
//                //
//                
//                {Text(String(format: "%02d:%02d", minutes, seconds))
//                        .font(.title)
//                        .foregroundColor(.black)
//                        .padding(.top, 150)
//                    
//                }
//                //                Text(String(timer))
//            }
//            Spacer()
//            Spacer()
//            Spacer()
//            
//            HStack {
//                Spacer()
//                ZStack{
//                    Rectangle()
//                        .fill(CustomColor.smallBox)
//                        .frame(width: 155, height: 110)
//                        .cornerRadius(20)
//                    Text(question).font(.headline.italic())
//                        .fontWeight(.regular)
//                        .multilineTextAlignment(.center)
//                }
//                Spacer()
//                ZStack{
//                    Rectangle()
//                        .fill(CustomColor.smallBox)
//                        .frame(width: 155, height: 110)
//                        .cornerRadius(20)
//                    Text(question).font(.headline.italic())
//                        .fontWeight(.regular)
//                        .multilineTextAlignment(.center)
//                }
//                Spacer()
//
//            }
//            Spacer()
//            HStack {
//                Spacer()
//                ZStack{
//                    Rectangle()
//                        .fill(CustomColor.smallBox)
//                        .frame(width: 155, height: 110)
//                        .cornerRadius(20)
//                    Text(question).font(.headline.italic())
//                        .fontWeight(.regular)
//                        .multilineTextAlignment(.center)
//                }
//                Spacer()
//
//                ZStack{
//                    Rectangle()
//                        .fill(CustomColor.smallBox)
//                        .frame(width: 155, height: 110)
//                        .cornerRadius(20)
//                    Text(question).font(.headline.italic())
//                        .fontWeight(.regular)
//                        .multilineTextAlignment(.center)
//                }
//                Spacer()
//                
//            }
//            Spacer()
//            Spacer()
//            Spacer()
//            Spacer()
//        }
//    }
//    var welcomePage: some View {
//        VStack{
//            Image("logo")
//            Spacer()
//            ZStack{
//                Rectangle()
//                    .fill(CustomColor.boxColor)
//                    .frame(width: 340, height: 210)
//                    .cornerRadius(50)
//                    .overlay( RoundedRectangle(cornerRadius: 50)
//                        .stroke(Color.white, lineWidth:6)
//                    )
//                    .shadow(radius: 7)
//                
//                Text("السلام عليكم ورحمة الله وبركاته").font(.title2)
//                    .fontWeight(.semibold)
//                    .offset(y: -70)
//                    .padding(.bottom, 10)
//                Text("اختر المستوى التالي و أجب على الأسئلة ضمن الوقت المحدود").font(.headline.italic())
//                    .fontWeight(.regular)
//                    .multilineTextAlignment(.center)
//                    .padding(.horizontal, 69.0)
//            }
//            Spacer()
//            Spacer()
//            Spacer()
//            Spacer()
//        }
//    }
//}
//
//#Preview {
//    boxQuestionView(question: "HI", timer: 1)
//}
