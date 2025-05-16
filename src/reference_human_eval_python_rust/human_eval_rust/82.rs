fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
Write a function that takes a string and returns True if the string
    length is a prime number or False otherwise
    
*/
fn prime_length(str:&str) -> bool{


    let l: usize = str.len();
    if l == 0 || l == 1 {
        return false;
    }

    for i in 2..l {
        if l % i == 0 {
            return false;
        }
    }
    return true;
}
