fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
Return median of elements in the list l.
    
*/
fn median(l:Vec<i32>) -> f64{


    let mut res:Vec<i32> = l.clone();
    res.sort();
    if res.len() % 2 == 1{
        return *res.get(res.len() / 2).unwrap() as f64;
    }else{      
        return (res.get(res.len() / 2 -1).unwrap() + res.get(res.len() / 2).unwrap()) as f64/ 2.0;
    }
}
