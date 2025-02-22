fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*

    Create a function that takes integers, floats, or strings representing
    real numbers, and returns the larger variable in its given variable type.
    Return None if the values are equal.
    Note: If a real number is represented as a string, the floating point might be . or ,
    
*/
fn compare_one<'a>(a:&'a dyn Any, b:&'a dyn Any) -> RtnType<String,f64,i32>{


    let a_f64 = Any_to_f64(a);
    let b_f64 = Any_to_f64(b);

    if a_f64 > b_f64 {
        return original_type(a);
    }

    if a_f64 < b_f64 {
        return original_type(b);
    } else {
        return RtnType::String("None".to_string());
    }
}

#[derive(Debug, PartialEq)]
pub enum RtnType<S, F, I> {
    Empty(),
    String(S),
    Float(F),
    Int(I),
}

fn Any_to_f64(a: &dyn Any) -> f64 {
    let mut a_f64 = 0.0;

    if a.downcast_ref::<f64>() == None {
        match a.downcast_ref::<&str>() {
            Some(as_string) => {
                a_f64 = as_string.parse::<f64>().unwrap();
            }
            None => {}
        }

        match a.downcast_ref::<i32>() {
            Some(as_i32) => {
                a_f64 = *as_i32 as f64;
            }
            None => {}
        }
    } else {
        a_f64 = *a.downcast_ref::<f64>().unwrap();
    }

    return a_f64;
}

fn original_type(a: &dyn Any) -> RtnType<String, f64, i32> {
    let mut res = RtnType::Empty();
    match a.downcast_ref::<&str>() {
        Some(as_string) => {
            res = RtnType::String(as_string.parse::<String>().unwrap());
        }
        None => {}
    }

    match a.downcast_ref::<i32>() {
        Some(as_i32) => {
            res = RtnType::Int(*as_i32);
        }
        None => {}
    }

    match a.downcast_ref::<f64>() {
        Some(as_f64) => res = RtnType::Float(*as_f64),
        None => {}
    }
    return res;
}
