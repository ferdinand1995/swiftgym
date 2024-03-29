/*
Factory Coding Exercise
You are given a class called Person . The person has two fields: id , and name .
Please implement a non-static PersonFactory that has a createPerson() 
method that takes a person's name.
The id  of the person should be set as a 0-based index of the object created. 
So, the first person the factory makes should have id=0, second id=1 and so on.
*/
import Foundation
import XCTest

class Person
{
  var id: Int
  var name: String

  init(called name: String, withId id: Int)
  {
    self.name = name
    self.id = id
  }
}

class PersonFactory
{
  private var id = 0

  func createPerson(name: String) -> Person
  {
    let p = Person(called: name, withId: id)
    id += 1
    return p
  }
}

class UMBaseTestCase : XCTestCase {}

//@testable import Test

class Evaluate: UMBaseTestCase
{
  func simpleTest()
  {
    let pf = PersonFactory()

    let p1 = pf.createPerson(name: "Chris")
    XCTAssertEqual("Chris", p1.name)

    let p2 = pf.createPerson(name: "Sarah")
    XCTAssertEqual(1, p2.id)
  }
}

extension Evaluate
{
  static var allTests : [(String, (Evaluate) -> () throws -> Void)]
  {
    return [
      ("simpleTest", simpleTest)
    ]
  }
}

func main()
{
  XCTMain([testCase(Evaluate.allTests)])
}

main()