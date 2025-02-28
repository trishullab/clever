fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*

    Given a string 'text', return its md5 hash equivalent string.
    If 'text' is an empty string, return None.
    
*/
fn string_to_md5(text: &str) -> String {


    if text.is_empty() {
        return "None".to_string();
    }

    let digest = md5::compute(text.as_bytes());
    return format!("{:x}", digest);
}
