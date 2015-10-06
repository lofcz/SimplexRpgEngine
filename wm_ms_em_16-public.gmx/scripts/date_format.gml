/*
**  Usage:
**      date_format(format [,datetime])
**
**  Arguments:
**      format      string controlling date formatting
**      datetime    date-time value (optional)
**
**  Returns:
**      a string formatted according to the given format string
**      using the given date-time value or the current local time
**      if no date-time is given
**
**  Day format characters:
**      d - day of the month with leading zeros, 2 digits with leading zeros; 01 through 31
**      D - day of the week, textual, 3 letters; Fri
**      j - day of the month without leading zeros; 1 through 31
**      l - day of the week, textual, long; Friday
**      N - ISO 8601 day number of the week; 1 (Monday) through 7 (Sunday)
**      S - English ordinal suffix, textual, 2 characters; st, nd, rd, th
**      w - day of the week, numeric, 0 (Sunday) through 6 (Saturday)
**      z - day of the year (starting from zero); 0 through 365
**
**  Week format characters:
**      W - ISO 8601 week number of year, weeks starting on Monday; 42
**
**  Month format characters:
**      F - month, textual, long; January
**      m - month with leading zeros; 01 through 12
**      M - month, textual, 3 letters; Jan
**      n - month without leading zeros; 1 through 12
**      t - number of days in the given month; 28 through 31
**
**  Year format characters:
**      L - whether it is a leap year; 0 or 1
**      o - ISO 8601 year, like Y unless ISO week belongs to prev or next year; 2008
**      Y - year, 4 digits; 1999
**      y - year, 2 digits; 99
**
**  Time format characters:
**      a - lowercase Ante meridiem and Post meridiem; am or pm
**      A - uppercase Ante meridiem and Post meridiem; AM or PM
**      g - hour, 12-hour format without leading zeros; 1 through 12
**      G - hour, 24-hour format without leading zeros; 0 through 23
**      h - hour, 12-hour format; 01 through 12
**      H - hour, 24-hour format; 00 through 23
**      i - minutes, with leading zero; 00 through 59
**      s - seconds, with leading zero; 00 through 59
**
**  Full Date/Time format characters:
**      c - ISO 8601 extended format date; 2004-02-12T15:19:21
**      r - RFC 2822 formatted data; Thu, 21 Dec 2000 16:01:07 -0000
**      U - seconds since the Unix epoch
**
**      \ - following character should be returned literally, not interpreted
**
**  Examples:
**      date_format("l jS of F Y h:i:s A") == "Sunday 4th of May 2008 05:45:34 PM"
**      date_format('\I\t \i\s \t\h\e zS \d\a\y.') == "It is the 124th day."
**
**  GMLscripts.com
*/
{
    var str,dat,out,day,month,year,week,weekday,second,minute,hour24,hour12,i,c;
    str = argument0;
    dat = argument1;
    out = "";
    if (dat == 0) dat = date_current_datetime();
    day     = date_get_day(dat);
    month   = date_get_month(dat);
    year    = date_get_year(dat);
    week    = date_get_week(dat);
    weekday = date_get_weekday(dat);
    second  = date_get_second(dat);
    minute  = date_get_minute(dat);
    hour24  = date_get_hour(dat);
    hour12  = ((hour24+23) mod 12)+1;
    for (i=1; i<=string_length(str); i+=1) {
        c = string_char_at(str,i);
        switch (c) {
            case "F":
            switch (month) {
                case 1:  out += "January";   break;
                case 2:  out += "February";  break;
                case 3:  out += "March";     break;
                case 4:  out += "April";     break;
                case 5:  out += "May";       break;
                case 6:  out += "June";      break;
                case 7:  out += "July";      break;
                case 8:  out += "August";    break;
                case 9:  out += "September"; break;
                case 10: out += "October";   break;
                case 11: out += "November";  break;
                case 12: out += "December";  break;
            }
            break;
            case "M":
            switch (month) {
                case 1:  out += "Jan"; break;
                case 2:  out += "Feb"; break;
                case 3:  out += "Mar"; break;
                case 4:  out += "Apr"; break;
                case 5:  out += "May"; break;
                case 6:  out += "Jun"; break;
                case 7:  out += "Jul"; break;
                case 8:  out += "Aug"; break;
                case 9:  out += "Sep"; break;
                case 10: out += "Oct"; break;
                case 11: out += "Nov"; break;
                case 12: out += "Dec"; break;
            }
            break;
            case "l":
            switch (weekday) {
                case 1: out += "Sunday";    break;
                case 2: out += "Monday";    break;
                case 3: out += "Tuesday";   break;
                case 4: out += "Wednesday"; break;
                case 5: out += "Thursday";  break;
                case 6: out += "Friday";    break;
                case 7: out += "Saturday";  break;
            }
            break;
            case "D":
            switch (weekday) {
                case 1: out += "Sun"; break;
                case 2: out += "Mon"; break;
                case 3: out += "Tue"; break;
                case 4: out += "Wed"; break;
                case 5: out += "Thu"; break;
                case 6: out += "Fri"; break;
                case 7: out += "Sat"; break;
            }
            break;
            case "S":
            if (day >= 10 && day <= 20) out += "th";
            else if ((day mod 10) == 1) out += "st";
            else if ((day mod 10) == 2) out += "nd";
            else if ((day mod 10) == 3) out += "rd";
            else                        out += "th";
            break;
            case "o":
            if (month ==  1 && day <=  3 && week != 1) { out += string(year-1); break; }
            if (month == 12 && day >= 29 && week == 1) { out += string(year+1); break; }
            case "Y": out += string(year); break;
            case "y": out += string_copy(string(year),3,2); break;
            case "m": if (month < 10) out += "0";
            case "n": out += string(month); break;
            case "d": if (day < 10) out += "0";
            case "j": out += string(day); break;
            case "H": if (hour24 < 10) out += "0";
            case "G": out += string(hour24); break;
            case "h": if (hour12 < 10) out += "0";
            case "g": out += string(hour12); break;
            case "i": if (minute < 10) out += "0"; out += string(minute); break;
            case "s": if (second < 10) out += "0"; out += string(second); break;
            case "a": if (hour24 < 12) out += "am" else out += "pm"; break;
            case "A": if (hour24 < 12) out += "AM" else out += "PM"; break;
            case "U": out += string(round(date_second_span(dat,25568.8333))); break;
            case "z": out += string(date_get_day_of_year(dat)-1); break;
            case "t": out += string(date_days_in_month(month)); break;
            case "L": out += string(date_leap_year(dat)); break;
            case "w": out += string(weekday-1); break;
            case "N": out += string(((weekday+5) mod 7)+1); break;
            case "W": out += string(week); break;
            case "c": out += date_format("o-m-dTH:i:s",dat); break;
            case "r": out += date_format("D, j M Y H:i:s -0000",dat); break;
            case "\": i += 1; c = string_char_at(str,i);
            default:  out += c; break;
        }
    }
    return out;
}