
package com.CurrencyConverter.Controller;

import com.CurrencyConverter.JPA.CurrencyConversionRecordRepository;
import com.CurrencyConverter.entity.CurrencyConversionRecord;
import com.CurrencyConverter.model.ConversionResult;
import com.CurrencyConverter.model.CustomExchangeRates;
import com.CurrencyConverter.model.ExchangeRates;
import com.CurrencyConverter.service.CurrencyConversionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.web.WebProperties;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

@Controller
public class CurrencyConverterController {
    @Autowired
    private CurrencyConversionService conversionService;

    @Autowired
    private CurrencyConversionRecordRepository recordRepository;

   // @Autowired
    private WebProperties.LocaleResolver localeResolver;

    String language;

//    @Autowired
//    private MessageSource messageSource; // Inject MessageSource


    @GetMapping("/")
    public String index() {
        return "currency_converter";
    }

    @GetMapping("/convert")
    public String convertCurrency(
            @RequestParam String from,
            @RequestParam String to,
            @RequestParam double amount,
            Model model
    ) {
        System.out.println("From " + from + " to " + to + " amount " + amount);

        ExchangeRates exchangeRates = conversionService.getExchangeRates(from, to);

        System.out.println("Exchange Rates : " + exchangeRates);

        double exchangeRate = exchangeRates.getData().get(to).getValue();
        System.out.println("Exchange Rate in double format - " + exchangeRate);
        double convertedAmount = amount * exchangeRate;

        System.out.println("test");
        model.addAttribute("fromCurrency", from);
        model.addAttribute("toCurrency", to);
        model.addAttribute("amount", amount);
        model.addAttribute("convertedAmount", convertedAmount);

        // Save the conversion record with the convertedAmount
        CurrencyConversionRecord conversionRecord = new CurrencyConversionRecord(from, to, amount, convertedAmount);
        recordRepository.save(conversionRecord);

        return "currency_converter";
    }


    @PostMapping("/processDate")
    public String fetchExchangeRates(@RequestParam String date, Model model) {
        // Construct the API URL
        String apiUrl = "https://api.currencyapi.com/v3/historical?date=" + date + "&apikey=cur_live_CG4wGykf8g7z2s9xSScY6aCa6vmibfN4KxTLwRgk";

        System.out.println("Date is " + date);

        // Use RestTemplate to make the API request and fetch the data
        RestTemplate restTemplate = new RestTemplate();
        ExchangeRates exchangeRates = restTemplate.getForObject(apiUrl, ExchangeRates.class);

        // Create a new CustomExchangeRates object to hold the required data
        CustomExchangeRates customExchangeRates = new CustomExchangeRates();
        customExchangeRates.setLast_updated_at(exchangeRates.getMeta().getLast_updated_at());

        Map<String, Double> exchangeRateMap = new HashMap<>();
        for (Map.Entry<String, ExchangeRates.CurrencyData> entry : exchangeRates.getData().entrySet()) {
            exchangeRateMap.put(entry.getKey(), entry.getValue().getValue());
        }
        customExchangeRates.setExchangeRates(exchangeRateMap);

        // Add the customExchangeRates object to the model
        model.addAttribute("customExchangeRates", customExchangeRates);

        return "currency_exchange"; // Display the exchange rates in the currency_exchange.jsp
    }


    @GetMapping("/date")
    public String enterDate() {
        return "date"; // This will redirect to date.jsp
    }

//    @PostMapping("/processDate")
//    public String processDate(@RequestParam String date) {
//        // Handle the date data submitted from the form
//        // Perform any necessary processing
//        System.out.println("Date is " + date);
//
//        return "redirect:/"; // Redirect to another page after processing
//    }

    @GetMapping("/transactionRecords")
    public String getTransactionRecords(
            Model model,
            @RequestParam(name = "lang", required = false) String lang,
            HttpServletRequest request
    ) {

        System.out.println("lang is " + lang);
       //  System.out.println("Language is " ); // Use the lang parameter

        // You can store the selected language in a class-level variable
       // this.language = lang; // Assuming you have a class-level variable named "language"

        List<CurrencyConversionRecord> transactionRecords = recordRepository.findAll();
        model.addAttribute("transactionRecords", transactionRecords);
      //  request.getSession().setAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME, new Locale("fr"));

        return "transaction_records";
    }

    @PostMapping("/changeLang")
    public String changeLang(@RequestParam String lang, HttpServletRequest request, HttpServletResponse response) {
        // Set the selected language in the session or a cookie if needed
        // Redirect back to the previous page

        System.out.println( "Change lang " + lang);
        request.getSession().setAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME, new Locale(lang));


        return "redirect:" + request.getHeader("Referer");
    }


//    @GetMapping("/currency_converter")
//    public String showCurrencyConverterPage(Model model) {
//        Locale currentLocale = LocaleContextHolder.getLocale();
//        model.addAttribute("currentLocale", currentLocale.toString());
//
//        return "currency_converter";
//    }
//
//    @GetMapping("/setLocale")
//    public String setLocale(@RequestParam String lang, HttpServletRequest request, HttpServletResponse response) {
//        // Change the locale based on user selection
//        Locale locale = new Locale(lang);
//        LocaleContextHolder.setLocale(locale);
//        // You can also store the selected locale in a cookie or session for future requests.
//
//        // Redirect back to the referring page (currency_converter.jsp)
//        String referrer = request.getHeader("Referer");
//        if (referrer != null) {
//            return "redirect:" + referrer;
//        } else {
//            return "redirect:/currency_converter";
//        }
//    }




}
