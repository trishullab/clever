fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*

    Given a string s, count the number of uppercase vowels in even indices.
    
*/
fn count_upper(s:&str) -> i32 {


    let uvowel: &str = "AEIOU";
    let mut count: i32 = 0;

    for (indx, elem) in s.chars().into_iter().enumerate() {
        if indx % 2 == 0 {
            if uvowel.contains(elem) {
                count += 1;
            }
        }
    }
    return count;
}
