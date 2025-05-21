fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*

    Checks if given string is a palindrome
    
*/
fn is_palindrome(text: String) -> bool {


    let pr: String = text.chars().rev().collect();
    return pr == text;
}
