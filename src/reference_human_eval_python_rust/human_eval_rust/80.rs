fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
You are given a string s.
    Your task is to check if the string is happy or not.
    A string is happy if its length is at least 3 and every 3 consecutive letters are distinct
    
*/
fn is_happy(s:&str) -> bool{


    let str: Vec<char> = s.chars().into_iter().collect();
    if str.len() < 3 {
        return false;
    }
    for i in 2..str.len() {
        if str[i] == str[i - 1] || str[i] == str[i - 2] {
            return false;
        }
    }
    return true;
}
