fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
You are given two positive integers n and m, and your task is to compute the
    average of the integers from n through m (including n and m). 
    Round the answer to the nearest integer and convert that to binary.
    If n is greater than m, return -1.
    
*/
fn rounded_avg(n:i32, m:i32) -> String{


    if n > m {
        return "-1".to_string();
    };
    let mut num: i32 = (m + n) / 2;
    let mut out: String = String::from("");
    while num > 0 {
        out = (num % 2).to_string() + &out;
        num = num / 2;
    }
    return out;
}
