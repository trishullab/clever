fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
 Filter an input list of strings only for ones that start with a given prefix.
    
*/
fn filter_by_prefix(strings:Vec<String>, prefix:String)-> Vec<String>{


    return strings.into_iter().filter(|s| s.starts_with(&prefix)).collect();
}
