fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
 Filter an input list of strings only for ones that contain given substring
    
*/
fn filter_by_substring(strings: Vec<String>, substring:String) -> Vec<String>{

    return strings.iter().filter(|x:&&String| x.contains(&substring)).map(String::from).collect();
}
