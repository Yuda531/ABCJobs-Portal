package com.abc.utils;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.Period;
import java.time.temporal.ChronoUnit;

public class TimeAgoUtil {

    public static String getTimeAgo(LocalDateTime dateTime) {
        LocalDateTime now = LocalDateTime.now();
        Duration duration = Duration.between(dateTime, now);

        if (duration.toMinutes() < 1) {
            return "Just now";
        } else if (duration.toHours() < 1) {
            return duration.toMinutes() + " minutes ago";
        } else if (duration.toDays() < 1) {
            return duration.toHours() + " hours ago";
        } else if (duration.toDays() < 7) {
            return duration.toDays() + " days ago";
        } else if (duration.toDays() < 30) {
            long weeks = duration.toDays() / 7;
            return weeks + (weeks == 1 ? " week" : " weeks") + " ago";
        } else {
            Period period = Period.between(dateTime.toLocalDate(), now.toLocalDate());
            return period.getMonths() + (period.getMonths() == 1 ? " month" : " months") + " ago";
        }
    }
}
