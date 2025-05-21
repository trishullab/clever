fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*

    You are given a non-empty list of positive integers. Return the greatest integer that is greater than 
    zero, and has a frequency greater than or equal to the value of the integer itself. 
    The frequency of an integer is the number of times it appears in the list.
    If no such a value exist, return -1.
    
*/
fn search(lst: Vec<i32>) -> i32 {


    let mut freq: Vec<Vec<i32>> = Vec::new();
    let mut max = -1;
    for i in 0..lst.len() {
        let mut has = false;
        for j in 0..freq.len() {
            if lst[i] == freq[j][0] {
                freq[j][1] += 1;
                has = true;
                if freq[j][1] >= freq[j][0] && freq[j][0] > max {
                    max = freq[j][0];
                }
            }
        }
        if !has {
            freq.push(vec![lst[i], 1]);
            if max == -1 && lst[i] == 1 {
                max = 1;
            }
        }
    }
    return max;
}
