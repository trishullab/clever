fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
Your task is to write a function that returns true if a number x is a simple
    power of n and false in other cases.
    x is a simple power of n if n**int=x
    
*/
fn is_simple_power(x:i32, n:i32) -> bool{


    let mut p: i32 = 1;
    let mut count: i32 = 0;

    while p <= x && count < 100 {
        if p == x {
            return true;
        };
        p = p * n;
        count += 1;
    }
    return false;
}
