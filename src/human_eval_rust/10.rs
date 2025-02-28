fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

fn is_palindrome_10(str: &str) -> bool {
        let s: String = str.chars().rev().collect();
        return s==str;
    }

/*
 Find the shortest palindrome that begins with a supplied string.
    Algorithm idea is simple:
    - Find the longest postfix of supplied string that is a palindrome.
    - Append to the end of the string reverse of a string prefix that comes before the palindromic suffix.
    
*/
fn make_palindrome(str: &str) -> String {

        let mut i: usize = 0;
        for i in 0..str.len() {
            let rstr: &str = &str[i..];
            if is_palindrome_10(rstr) {
                let nstr: &str = &str[0..i];
                let n2str: String = nstr.chars().rev().collect();
                return str.to_string()+&n2str;
            }
        }
        let n2str: String = str.chars().rev().collect();
        return str.to_string()+&n2str;
    }
