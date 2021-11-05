//
//  MapView.swift
//  Landmarks
//
//  Created by WANKI KIM on 2021/10/27.
//

import SwiftUI
import MapKit

struct MapView: View {
    //@State 속성을 사용해 둘 이상의 보기에서 수정할 수 있는 앱의 데이터에 대한 정보 소스를 설정.
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    
    var body: some View {
        Map(coordinateRegion: $region)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
