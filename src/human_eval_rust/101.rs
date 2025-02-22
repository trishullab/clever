fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*

    You will be given a string of words separated by commas or spaces. Your task is
    to split the string into words and return an array of the words.
    
*/
fn words_string(s:&str) -> Vec<String> {


    return s
        .to_string()
        .split(|c: char| c == ',' || c.is_whitespace())
        .into_iter()
        .filter(|x| x != &"")
        .map(|x| x.to_string())
        .collect();
}
