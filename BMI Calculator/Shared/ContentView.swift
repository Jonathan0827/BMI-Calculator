//
//  ContentView.swift
//  Shared
//
//  Created by 임준협 on 2022/05/01.
//

import SwiftUI
struct normalWeight: View {
    var body: some View {
        Text("정상")
            .font(.largeTitle)
            .fontWeight(.bold)
        Text("유지 하여라")
    }
}
struct overWeight: View {
    var body: some View {
        Text("비만")
            .font(.largeTitle)
            .fontWeight(.bold)
        Text("살을 빼도록 하여라")
    }
}
struct whoMadeThis: View {
    var body: some View{
        NavigationView{
            VStack{
                Image(systemName: "person.fill")
                    .font(.system(size: 100))
                Text("App made by Jonathan (임준협).")
                    .font(.title2)
                    .fontWeight(.medium)
                Text(.init("Visit his GitHub! [Jonathan0827](https://github.com/Jonathan0827)"))
                    
                
            }.navigationTitle(Text("Maker"))
        }
    }
}
struct calculationView: View {
    @State private var height:Int = 1
    @State private var weight:Int = 1
    @State var mHeight:Double = 0
    @State var bmi = 0
    @State var oWeight = false
    @State var nWeight = false
    var body: some View {
        NavigationView{
            VStack {
                Text("Weight: \(weight)kg")
                    .font(.largeTitle)
                    .padding(.top)
                    
                Picker("Weight", selection: $weight) {
                    ForEach(1...200, id: \.self) {weight in
                        Text("\(weight)")
                    }
                }.pickerStyle(WheelPickerStyle())
                Text("Height: \(height)cm")
                    .font(.largeTitle)
                Picker("Height", selection: $height) {
                    ForEach(1...200, id: \.self) {height in
                        Text("\(height)")
                    }
                }.pickerStyle(WheelPickerStyle())
                Button("Calculate") {
                    nWeight = false
                    oWeight = false
                    if weight*10000/(height*height) < 23{
                        nWeight = true
                    } else {
                        oWeight = true
                    }
                }.sheet(isPresented: $oWeight){
                    overWeight()
                }.sheet(isPresented: $nWeight){
                    normalWeight()
                }
                }
            .navigationTitle(Text("Calculation"))
        }
    }
}
struct ContentView: View{
    var body: some View{
        TabView{
            calculationView()
                .tabItem{
                    Image(systemName: "heart.text.square.fill")
                    Text("Calculation")
                }
            whoMadeThis()
                .tabItem{
                    Image(systemName: "person.fill.questionmark")
                    Text("Who made this?")
                }
            }
        }
    }

        
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
