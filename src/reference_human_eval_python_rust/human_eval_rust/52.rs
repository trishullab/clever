fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
Return True if all numbers in the list l are below threshold t.
    
*/
fn below_threshold(l: Vec<i32>, t: i32) -> bool { 


    for i in l {
        if i >= t {
            return false;
        }
    }
    return true;
}
