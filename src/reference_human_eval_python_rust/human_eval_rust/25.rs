fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
 Return list of prime factors of given integer in the order from smallest to largest.
    Each of the factors should be listed number of times corresponding to how many times it appeares in factorization.
    Input number should be equal to the product of all factors
    
*/
fn factorize(n: i32) -> Vec<i32> {


    let mut n = n;
    let mut factors = vec![];
    let mut divisor = 2;
    while divisor * divisor <= n {
        while n % divisor == 0 {
            factors.push(divisor);
            n = n / divisor;
        }
        divisor = divisor + 1;
    }
    if n > 1 {
        factors.push(n);
    }
    factors
}
