import Data.Time.Calendar
import Data.Time.Calendar.WeekDate

sundays = filter (\(_,_,dow) -> (dow == 7)) . map toWeekDate

firsts = [ fromGregorian year month 1 | year <- [1901..2000],
                                        month <- [1..12]]
main = print $ length $ sundays firsts
