fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
Write a function that accepts a list of strings.
    The list contains different words. Return the word with maximum number
    of unique characters. If multiple strings have maximum number of unique
    characters, return the one which comes first in lexicographical order.
    
*/
fn find_max(words: Vec<&str>) -> &str {


    let mut max = "";
    let mut maxu = 0;
    for i in 0..words.len() {
        let mut unique = String::from("");
        for j in 0..words[i].len() {
            if !unique.contains(words[i].chars().nth(j).unwrap()) {
                unique.push(words[i].chars().nth(j).unwrap());
            }
        }
        if unique.len() > maxu || (unique.len() == maxu && words[i] < max) {
            max = words[i];
            maxu = unique.len();
        }
    }
    max
}
