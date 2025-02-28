fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
Your task is to implement a function that will simplify the expression
    x * n. The function returns True if x * n evaluates to a whole number and False
    otherwise. Both x and n, are string representation of a fraction, and have the following format,
    <numerator>/<denominator> where both numerator and denominator are positive whole numbers.

    You can assume that x, and n are valid fractions, and do not have zero as denominator.
    
*/
fn simplify(x: &str, n: &str) -> bool {


    let mut a = 0;
    let mut b = 0;
    let mut c = 0;
    let mut d = 0;
    let mut i = 0;
    for i in 0..x.len() {
        if x.chars().nth(i).unwrap() == '/' {
            a = x
                .chars()
                .take(i)
                .collect::<String>()
                .parse::<i32>()
                .unwrap();
            b = x
                .chars()
                .skip(i + 1)
                .collect::<String>()
                .parse::<i32>()
                .unwrap();
        }
    }
    for i in 0..n.len() {
        if n.chars().nth(i).unwrap() == '/' {
            c = n
                .chars()
                .take(i)
                .collect::<String>()
                .parse::<i32>()
                .unwrap();
            d = n
                .chars()
                .skip(i + 1)
                .collect::<String>()
                .parse::<i32>()
                .unwrap();
        }
    }
    if (a * c) % (b * d) == 0 {
        return true;
    }
    return false;
}
