//
//  Numeral.swift
//  Pods
//
//  Created by Stephan Jancar on 23.02.19.
//

import Foundation
import BigInt

public enum NumeralType : Int, CaseIterable {
    case None = -1, FormatUS = 0, Roman
    case Indian, Abjad, Egyptian, Phonician, Greek, Hebraian
    case Babylon, Chinese, ChineseFinancial, Maya, Scientific, Duodezimal, Rod, Kyrillic, Glagolitic, Khmer,Sanskrit, Klingon,Kharoshthi
    
    public func asString() -> String {
        switch self {
            
        case .None:
            return ""
        case .FormatUS:
            return ""
        case .Roman:
            return "roman"
        case .Indian:
            return "hindu-arabian"
        case .Abjad:
            return "arabian (abjad)"
        case .Egyptian:
            return "egyptian"
        case .Phonician:
            return "phoenician"
        case .Greek:
            return "greek"
        case .Hebraian:
            return "hebrew"
        case .Babylon:
            return "babylonian"
        case .Chinese:
            return "chinese"
        case .ChineseFinancial:
            return "chinese (financial)"
        case .Maya:
            return "maya"
        case .Scientific:
            return "scientific"
        case .Duodezimal:
            return "duodezimal"
        case .Rod:
            return "rod"
        case .Kyrillic:
            return "kyrillic"
        case .Glagolitic:
            return "glagolitic"
        case .Khmer:
            return "khmer"
        case .Sanskrit:
            return "sanskrit"
        case .Klingon:
            return "klingon"
        case .Kharoshthi:
            return "kharoshthi"
        }
    }
    
    public func NumeralStr(nr : BigUInt) -> String {
        switch self {
        case .None:
            return ""
        case .FormatUS:
            return String(nr)
        case .Roman:
            return nr.Roman()
        case .Indian:
            return nr.Roman()
        case .Abjad:
            return nr.Abjad()
        case .Egyptian:
            return nr.Egyptian()
        case .Phonician:
            return nr.Phonician()
        case .Greek:
            return nr.Greek()
        case .Hebraian:
            return nr.Hebraian()
        case .Babylon:
            return nr.Keilschrift()
        case .Chinese:
            return nr.Chinese()
        case .ChineseFinancial:
            return nr.ChineseFinancial()
        case .Maya:
            return nr.Vigesimal()
        case .Scientific:
            return nr.scientific()
        case .Duodezimal:
            return nr.Duodezimal()
        case .Rod:
            return nr.Rod()
        case .Kyrillic:
            return nr.Kyrillic()
        case .Glagolitic:
            return nr.Glagolitic()
        case .Khmer:
            return nr.Khmer()
        case .Sanskrit:
            return nr.Sanskrit()
        case .Klingon:
            return nr.Klingon()
        case .Kharoshthi:
            return nr.Kharoshthi()
        }
    }
    
}

public extension NumeralType {
    public func WikiLink() -> String {
        
        switch self {
            
        case .None:
            return "https://en.wikipedia.org/wiki/List_of_numeral_systems"
        //return "https://en.wikipedia.org/wiki/Numeral_system"
        case .FormatUS:
            return "https://en.wikipedia.org/wiki/Decimal"
            
        case .Roman:
            return "https://en.wikipedia.org/wiki/Roman_numerals"
        case .Indian:
            return "https://en.wikipedia.org/wiki/Indian_numerals"
        //return "https://en.wikipedia.org/wiki/Eastern_Arabic_numerals"
        case .Abjad:
            return "https://en.wikipedia.org/wiki/Abjad_numerals"
        case .Egyptian:
            return "https://en.wikipedia.org/wiki/Egyptian_numerals"
        case .Phonician:
            return "https://en.wikipedia.org/wiki/Phoenician_alphabet#Numerals"
        case .Greek:
            return "https://en.wikipedia.org/wiki/Greek_numerals"
        case .Hebraian:
            return "https://en.wikipedia.org/wiki/Hebrew_numerals"
        case .Babylon:
            return  "https://en.wikipedia.org/wiki/Babylonian_numerals"
        case .Chinese:
            return "https://en.wikipedia.org/wiki/Chinese_numerals"
        case .ChineseFinancial:
            return  "https://en.wikipedia.org/wiki/Chinese_numerals"
        case .Maya:
            return "https://en.wikipedia.org/wiki/Maya_numerals"
        case .Scientific:
            return "https://en.wikipedia.org/wiki/Scientific_notation"
        case .Duodezimal:
            return "https://en.wikipedia.org/wiki/Duodecimal"
        case .Rod:
            return "https://en.wikipedia.org/wiki/Counting_rods"
        case .Kyrillic:
            return "https://en.wikipedia.org/wiki/Cyrillic_numerals"
        case .Glagolitic:
            return "https://en.wikipedia.org/wiki/Glagolitic_script"
        case .Khmer:
            return "https://en.wikipedia.org/wiki/Khmer_numerals"
        case .Sanskrit:
            return "https://en.wikipedia.org/wiki/Indian_numerals"
        case .Klingon:
            return "https://en.wikipedia.org/wiki/Klingon_language"
        case .Kharoshthi:
            return "https://en.wikipedia.org/wiki/Kharosthi#Numerals"
        }
    }
}

