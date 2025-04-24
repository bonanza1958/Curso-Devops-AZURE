package com.example;

import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class HelloWorldTest {

    @Test
    public void testHelloWorld() {
        String message = "Hello, World!";
        assertEquals("Hello, World!", message);
    }
}

