fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
Write a function that accepts a list of strings as a parameter,
    deletes the strings that have odd lengths from it,
    and returns the resulted list with a sorted order,
    The list is always a list of strings and never an array of numbers,
    and it may contain duplicates.
    The order of the list should be ascending by length of each word, and you
    should return the list sorted by that rule.
    If two words have the same length, sort the list alphabetically.
    The function should return a list of strings in sorted order.
    You may assume that all words will have the same length.
    
*/
fn sorted_list_sum(lst: Vec<&str>) -> Vec<&str> {


    let mut out: Vec<&str> = Vec::new();
    for i in 0..lst.len() {
        if lst[i].len() % 2 == 0 {
            out.push(lst[i]);
        }
    }
    out.sort();
    for i in 0..out.len() {
        for j in 1..out.len() {
            if out[j].len() < out[j - 1].len() {
                let mid = out[j];
                out[j] = out[j - 1];
                out[j - 1] = mid;
            }
        }
    }
    return out;
}
