fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*

    Given a positive integer n, return a tuple that has the number of even and odd
    integer palindromes that fall within the range(1, n), inclusive.

    Note:
        1. 1 <= n <= 10^3
        2. returned tuple has the number of even and odd integer palindromes respectively.
    
*/
fn even_odd_palindrome(n: i32) -> (i32, i32) {


    let mut even = 0;
    let mut odd = 0;

    for i in 1..n + 1 {
        let mut w: String = i.to_string();
        let mut p: String = w.chars().rev().collect();

        if w == p && i % 2 == 1 {
            odd += 1;
        }
        if w == p && i % 2 == 0 {
            even += 1;
        }
    }
    (even, odd)
}
