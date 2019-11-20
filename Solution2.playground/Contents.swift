/*
#2 This problem was asked by Microsoft.

Describe and give an example of each of the following types of polymorphism:

    Ad-hoc polymorphism
    Parametric polymorphism
    Subtype polymorphism
*/

// AD HOC Polymorphism

/*
From What I've read, Adhoc polymorphism refers to function overloading, or operator overloading
 
*/

precedencegroup DoubleAdd {
    higherThan: ComparisonPrecedence
    associativity: left
}

infix operator ++: DoubleAdd

func ++<A: Numeric> (_ lhs: A, _ rhs: A) -> A {
    return lhs + rhs + rhs
}

func addTwice<A: Numeric>(_ lhs: A, _ rhs: A) -> A {
    return lhs ++ rhs
}

func testAdHoc() {
    assert(5 ++ 1 == 7, "Works with Ints")
    assert(5.1 ++ 1 == 7.1, "Works with Floats")
    print("Tests Passed")
}

testAdHoc()

// Parametric polymorphism

/*
 Parametric p
 */
