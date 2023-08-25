package com.myproject.consumer;

import static org.junit.Assert.assertEquals;
import org.junit.Test;

public class ConsumerTest {

  @Test
  public void testValue() throws Exception {
    Consumer.main();
  }

  @Test
  public void testFlaky() throws Exception {
    assertEquals(1, System.currentTimeMillis() % 2);
  }

}