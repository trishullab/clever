fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*

    Given a positive integer n, return a sorted list that has the odd numbers in collatz sequence.

    The Collatz conjecture is a conjecture in mathematics that concerns a sequence defined
    as follows: start with any positive integer n. Then each term is obtained from the 
    previous term as follows: if the previous term is even, the next term is one half of 
    the previous term. If the previous term is odd, the next term is 3 times the previous
    term plus 1. The conjecture is that no matter what value of n, the sequence will always reach 1.

    Note: 
        1. Collatz(1) is [1].
        2. returned list sorted in increasing order.
    
*/
fn get_odd_collatz(n: i32) -> Vec<i32> {


    let mut out = vec![1];
    let mut n = n;
    while n != 1 {
        if n % 2 == 1 {
            out.push(n);
            n = n * 3 + 1;
        } else {
            n = n / 2;
        }
    }
    out.sort();
    out
}

