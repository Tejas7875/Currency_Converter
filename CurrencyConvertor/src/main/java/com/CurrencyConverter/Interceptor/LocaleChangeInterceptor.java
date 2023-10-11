package com.CurrencyConverter.Interceptor;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Locale;

    public class LocaleChangeInterceptor implements HandlerInterceptor {

        private final LocaleResolver localeResolver;

        public LocaleChangeInterceptor(LocaleResolver localeResolver) {
            this.localeResolver = localeResolver;
        }

        @Override
        public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
            String lang = request.getParameter("lang");
            if (lang != null) {
                Locale newLocale = new Locale(lang);
                localeResolver.setLocale(request, response, newLocale);
            }
            return true;
        }

        @Override
        public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
            // Do nothing here
        }

        @Override
        public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
            // Do nothing here
        }
    }
