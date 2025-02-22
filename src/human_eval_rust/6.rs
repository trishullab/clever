fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
 Input to this function is a string represented multiple groups for nested parentheses separated by spaces.
    For each of the group, output the deepest level of nesting of parentheses.
    E.g. (()()) has maximum two levels of nesting while ((())) has three.
    
*/
fn parse_nested_parens(paren_string:String) -> Vec<i32>{

    let mut result:Vec<i32> = vec![];
    let mut depth:i32 = 0;
    let mut max_depth:i32 = 0;

    for splits in paren_string.split(' '){
        for c in splits.chars(){ 
        if c == '('{
        depth = depth + 1;
        max_depth = max(depth, max_depth);
        }
        else{
        depth = depth - 1;
        }
    }
    
    if depth == 0 {
        result.push(max_depth);
        max_depth = 0;
        }
    }

    return result;
}
