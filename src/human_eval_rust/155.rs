fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
Given an integer. return a tuple that has the number of even and odd digits respectively.
    
*/
fn even_odd_count(num: i32) -> Vec<i32> {


    let w = num.abs().to_string();
    let mut n1 = 0;
    let mut n2 = 0;
    for i in 0..w.len() {
        if w.chars().nth(i).unwrap().to_digit(10).unwrap() % 2 == 1 {
            n1 += 1;
        } else {
            n2 += 1;
        }
    }
    vec![n2, n1]
}
