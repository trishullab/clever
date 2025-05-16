fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
Complete the function that takes two integers and returns 
    the product of their unit digits.
    Assume the input is always valid.
    
*/
fn multiply(a:i32, b:i32) -> i32{


    return (i32::abs(a) % 10) * (i32::abs(b) % 10);
}
