//
//  ContentView.swift
//  Serah.V1
//
//  Created by Mohamed Midani on 10/17/23.
//

import SwiftUI



struct TriviaQuestion {
    let question: String
    let choices: [String]
    let correctAnswerIndex: Int
    
}


struct ContentView: View {

#warning("pass box view to both views")
    @State var boxView : Bool = false // rename to "isPlaying"

    
    
    var body: some View {
        if boxView {
#warning("data types should be named in PascalCase")
            boxQuestionView(difficulty: 1)
                .transition(.slide)
//                .animation(.easeIn, value: 1)
        }else{
            WelcomeView(boxView: $boxView)
                .transition(.slide)
//                .animation(.easeIn, value: 1)
        }
    }
}



#Preview {
    ContentView()
}

struct WelcomeView: View {
    //    func fetchQuestion(_ difficult: Int)->String{
    ////        questionPulled.toggle()
    //        return "Hello"
    //    }
    
    //    @State private var isQuestionInProgress = false
    @State private var isShowing = false
    @State private var text = "..."
    @State private var difficultyLevel : Int = 1
    @State private var questionPulled : Bool = false
    @Binding var boxView: Bool
    //    @State var questionATM : String = ""
    //    let timer : Int
    var body: some View {
        VStack {
            VStack{
                Image("logo")
                Spacer()
                ZStack{
                    Rectangle()
                        .fill(CustomColor.boxColor)
                        .frame(width: 340, height: 210)
                        .cornerRadius(50)
                        .overlay( RoundedRectangle(cornerRadius: 50)
                            .stroke(Color.white, lineWidth:6)
                        )
                        .shadow(radius: 7)
                    
                    Text("السلام عليكم ورحمة الله وبركاته").font(.title2)
                        .fontWeight(.semibold)
                        .offset(y: -70)
                        .padding(.bottom, 10)
                    Text("اختر المستوى التالي و أجب على الأسئلة ضمن الوقت المحدود").font(.headline.italic())
                        .fontWeight(.regular)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 69.0)
                }
                
                Spacer(minLength: 350)
                
            }
            
            ZStack{
                Rectangle()
                    .fill(CustomColor.smallBox)
                    .frame(width: 320, height: 90)
                    .cornerRadius(50)
                    .overlay( RoundedRectangle(cornerRadius: 50)
                        .stroke(Color.black, lineWidth:6))
                    .shadow(radius: 10)
                
                VStack{
                    if (questionPulled){
                        HStack{
                            Spacer()
                            
                            Button("ابدأ"){
                                withAnimation {
                                    questionPulled.toggle()
                                    boxView.toggle()
                                }
                            }
                            .foregroundColor(.black)
                            
                            Spacer()
                            Rectangle()
                                .fill(Color.black)
                                .frame(width: 4, height: 60)
                            Spacer()
                            Button("عد"){
                                questionPulled.toggle()}.foregroundColor(.black)
                            Spacer()
                            
                        }
                    }else{
                        Button("المستوى"){
                            isShowing.toggle()
                            
                        }
                        .foregroundColor(.black)
                        .confirmationDialog("المستوى", isPresented: $isShowing, titleVisibility: .visible) {
                            
                            
                            Button("مبتدأ"){
                                difficultyLevel = 0
                                questionPulled.toggle()
                                //                                    questionATM = fetchQuestion(0)
                                // question = "Hello"
                                // Timer = 1
                                // isQuestionInProgress = true
                                
                            }
                            
                            Button("متوسط"){
                                difficultyLevel = 1
                                questionPulled.toggle()
                                
                                
                            }
                            
                            Button("خبير"){
                                difficultyLevel = 2
                                questionPulled.toggle()
                            }
                        }
                    }}}
            Spacer()
        }
    }
}
