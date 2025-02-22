fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
You are given a list of integers.
    You need to find the largest prime value and return the sum of its digits.
    
*/
fn skjkasdkd(lst:Vec<i32>) -> i32{


    let mut largest = 0;
    for i in 0..lst.len() {
        if lst[i] > largest {
            let mut prime = true;
            let mut j = 2;
            while j * j <= lst[i] {
                if lst[i] % j == 0 {
                    prime = false;
                }
                j += 1;
            }

            if prime {
                largest = lst[i];
            }
        }
    }
    let mut sum: i32 = 0;
    let mut s: String = String::new();
    s = largest.to_string();

    for n in s.chars().into_iter() {
        sum += n.to_digit(10).unwrap() as i32;
    }
    return sum;
}
