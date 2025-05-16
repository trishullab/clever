fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*

    You are given a string representing a sentence,
    the sentence contains some words separated by a space,
    and you have to return a string that contains the words from the original sentence,
    whose lengths are prime numbers,
    the order of the words in the new string should be the same as the original one.

    Constraints:
        * 1 <= len(sentence) <= 100
        * sentence contains only letters
    
*/
fn words_in_sentence(sentence: &str) -> String {


    let mut out = String::new();
    let mut current = String::new();
    let mut sentence = sentence.to_string();
    sentence.push(' ');

    for i in 0..sentence.len() {
        if sentence.chars().nth(i).unwrap() != ' ' {
            current.push(sentence.chars().nth(i).unwrap());
        } else {
            let mut isp = true;
            let l = current.len();
            if l < 2 {
                isp = false;
            }
            for j in 2..(l as f64).sqrt() as usize + 1 {
                if l % j == 0 {
                    isp = false;
                }
            }
            if isp {
                out.push_str(&current);
                out.push(' ');
            }
            current = String::new();
        }
    }
    if out.len() > 0 {
        out.pop();
    }
    out
}
