//
//  ContentView.swift
//  SwiftUIExample
//
//  Created by Luyan on 2021/10/21.
//

import SwiftUI

// View는 View Protocol을 채택한 구조체
struct ContentView: View {
    //@State는 해당 State에 해당하는 뷰에 해당하는 뷰를 다시 그려주는 역할
    // 상태가 변화할 때, 뷰가 다시 그려지게 된다.
    // 다시 그려지는 뷰는 else를 따라가 red를 그려준다.
    @State private var isViewColorIsGreen: Bool = true
    
    // conform 해야 하는 프로퍼티 body
    //
    // some View: 아무튼 뷰랑 비슷한 역할을 하는것
    // 뷰 프로토콜을 채택한 친구?
    var body: some View {
        // 뷰는 하나의 뷰를 리턴해주고 있지 않고, 두개 이상의 뷰를 만들고 있기 때문임.
        // 어떻게 해야 묶을 수 있지?
        // group, stack, ...
//        VStack {
//            if isViewColorIsGreen {
//                Rectangle().foregroundColor(.red)
//            } else {
//                Rectangle().foregroundColor(.green)
//            }
//            Button {
//                isViewColorIsGreen.toggle()
//            } label: {
//                Text("색변환")
//            }
//        }
        VStack {
            for _ in 0..<2 {
                Rectangle().foregroundColor(.red)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// SwiftUI와 관련된 대부분의 요소가 구조체로 정의됨.
