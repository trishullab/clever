fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
 For a given number n, find the largest number that divides n evenly, smaller than n
    
*/
fn largest_divisor(n:i32) -> i32{


    let mut res:i32 = 0;
    let sqn = 1..n;
    
    for i in sqn.rev(){
        if n % i == 0 {
            res = i;
            break;
        }
    }

    return res;
}
