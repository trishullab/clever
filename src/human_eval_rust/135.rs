fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
Create a function which returns the largest index of an element which
    is not greater than or equal to the element immediately preceding it. If
    no such element exists then return -1. The given array will not contain
    duplicate values.
    
*/
fn can_arrange(arr: Vec<i32>) -> i32 {


    let mut max: i32 = -1;
    for i in 0..arr.len() {
        if arr[i] <= i as i32 {
            max = i as i32;
        }
    }
    max
}

