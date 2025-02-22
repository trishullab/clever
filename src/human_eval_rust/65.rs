fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
Circular shift the digits of the integer x, shift the digits right by shift
    and return the result as a string.
    If shift > number of digits, return digits reversed.
    
*/
fn circular_shift(x:i32, shift:i32) -> String{


    let mut xcp:Vec<char> = x.to_string().chars().into_iter().collect();
    let mut res:Vec<char> = x.to_string().chars().into_iter().collect();

    for (indx,c) in xcp.iter().enumerate(){
    let despl =  (indx as i32 + shift) % x.to_string().len() as i32;
    replace(&mut res[despl as usize], *c);
    }

   return res.into_iter().collect();

}
