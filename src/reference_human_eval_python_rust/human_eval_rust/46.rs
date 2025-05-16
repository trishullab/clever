fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
The Fib4 number sequence is a sequence similar to the Fibbonacci sequnece that's defined as follows:
    fib4(0) -> 0
    fib4(1) -> 0
    fib4(2) -> 2
    fib4(3) -> 0
    fib4(n) -> fib4(n-1) + fib4(n-2) + fib4(n-3) + fib4(n-4).
    Please write a function to efficiently compute the n-th element of the fib4 number sequence.  Do not use recursion.
    
*/
fn fib4(n:i32) -> i32{


    let mut results:Vec<i32> = vec![0, 0, 2, 0];

    if n < 4 {
        return *results.get(n as usize).unwrap();
    }

    for _ in 4.. n + 1{
        results.push(results.get(results.len()-1).unwrap() + results.get(results.len()-2).unwrap()
         + results.get(results.len()-3).unwrap() + results.get(results.len()-4).unwrap());
        results.remove(0);
    }

    return *results.get(results.len()-1).unwrap();

    
}
