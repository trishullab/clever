fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
 Return a greatest common divisor of two integers a and b
    
*/
fn greatest_common_divisor(mut a:i32,mut b:i32) -> i32{


    while b > 0 {
        (a, b) = (b, a % b);
    }
    return a;
}

