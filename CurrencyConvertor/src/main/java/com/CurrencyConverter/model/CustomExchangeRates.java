package com.CurrencyConverter.model;

import java.util.Map;

public class CustomExchangeRates
{
    private String last_updated_at;
    private Map<String, Double> exchangeRates;

    public String getLast_updated_at() {
        return last_updated_at;
    }

    public void setLast_updated_at(String last_updated_at) {
        this.last_updated_at = last_updated_at;
    }

    public Map<String, Double> getExchangeRates() {
        return exchangeRates;
    }

    public void setExchangeRates(Map<String, Double> exchangeRates) {
        this.exchangeRates = exchangeRates;
    }

    @Override
    public String toString() {
        return "CustomExchangeRates{" +
                "last_updated_at='" + last_updated_at + '\'' +
                ", exchangeRates=" + exchangeRates +
                '}';
    }
}
