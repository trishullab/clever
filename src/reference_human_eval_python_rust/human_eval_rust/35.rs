fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
Return maximum element in the list.
    
*/
fn maximum(nmbs:Vec<i32>) -> i32{


    return *nmbs.iter().max().unwrap();
 }

