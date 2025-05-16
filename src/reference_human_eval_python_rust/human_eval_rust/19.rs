fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
 Input is a space-delimited string of numberals from 'zero' to 'nine'.
    Valid choices are 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight' and 'nine'.
    Return the string with numbers sorted from smallest to largest
    
*/
fn sort_numbers(numbers:String) -> String {


    let str_to_i32 = |x:&str| {match x{
            "zero" => 0,
            "one" => 1,
            "two" => 2,
            "three" => 3,
            "four" => 4,
            "five" => 5,
            "six" => 6,
            "seven" => 7,
            "eight" => 8,
            "nine" => 9,
            _ => 1000
    }};

    let i32_to_str = |x:&i32| {match x{
        0 => "zero".to_string(),
        1 => "one".to_string(),
        2 => "two".to_string(),
        3 => "three".to_string(),
        4 => "four".to_string(),
        5 => "five".to_string(),
        6 => "six".to_string(),
        7 => "seven".to_string(),
        8 => "eight".to_string(),
        9 => "nine".to_string(),
        _ => "none".to_string()
}};

    let mut nmbrs:Vec<i32> = numbers.split_ascii_whitespace().map(|x:&str| str_to_i32(x)).collect(); 
    nmbrs.sort();
    let res:String = nmbrs.iter().map(|x:&i32| i32_to_str(x) + " ").collect();
    return res.trim_end().to_string();
}
