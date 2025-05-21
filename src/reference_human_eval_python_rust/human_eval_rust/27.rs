fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
 For a given string, flip lowercase characters to uppercase and uppercase to lowercase.
    
*/
pub fn flip_case(string: String) -> String{


    return string.chars().into_iter().fold(String::new(), |res:String, c:char| {if c.is_ascii_lowercase(){return res + &c.to_uppercase().to_string();}else{return res + &c.to_ascii_lowercase().to_string();}});
}
