fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*

    Create a function that returns True if the last character
    of a given string is an alphabetical character and is not
    a part of a word, and False otherwise.
    Note: "word" is a group of characters separated by space.
    
*/
fn check_if_last_char_is_a_letter(txt: &str) -> bool {


    if txt.len() == 0 {
        return false;
    }
    let chr = txt.chars().last().unwrap();
    if chr < 'A' || (chr > 'Z' && chr < 'a') || chr > 'z' {
        return false;
    }
    if txt.len() == 1 {
        return true;
    }
    let chr = txt.chars().nth(txt.len() - 2).unwrap();
    if (chr >= 'A' && chr <= 'Z') || (chr >= 'a' && chr <= 'z') {
        return false;
    }
    true
}
