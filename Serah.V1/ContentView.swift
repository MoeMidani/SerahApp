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
    //    func fetchQuestion(_ difficult: Int)->String{
    ////        questionPulled.toggle()
    //        return "Hello"
    //    }
    
    //    @State private var isQuestionInProgress = false
    @State private var isShowing = false
    @State private var text = "..."
    @State private var difficultyLevel : Int = 1
    @State private var questionPulled : Bool = false
    //    @State var questionATM : String = ""
    @State var boxView : Bool = false
    //    let timer : Int
    
    
    
    var body: some View {
        ZStack{
            if (boxView){
              boxQuestionView(difficulty: 1)
                        }else{
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
                                Button("ابدأ"){
                                    questionPulled.toggle()
                                    boxView.toggle()}.foregroundColor(.black)
                                
                                    Button("back"){
                                        questionPulled.toggle()
                                        
                                    }
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
        
        
    }}
}



#Preview {
    ContentView()
}
