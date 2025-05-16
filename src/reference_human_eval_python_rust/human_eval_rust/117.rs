fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
Given a string s and a natural number n, you have been tasked to implement 
    a function that returns a list of all words from string s that contain exactly 
    n consonants, in order these words appear in the string s.
    If the string s is empty then the function should return an empty list.
    Note: you may assume the input string contains only letters and spaces.
    
*/
fn select_words(s:&str, n:i32) -> Vec<String>{


    let vowels = "aeiouAEIOU";
    let mut current = String::new();
    let mut out = Vec::new();
    let mut numc = 0;
    let mut s = s.to_string();
    s.push(' ');
    for i in 0..s.len() {
        if s.chars().nth(i).unwrap() == ' ' {
            if numc == n {
                out.push(current);
            }
            current = String::new();
            numc = 0;
        } else {
            current.push(s.chars().nth(i).unwrap());
            if (s.chars().nth(i).unwrap() >= 'A' && s.chars().nth(i).unwrap() <= 'Z')
                || (s.chars().nth(i).unwrap() >= 'a' && s.chars().nth(i).unwrap() <= 'z')
            {
                if !vowels.contains(s.chars().nth(i).unwrap()) {
                    numc += 1;
                }
            }
        }
    }
    out
}
