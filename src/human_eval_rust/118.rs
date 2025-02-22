fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
You are given a word. Your task is to find the closest vowel that stands between 
    two consonants from the right side of the word (case sensitive).
    
    Vowels in the beginning and ending doesn't count. Return empty string if you didn't
    find any vowel met the above condition. 

    You may assume that the given string contains English letter only.
    
*/
fn get_closest_vowel(word: &str) -> String {


    let vowels = "AEIOUaeiou";
    let mut out = "".to_string();
    for i in (1..word.len() - 1).rev() {
        if vowels.contains(word.chars().nth(i).unwrap()) {
            if !vowels.contains(word.chars().nth(i + 1).unwrap()) {
                if !vowels.contains(word.chars().nth(i - 1).unwrap()) {
                    out.push(word.chars().nth(i).unwrap());
                    return out;
                }
            }
        }
    }
    out
}
