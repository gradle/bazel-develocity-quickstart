package com.myproject.producer;

import static org.junit.Assert.assertEquals;
import org.junit.Test;
import com.myproject.producer.Producer;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;


@RunWith(JUnit4.class)

public class ProducerTest {

  @Test
  public void testValue() throws Exception {
    Producer producer = new Producer();
    assertEquals("value", producer.getValue());
  }

  @Test
  public void testFlaky() throws Exception {
    System.out.println(System.currentTimeMillis());
    assertEquals(1, System.currentTimeMillis() % 2);
  }

}