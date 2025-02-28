fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
 Return list of all prefixes from shortest to longest of the input string
    
*/
fn all_prefixes(string: String) -> Vec<String>{


   let mut res:Vec<String> = vec![];
   let mut res_str:String = String::new();

for c in string.chars(){
    res_str.push(c);
    res.push(res_str.clone());
}
return res;
}

