fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
 Find how many times a given substring can be found in the original string. Count overlaping cases.
    
*/
fn how_many_times(string: String, substring:String) -> i32{


    let mut times:i32 = 0;

    for i in 0..(string.len() as i32 - substring.len() as i32 + 1){
        if string.get(i as usize..(i + substring.len() as i32) as usize).unwrap().to_string() == substring {
            times += 1;
        }    
    }
    return times;
}
