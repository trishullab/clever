fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*

    You are given a list of two strings, both strings consist of open
    parentheses '(' or close parentheses ')' only.
    Your job is to check if it is possible to concatenate the two strings in
    some order, that the resulting string will be good.
    A string S is considered to be good if and only if all parentheses in S
    are balanced. For example: the string '(())()' is good, while the string
    '())' is not.
    Return 'Yes' if there's a way to make a good string, and return 'No' otherwise.
    
*/
fn match_parens(lst: Vec<&str>) -> &str {


    let l1 = lst[0].to_string() + lst[1];
    let mut count = 0;
    let mut can = true;
    for i in 0..l1.len() {
        if l1.chars().nth(i).unwrap() == '(' {
            count += 1;
        }
        if l1.chars().nth(i).unwrap() == ')' {
            count -= 1;
        }
        if count < 0 {
            can = false;
        }
    }
    if count != 0 {
        return "No";
    }
    if can == true {
        return "Yes";
    }
    let l1 = lst[1].to_string() + lst[0];
    let mut can = true;
    for i in 0..l1.len() {
        if l1.chars().nth(i).unwrap() == '(' {
            count += 1;
        }
        if l1.chars().nth(i).unwrap() == ')' {
            count -= 1;
        }
        if count < 0 {
            can = false;
        }
    }
    if can == true {
        return "Yes";
    }
    return "No";
}
