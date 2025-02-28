fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
You will be given the name of a class (a string) and a list of extensions.
    The extensions are to be used to load additional classes to the class. The
    strength of the extension is as follows: Let CAP be the number of the uppercase
    letters in the extension's name, and let SM be the number of lowercase letters 
    in the extension's name, the strength is given by the fraction CAP - SM. 
    You should find the strongest extension and return a string in this 
    format: ClassName.StrongestExtensionName.
    If there are two or more extensions with the same strength, you should
    choose the one that comes first in the list.
    For example, if you are given "Slices" as the class and a list of the
    extensions: ['SErviNGSliCes', 'Cheese', 'StuFfed'] then you should
    return 'Slices.SErviNGSliCes' since 'SErviNGSliCes' is the strongest extension 
    (its strength is -1).
    
*/
fn strongest_extension(class_name: &str, extensions: Vec<&str>) -> String { 


    let mut strongest = "";
    let mut max = -1000;
    for i in 0..extensions.len() {
        let mut strength = 0;
        for j in 0..extensions[i].len() {
            let chr = extensions[i].chars().nth(j).unwrap();
            if chr >= 'A' && chr <= 'Z' {
                strength += 1;
            }
            if chr >= 'a' && chr <= 'z' {
                strength -= 1;
            }
        }
        if strength > max {
            max = strength;
            strongest = extensions[i];
        }
    }
    format!("{}.{}", class_name, strongest)
}
