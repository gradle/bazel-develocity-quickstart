package com.myproject.consumer;

import com.myproject.producer.Producer;

public class Consumer {
  
  public static void main(String... args) {
    System.out.println(new Producer().getValue());
  }
}