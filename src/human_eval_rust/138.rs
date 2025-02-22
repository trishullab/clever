fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
Evaluate whether the given number n can be written as the sum of exactly 4 positive even numbers
    
*/
fn is_equal_to_sum_even(n: i32) -> bool {


    if n % 2 == 0 && n >= 8 {
        return true;
    }
    return false;
}
