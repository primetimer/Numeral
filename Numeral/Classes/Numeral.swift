//
//  Numeral.swift
//  Pods
//
//  Created by Stephan Jancar on 23.02.19.
//

import Foundation

public enum Numeral : Int, CaseIterable {
    case None = -1, FormatUS = 0, Latin, Roman
    case Indian, Abjad, Egyptian, Phonician, Greek, Hebraian
    case Babylon, Chinese, ChineseFinancial, Maya, Scientific, Duodezimal, Rod, Kyrillic, Glagolitic, Khmer,Sanskrit, Klingon,Kharoshthi
    
    
    static private let str = [ "hindu-arabian", "short scale", "arabian (west) ", "roman", "arabian (east)", "arabian (abjad)", "egyptian", "phoenician", "greek", "hebrew", "babylonian", "chinese","chinese financial", "maya", "scientific", "dozenal", "rod" , "kyrillic","glagolitic","khmer","sanskrit (Devanagari)","klingon","Kharoshthi"]
    
    static private let wikis = ["https://en.wikipedia.org/wiki/Hindu–Arabic_numeral_system",
                                "https://en.wikipedia.org/wiki/Long_and_short_scales",
                                "https://en.wikipedia.org/wiki/Hindu–Arabic_numeral_system",    //Latin unformatted
        "https://en.wikipedia.org/wiki/Roman_numerals",
        
        "https://en.wikipedia.org/wiki/Eastern_Arabic_numerals",
        "https://en.wikipedia.org/wiki/Abjad_numerals",
        "https://en.wikipedia.org/wiki/Egyptian_numerals",
        "",
        "https://en.wikipedia.org/wiki/Greek_numerals",
        "https://en.wikipedia.org/wiki/Hebrew_numerals",
        "https://en.wikipedia.org/wiki/Babylonian_numerals",
        "https://en.wikipedia.org/wiki/Chinese_numerals",
        "https://en.wikipedia.org/wiki/Chinese_numerals",    //doppel financial
        "https://en.wikipedia.org/wiki/Maya_numerals",
        "https://en.wikipedia.org/wiki/Scientific_notation",
        "https://en.wikipedia.org/wiki/Duodecimal",
        "https://en.wikipedia.org/wiki/Counting_rods",
        "https://en.wikipedia.org/wiki/Cyrillic_numerals",
        "https://en.wikipedia.org/wiki/Cyrillic_numerals",
        "https://en.wikipedia.org/wiki/Khmer_numerals",
        "https://en.wikipedia.org/wiki/Indian_numerals",
        "https://en.wikipedia.org/wiki/Klingon_language",
        "https://en.wikipedia.org/wiki/Kharosthi#Numerals"]
    
    func asString() -> String {
        if self.rawValue >= 0 {
            return Numeral.str[self.rawValue]
        }
        return ""
    }
    
    func asWiki() -> String {
        if self.rawValue >= 0 {
            return Numeral.wikis[self.rawValue]
        }
        return "https://en.wikipedia.org/wiki/Numeral_system"
    }
    
}

