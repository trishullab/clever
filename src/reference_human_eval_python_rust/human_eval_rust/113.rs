fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
Given a list of strings, where each string consists of only digits, return a list.
    Each element i of the output should be "the number of odd elements in the
    string i of the input." where all the i's should be replaced by the number
    of odd digits in the i'th string of the input.
    
*/
fn odd_count(lst:Vec<&str>) -> Vec<String>{


    let mut out: Vec<String> = Vec::new();
    for i in 0..lst.len() {
        let mut sum = 0;
        for j in 0..lst[i].len() {
            if lst[i].chars().nth(j).unwrap() >= '0'
                && lst[i].chars().nth(j).unwrap() <= '9'
                && lst[i].chars().nth(j).unwrap().to_digit(10).unwrap() % 2 == 1
            {
                sum += 1;
            }
        }
        let mut s = "the number of odd elements in the string i of the input.".to_string();
        let mut s2 = "".to_string();
        for j in 0..s.len() {
            if s.chars().nth(j).unwrap() == 'i' {
                s2.push_str(&sum.to_string());
            } else {
                s2.push(s.chars().nth(j).unwrap());
            }
        }
        out.push(s2);
    }
    return out;
}
