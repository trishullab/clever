fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
Return sorted unique elements in a list
    
*/
fn unique(nmbs:Vec<i32>)  -> Vec<i32>{


    let mut res:Vec<i32> = nmbs.clone();
    res.sort();
    res.dedup();
    return res;
 }
