fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*

    Write a function that takes an integer a and returns True 
    if this ingeger is a cube of some integer number.
    Note: you may assume the input is always valid.
    
*/
fn iscube(a:i32) -> bool{


    let a1: f64 = i32::abs(a) as f64;
    let sqrt_3 = f64::powf(a1, 1.0 / 3.0).ceil();

    return i32::pow(sqrt_3 as i32, 3) == a1 as i32;
}

