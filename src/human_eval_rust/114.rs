fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*

    Given an array of integers nums, find the minimum sum of any non-empty sub-array
    of nums.
    
*/
fn min_sub_array_sum(nums: Vec<i64>) -> i64 {


    let mut current = nums[0];
    let mut min = nums[0];
    for i in 1..nums.len() {
        if current < 0 {
            current = current + nums[i];
        } else {
            current = nums[i];
        }
        if current < min {
            min = current;
        }
    }
    min
}
