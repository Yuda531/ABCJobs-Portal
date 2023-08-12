package com.abc.utils;

import java.time.Duration;
import java.time.LocalDateTime;
import java.util.concurrent.TimeUnit;

public class TimeAgoFormatter {
    public static String format(LocalDateTime dateTime) {
        LocalDateTime now = LocalDateTime.now();
        Duration duration = Duration.between(dateTime, now);
        long seconds = duration.getSeconds();

        if (seconds < 60) {
            return seconds + " seconds ago";
        } else if (seconds < 60 * 60) {
            long minutes = TimeUnit.SECONDS.toMinutes(seconds);
            return minutes + " minutes ago";
        } else if (seconds < 60 * 60 * 24) {
            long hours = TimeUnit.SECONDS.toHours(seconds);
            return hours + " hours ago";
        } else if (seconds < 60 * 60 * 24 * 7) {
            long days = TimeUnit.SECONDS.toDays(seconds);
            long weeks = days / 7;
            return weeks + " weeks ago";
        } else {
            long days = TimeUnit.SECONDS.toDays(seconds);
            long months = days / 30;
            return months + " months ago";
        }
    }
}
