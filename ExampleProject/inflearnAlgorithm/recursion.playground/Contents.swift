import UIKit

// 순환함수와 수학적 귀납법
//
// 이 함수의 mission은 0-n 사이의 합을 구하는 것이다.
func recursion(_ n: Int) -> Int {
    // base code
    if n == 0 {
        return 0
    } else {
        // recursion code
        return n + recursion(n-1)
    }
}

recursion(5)

// 이 함수의 mission은 1부터 n까지의 곱을 구하는 것이다.
func factorial(_ n: Int) -> Int {
// base code
// 0!의 경우, 1을 반환한다.
    if n == 0 {
        return 1
    } else {
        // recursion code
        // n번째 factorial의 경우
        return n * factorial(n-1)
    }
}

factorial(5)

// x^n
func power(_ x: Int, _ n: Int) -> Int {
    if n == 0 {
        return 1
    } else {
        return x * power(x, n-1)
    }
}

// fibonacci
func fibonacci(_ n: Int) -> Int {
    if n <= 1 {
        return n
    } else {
        return fibonacci(n-1) + fibonacci(n-2)
    }
}

fibonacci(3)

// 최대 공약수: Euclid Method


// Recursive Thinking
// 순환적으로 사고하기
//
// 수학함수뿐 아니라 다른 많은 문제들을 recursion으로 해결할 수 있다.
//
// for, while -> recursion으로 해결
//
// 문자열의 길이 계산
//

func printInBinary(_ n: Int) {
    if n<2 {
        print(n)
    } else {
        printInBinary(n/2)
        print(n%2)
    }
}

printInBinary(16)


func sum(_ n: Int, _ data: [Int]) -> Int {
    if n<=0 {
        return 0
    } else {
        return sum(n-1,data) + data[n-1]
    }
}

