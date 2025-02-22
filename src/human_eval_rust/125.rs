fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*

    Given a string of words, return a list of words split on whitespace, if no whitespaces exists in the text you
    should split on commas ',' if no commas exists you should return the number of lower-case letters with odd order in the
    alphabet, ord('a') = 0, ord('b') = 1, ... ord('z') = 25
    
*/
fn split_words(txt: &str) -> Vec<String> {


    let mut out: Vec<String> = Vec::new();
    let alphabet: HashMap<char, i32> = HashMap::from([
        ('a', 0),
        ('b', 1),
        ('c', 2),
        ('d', 3),
        ('e', 4),
        ('f', 5),
        ('g', 6),
        ('h', 7),
        ('i', 8),
        ('j', 9),
        ('k', 10),
        ('l', 11),
        ('m', 12),
        ('n', 13),
        ('o', 14),
        ('p', 15),
        ('q', 16),
        ('r', 17),
        ('s', 18),
        ('t', 19),
        ('u', 20),
        ('v', 21),
        ('w', 22),
        ('x', 23),
        ('y', 24),
        ('z', 25),
    ]);

    if txt.contains(' ') {
        out = txt
            .split_whitespace()
            .into_iter()
            .map(|c| c.to_string())
            .collect();
    } else if txt.contains(',') {
        out = txt.split(',').into_iter().map(|c| c.to_string()).collect();
    } else {
        let count = txt
            .chars()
            .into_iter()
            .filter(|c| c.is_ascii_lowercase())
            .filter(|c| alphabet.get(c).unwrap() % 2 == 1)
            .count();
        out.push(count.to_string());
    }

    return out;
}
