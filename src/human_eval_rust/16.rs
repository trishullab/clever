fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
 Given a string, find out how many distinct characters (regardless of case) does it consist of
    
*/
fn count_distinct_characters(str:String) -> i32{


    let res:HashSet<char> = str.chars().into_iter().map(|x:char| x.to_ascii_lowercase()).collect();
    return res.len() as i32;
}
