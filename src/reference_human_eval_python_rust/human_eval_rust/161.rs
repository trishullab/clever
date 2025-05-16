fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
You are given a string s.
    if s[i] is a letter, reverse its case from lower to upper or vise versa, 
    otherwise keep it as it is.
    If the string contains no letters, reverse the string.
    The function should return the resulted string.
    
*/
fn solve_161(s: &str) -> String {


    let mut nletter = 0;
    let mut out = String::new();
    for c in s.chars() {
        let mut w = c;
        if w >= 'A' && w <= 'Z' {
            w = w.to_ascii_lowercase();
        } else if w >= 'a' && w <= 'z' {
            w = w.to_ascii_uppercase();
        } else {
            nletter += 1;
        }
        out.push(w);
    }
    if nletter == s.len() {
        out.chars().rev().collect()
    } else {
        out
    }
}
