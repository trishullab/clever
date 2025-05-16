fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
In this problem, you will implement a function that takes two lists of numbers,
    and determines whether it is possible to perform an exchange of elements
    between them to make lst1 a list of only even numbers.
    There is no limit on the number of exchanged elements between lst1 and lst2.
    If it is possible to exchange elements between the lst1 and lst2 to make
    all the elements of lst1 to be even, return "YES".
    Otherwise, return "NO".

    It is assumed that the input lists will be non-empty.
    
*/
fn exchange(lst1:Vec<i32>, lst2:Vec<i32>) -> String{


    let mut num = 0;
    for i in 0..lst1.len() {
        if lst1[i] % 2 == 0 {
            num += 1;
        }
    }
    for i in 0..lst2.len() {
        if lst2[i] % 2 == 0 {
            num += 1;
        }
    }
    if num >= lst1.len() {
        return "YES".to_string();
    }
    return "NO".to_string();
}
