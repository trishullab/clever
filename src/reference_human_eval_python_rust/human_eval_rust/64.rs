fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
Write a function vowels_count which takes a string representing
    a word as input and returns the number of vowels in the string.
    Vowels in this case are 'a', 'e', 'i', 'o', 'u'. Here, 'y' is also a
    vowel, but only when it is at the end of the given word.
    
*/
fn vowels_count(s:&str) -> i32 {


    let vowels:&str = "aeiouAEIOU";
    let mut count:i32 = 0;

    for i in 0..s.len() {
       let c:char = s.chars().nth(i).unwrap();
       if vowels.contains(c){
        count += 1;
       } 
    }
    if s.chars().nth(s.len() -1).unwrap() == 'y' || s.chars().nth(s.len() -1).unwrap() == 'Y' {count+=1;}

    return count;
}
