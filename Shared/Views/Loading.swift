//
//  Loading.swift
//  Weathers (iOS)
//
//  Created by Lintang Hannan M on 03/01/22.
//

import SwiftUI

struct Loading: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle (tint: .white))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}

struct Loading_Previews: PreviewProvider {
    static var previews: some View {
        Loading()
    }
}
