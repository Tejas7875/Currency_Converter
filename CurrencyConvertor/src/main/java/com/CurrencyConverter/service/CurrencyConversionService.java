package com.CurrencyConverter.service;

import com.CurrencyConverter.model.ExchangeRates;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class CurrencyConversionService {
    @Value("${currencyapi.api.key}")
    private String apiKey;

    private final String currencyApiUrl = "https://api.currencyapi.com/v3/latest";

    private final RestTemplate restTemplate;

    public CurrencyConversionService(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    public ExchangeRates getExchangeRates(String from, String to) {
        System.out.println("Accessing base currency " + from);
        System.out.println(apiKey);
        String url = currencyApiUrl + "?apikey=" + apiKey + "&base_currency=" + from + "&currencies=" + to;

        return restTemplate.getForObject(url, ExchangeRates.class);
    }
}
