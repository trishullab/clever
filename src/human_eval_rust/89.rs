fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
Create a function encrypt that takes a string as an argument and
    returns a string encrypted with the alphabet being rotated. 
    The alphabet should be rotated in a manner such that the letters 
    shift down by two multiplied to two places.
    
*/
fn encrypt(s:&str) -> String{


    let d: Vec<char> = "abcdefghijklmnopqrstuvwxyz"
        .to_string()
        .chars()
        .into_iter()
        .collect();
    let mut out: String = String::new();
    for c in s.chars() {
        if d.contains(&c) {
            let indx: usize = (d.iter().position(|x| c == *x).unwrap() + 2 * 2) % 26;
            out += &d[indx].to_string();
        } else {
            out += &c.to_string();
        }
    }

    return out;
}
