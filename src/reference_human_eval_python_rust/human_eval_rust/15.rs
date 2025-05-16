fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
 Return a string containing space-delimited numbers starting from 0 upto n inclusive.
    
*/
fn string_sequence(n:i32) -> String{


    let mut res:String = String::new();

    for number in 0..n + 1{
        res = res + &number.to_string() + " ";
    }
    
    return res.trim_end().to_string();

}
