package com.CurrencyConverter.model;

import java.util.Map;

public class ExchangeRates {
    private MetaData meta;
    private Map<String, CurrencyData> data;

    public MetaData getMeta() {
        return meta;
    }

    public void setMeta(MetaData meta) {
        this.meta = meta;
    }

    public Map<String, CurrencyData> getData() {
        return data;
    }

    public void setData(Map<String, CurrencyData> data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return "ExchangeRates{" +
                "meta=" + meta +
                ", data=" + data +
                '}';
    }

    public static class MetaData {
        private String last_updated_at;

        public String getLast_updated_at() {
            return last_updated_at;
        }

        public void setLast_updated_at(String last_updated_at) {
            this.last_updated_at = last_updated_at;
        }

        @Override
        public String toString() {
            return "MetaData{" +
                    "last_updated_at='" + last_updated_at + '\'' +
                    '}';
        }
    }

    public static class CurrencyData {
        private String code;
        private double value;

        public String getCode() {
            return code;
        }

        public void setCode(String code) {
            this.code = code;
        }

        public double getValue() {
            return value;
        }

        public void setValue(double value) {
            this.value = value;
        }

        @Override
        public String toString() {
            return "CurrencyData{" +
                    "code='" + code + '\'' +
                    ", value=" + value +
                    '}';
        }
    }
}
