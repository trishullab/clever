fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*

    Given an array arr of integers and a positive integer k, return a sorted list 
    of length k with the maximum k numbers in arr.

    Note:
        1. The length of the array will be in the range of [1, 1000].
        2. The elements in the array will be in the range of [-1000, 1000].
        3. 0 <= k <= len(arr)
    
*/
fn maximum_120(arr: Vec<i32>, k: i32) -> Vec<i32> {


    let mut arr = arr;
    arr.sort();
    let mut arr_res: Vec<i32> = arr.iter().rev().take(k as usize).cloned().collect();
    arr_res.sort();
    return arr_res;
}
