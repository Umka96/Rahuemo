//
//  ContentView.swift
//  Rahuemo
//
//  Created by Uma Bugrayeva on 30.11.2022.
//

import SwiftUI


struct ContentView: View {
    @State var dataSor: [String] = []
    @State var dataInt: [String] = []
    @State var textFieldText: String = ""
    @State var dataArray: [String] = []
    var body: some View {
        NavigationView{
            ZStack {
                Color.green.opacity(0.2).ignoresSafeArea(edges: .top)
                VStack {
                    Image("math")
                        .resizable()
                        .frame(width: 300, height: 200)
                    Text("max 10 numbers!")
                    HStack {
                        TextField("namber", text: $textFieldText)
                            .modifier(TextFieldModifire())
                            .background(Color.yellow.opacity(0.5).cornerRadius(10))
                        
                        Button(action: {
                            if textIsAppropriste() {
                                saveText()
                            }}, label: {
                                Text("append".uppercased())
                                    .modifier(TextFieldModifire())
                                    .frame(maxWidth: .infinity)
                                    .background(Color.blue.opacity(0.3).cornerRadius(10))
                                
                            }).padding()}
                    HStack{ ForEach(dataArray, id: \.self) { data in
                        Text(data)
                            .modifier(TextFieldModifire())
                            .background(Color.red.opacity(0.3))
                    }}
                    Spacer()
                    
                    HStack{ ForEach(dataSor, id: \.self) { datat in
                        Text(datat)
                            .modifier(TextFieldModifire())
                            .frame(maxWidth: .infinity)
                            .background(Color.yellow)
                    }}
                    HStack{ ForEach(dataInt, id: \.self) { dat in
                        Text(dat)
                            .modifier(TextFieldModifire())
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                    }}.padding()
                    Button(action: {
                        if dataArray.count <= 10 {
                            dataSor = dataArray
                            dataInt = sort(s: dataArray)
                            dataArray = []
                        } else if dataArray.count > 10 {
                            dataSor = []
                            dataArray = []
                            dataInt = []
                        }
                    }, label: {
                        Text("Sorting".uppercased())
                            .modifier(TextFieldModifire())
                            .frame(maxWidth: .infinity)
                            .background(Color.white.opacity(0.5).cornerRadius(10))
                    }).padding()
                    Spacer()
                }
                .padding()
                .navigationTitle("Sort numbers")
            }
        }
    }
    struct TextFieldModifire: ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(.title)
                .foregroundColor(.black)
        }
    }
    func textIsAppropriste() -> Bool {
        
        _ = Int(textFieldText) ?? 0
        let my3 = (textFieldText as NSString).integerValue
        if textFieldText == String(my3) {
            return true
        }
        return false
    }
    func saveText() {
        if dataArray.count <= 10 {
            dataArray.append(textFieldText)
        } else {
            dataArray = ["nill"]
        }
        textFieldText = ""
    }
}
func sort (s: [String]) -> [String] {
    let d: [String] = s
    var intArray = d.compactMap { Int($0) }
    let fir = intArray.count
    for i in 0..<fir {
        let pass = (fir - 1) - i
        for j in 0..<pass {
            let key = intArray[j]
            if key > intArray[j + 1] {
                let temp = intArray[j + 1]
                intArray[j + 1] = key
                intArray[j] = temp
            }
        }
    }
    let stringArray = intArray.map  { (String($0)) }
    return stringArray
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
    }
}



