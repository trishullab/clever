fn main(){}

use std::{slice::Iter, cmp::{max, self}, mem::replace, collections::{HashSet, HashMap}, ops::Index, ascii::AsciiExt};
use rand::Rng;
use regex::Regex;
use md5;
use std::any::{Any, TypeId};

/*
It is the last week of the semester and the teacher has to give the grades
    to students. The teacher has been making her own algorithm for grading.
    The only problem is, she has lost the code she used for grading.
    She has given you a list of GPAs for some students and you have to write 
    a function that can output a list of letter grades using the following table:
             GPA       |    Letter grade
              4.0                A+
            > 3.7                A 
            > 3.3                A- 
            > 3.0                B+
            > 2.7                B 
            > 2.3                B-
            > 2.0                C+
            > 1.7                C
            > 1.3                C-
            > 1.0                D+ 
            > 0.7                D 
            > 0.0                D-
              0.0                E
    
*/
fn numerical_letter_grade(grades:Vec<f64>) -> Vec<String>{


    let mut res: Vec<String> = vec![];
    for (i, gpa) in grades.iter().enumerate() {
        if gpa == &4.0 {
            res.push("A+".to_string());
        } else if gpa > &3.7 {
            res.push("A".to_string());
        } else if gpa > &3.3 {
            res.push("A-".to_string());
        } else if gpa > &3.0 {
            res.push("B+".to_string());
        } else if gpa > &2.7 {
            res.push("B".to_string());
        } else if gpa > &2.3 {
            res.push("B-".to_string());
        } else if gpa > &2.0 {
            res.push("C+".to_string());
        } else if gpa > &1.7 {
            res.push("C".to_string());
        } else if gpa > &1.3 {
            res.push("C-".to_string());
        } else if gpa > &1.0 {
            res.push("D+".to_string());
        } else if gpa > &0.7 {
            res.push("D".to_string());
        } else if gpa > &0.0 {
            res.push("D-".to_string());
        } else {
            res.push("E".to_string());
        }
    }
    return res;
}
