fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
Given a string representing a space separated lowercase letters, return a dictionary
    of the letter with the most repetition and containing the corresponding count.
    If several letters have the same occurrence, return all of them.
    
*/
fn histogram(test:&str) -> HashMap<char, i32>{


    let mut res: HashMap<char, i32> = HashMap::new();
    if test == "" {
        return res;
    }
    for c in test.split_ascii_whitespace() {
        if res.contains_key(&c.chars().next().unwrap()) {
            res.entry(c.chars().next().unwrap()).and_modify(|n| {
                *n += 1;
            });
        } else {
            res.insert(c.chars().next().unwrap(), 1);
        }
    }
    let max: i32 = *res.values().max().unwrap();
    let non_maxs: Vec<char> = res
        .keys()
        .filter(|k: &&char| *res.get(k).unwrap() != max)
        .map(|c| *c)
        .collect();
    non_maxs.iter().for_each(|c| {
        res.remove(c);
    });

    return res;
}
