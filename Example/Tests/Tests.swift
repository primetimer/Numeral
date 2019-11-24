import XCTest
import Numeral
import BigInt

class Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEnglish() {
        
        let speak = SpokenNumber.shared
        for n in 0...12*12*13 {
            let text = speak.spoken(n: BigUInt(n))
            print(text)
        }
        XCTAssert(true, "Pass")
    }
    
    func testEnglishBig() {
        let speak = SpokenNumber.shared
        for power in 0...1000 {
            let n = 2*BigUInt(10).power(power)+1
            let text = speak.spoken(n: n)
            print(power,":",text)
        }
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")

    }
    
    func testIllion() {
        let appender = SpokenNumberLargePrefixer.shared
        for power3 in 0...1000 {
//            let n = BigUInt(10).power(power)
            let text = appender.prefix(illion: power3)
            print(power3,":",text)
        }
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")

    }
    
    func testPowers() {
            let appender = SpokenNumberLargePrefixer.shared
            for power in 0...1000 {
                let text = appender.powerstr(nth: power)
                print(power,":",text)
            }
            XCTAssert(true, "Pass")

        }
    
    func testGerman() {
        
        let speak = SpokenNumberGerman.shared
        for n in 0...12*12*13 {
            let text = speak.spoken(n: BigUInt(n))
            print(text)
        }
        
        for power in 0...1000 {
            let n = BigUInt(12).power(power)
            let text = speak.spoken(n: n)
            print(power,":",text)
        }
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testDozenal() {
        
        let speak = SpokenNumberDozenal.shared
        for n in 0...12*12*13 {
            let text = speak.spoken(n: BigUInt(n))
            print(text)
        }
        
        for power in 0...20 {
            let n = BigUInt(12).power(power)
            let text = speak.spoken(n: n)
            print(text)
        }
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testDanish() {
           
           let speak = SpokenNumberDanish.shared
           for n in 0...12*12*13 {
               let text = speak.spoken(n: BigUInt(n))
               print(text)
           }
           
           for power in 0...56 {
               let n = BigUInt(10).power(power)
               let text = speak.spoken(n: n)
               print("10^",power,":",text)
           }
           // This is an example of a functional test case.
           XCTAssert(true, "Pass")
       }
    
    func testLatin() {
           
           let speak = SpokenNumberLatin.shared
           for n in 0...12*12*13 {
               let text = speak.spoken(n: BigUInt(n))
               print(text)
           }
           
           for power in 0...56 {
               let n = BigUInt(10).power(power)
               let text = speak.spoken(n: n)
               print("10^",power,":",text)
           }
           // This is an example of a functional test case.
           XCTAssert(true, "Pass")
       }
    
    func testFrench() {
        
        let speak = SpokenNumberFrench.shared
        for n in 0...12*12*13 {
            let text = speak.spoken(n: BigUInt(n))
            print(text)
        }
        
        for power in 0...56 {
            let n = BigUInt(10).power(power)
            let text = speak.spoken(n: n)
            print("10^",power,":",text)
        }
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }

    func testTonga() {
        
        let speak = SpokenNumberTonga.shared
        for n in 0...12*12*13 {
            let text = speak.spoken(n: BigUInt(n))
            print(text)
        }
        
        for power in 0...12 {
            let n = BigUInt(10).power(power)
            let text = speak.spoken(n: n)
            print("10^",power,":",text)
        }
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testKlingon() {
        
        let speak = SpokenNumberKlingon.shared
        for n in 0...12*12*13 {
            let text = speak.spoken(n: BigUInt(n))
            print(n,":",text)
        }
        
        for power in 0...12 {
            let n = BigUInt(10).power(power)
            let text = speak.spoken(n: n)
            print("10^",power,":",text)
        }
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
     
}
