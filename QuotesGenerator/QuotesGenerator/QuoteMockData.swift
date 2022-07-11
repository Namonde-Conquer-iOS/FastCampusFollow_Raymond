//
//  QuoteMockData.swift
//  QuotesGenerator
//
//  Created by sanghyo on 2022/06/23.
//

import Foundation

#if DEBUG
class QuoteController {
    static var mockData: [Quote] {
        [
        Quote(contents: "나 자신을 알라", name: "알라알라알라"),
        Quote(contents: "너의 이름은?", name: "내가 어떻게 알까"),
        Quote(contents: "크리스티아누", name: "호날두"),
        Quote(contents: "우리 흥민이는 월드클라스가 아닙니다", name: "손웅정")
        ]
    }
}

#endif
