//
//  ContentView.swift
//  MessageSpammer
//
//  Created by Wiktoria Wylecial on 20/05/2022.
//

import SwiftUI

struct ContentView: View {
   
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var number: String = ""
    @FocusState private var numberIsFocused: Bool
    
    var body: some View {
        
        VStack {
            
            Text("Spamming is Caring \nenter number to spam")
                .multilineTextAlignment(.center)
                .font(.title3)
            
            Image(systemName: "arrow.down")
                .padding(.init(top: 10, leading: 0, bottom: 5, trailing: 0))
                .foregroundColor(.gray)
               
            TextField("Enter number +44", text: $number)
                .textFieldStyle(.roundedBorder)
                .padding(.init(top: 10, leading: 20, bottom: 20, trailing: 20))
                .focused($numberIsFocused) // tracks use of textfield
                .keyboardType(.decimalPad)
            
            Button {
                spamMessage()
                numberIsFocused = false // dimsses keyboard once submitted
               
            } label: {
                Text("spam")
                    .padding(.init(top: 5, leading: 20, bottom: 5, trailing: 20))
                    .foregroundColor(.white)
                    .border(.blue)
                    .background(.blue)
                    .cornerRadius(5)
                    .font(.title3)
            }
        }
        .frame(alignment: .center)
        .onTapGesture {
            hideKeyboardOnTap() // hides keyboard on tap gesture
        }
       
        
    }
    
    func spamMessage () {
        
        let sms: String = "sms: \(number)&body=I need to tell you something and I want you to be totally honest with me, it's might be awkward between us after this but I need to know how you feel about this, I have kept this in for a while and it's about time I was straight up and just confront you about it. I hope this doesn't ruin the relationship we have already, I just need to know and I can't see any other way to get over this, it just doesn't seem fair to me if you don't give me an answer.. I want you to tell me truthfully no matter what it is, I want your honest opinion.. \nDo you know the muffin man?"
        let strURL: String = sms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        UIApplication.shared.open(URL.init(string: strURL)!, options: [:], completionHandler: nil)
    }
    
  
    
}

// Enables to dismiss keyboard onn VStack by tap gesture
extension View {
    func hideKeyboardOnTap(){
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
