package com.javaschool.mobile.service;

import java.io.IOException;
import java.util.concurrent.TimeoutException;

public interface MQService {
    void sendMessage(String message) throws IOException, TimeoutException;
}
