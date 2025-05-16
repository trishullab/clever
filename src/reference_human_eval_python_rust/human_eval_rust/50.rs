fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

fn encode_shift(s: &str) -> String {

    let alphabet:Vec<&str> = vec!["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n"
    , "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"];
    let mut output = String::new();

    for c in s.chars() {
        let mut lower = false;
        if c.is_ascii_lowercase(){
            lower = true;
        }
        let mut c_shift:String = "".to_string();
        if lower {
            let index:usize = alphabet.iter().position(|&x| x == c.to_string()).unwrap();
            c_shift = alphabet[(index + 5) % 26].to_string();
        }else{
            let c_lower:String = c.to_ascii_lowercase().to_string();
            let index:usize = alphabet.iter().position(|&x| x == c_lower).unwrap();
            c_shift = alphabet[(index + 5) % 26].to_string();
            c_shift = c_shift.to_ascii_uppercase().to_string();
            
        }

        output.push_str(&c_shift);
    }
    output
}

/*

    takes as input string encoded with encode_shift function. Returns decoded string.
    
*/
pub fn decode_shift(s: &str) -> String {

    let alphabet:Vec<&str> = vec!["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n"
    , "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"];
    let mut output = String::new();

    for c in s.chars() {
        let mut lower = false;
        if c.is_ascii_lowercase(){
            lower = true;
        }
        let mut c_shift:String = "".to_string();
        if lower {
            let index:usize = alphabet.iter().position(|&x| x == c.to_string()).unwrap();
            c_shift = alphabet[((26 + (index as i32 - 5)) % 26) as usize].to_string();
        }else{
            let c_lower:String = c.to_ascii_lowercase().to_string();
            let index:usize = alphabet.iter().position(|&x| x == c_lower).unwrap();
            c_shift = alphabet[((26 + (index as i32 - 5)) % 26) as usize].to_string();
            c_shift = c_shift.to_ascii_uppercase().to_string();
            
        }

        output.push_str(&c_shift);
    }
    output
}
