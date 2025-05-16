fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
Given a positive integer n, return the product of the odd digits.
    Return 0 if all digits are even.
    
*/
fn digits(n: i32) -> i32 {


    let mut prod: i32 = 1;
    let mut has = 0;
    let s = n.to_string();
    for i in 0..s.len() {
        if s.chars().nth(i).unwrap().to_digit(10).unwrap() % 2 == 1 {
            has = 1;
            prod = prod * (s.chars().nth(i).unwrap().to_digit(10).unwrap()) as i32;
        }
    }
    if has == 0 {
        return 0;
    }
    prod
}
