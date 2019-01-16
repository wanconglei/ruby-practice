=begin
Description:
Let us begin with an example:

A man has a rather old car being worth $2000. He saw a secondhand car being worth $8000. He wants to keep his old car until he can buy the secondhand one.

He thinks he can save $1000 each month but the prices of his old car and of the new one decrease of 1.5 percent per month. Furthermore this percent of loss increases by 0.5 percent at the end of every two months. Our man finds it difficult to make all these calculations.

Can you help him?

How many months will it take him to save up enough money to buy the car he wants, and how much money will he have left over?

Parameters and return of function:

parameter (positive int, guaranteed) startPriceOld (Old car price)
parameter (positive int, guaranteed) startPriceNew (New car price)
parameter (positive int, guaranteed) savingperMonth
parameter (positive float or int, guaranteed) percentLossByMonth

nbMonths(2000, 8000, 1000, 1.5) should return [6, 766] or (6, 766)
where 6 is the number of months at the end of which he can buy the new car and 766 is the nearest integer to 766.158 (rounding 766.158 gives 766).

Note:

Selling, buying and saving are normally done at end of month. Calculations are processed at the end of each considered month but if, by chance from the start, the value of the old car is bigger than the value of the new one or equal there is no saving to be made, no need to wait so he can at the beginning of the month buy the new car:

nbMonths(12000, 8000, 1000, 1.5) should return [0, 4000]
nbMonths(8000, 8000, 1000, 1.5) should return [0, 0]
We don't take care of a deposit of savings in a bank:-)
=end

def nbMonths(startPriceOld, startPriceNew, savingperMonth, percentLossByMonth)
  month = 1
  savings = 0
  percent = 1 - (percentLossByMonth.fdiv(100))
  old_price = startPriceOld
  new_price = startPriceNew

  until (old_price + savings) >= new_price
    savings += savingperMonth
    percent -= 0.005 if month.even?
    old_price *= percent
    new_price *= percent
    month += 1
  end
  wealth = (savings + old_price)
  puts [month - 1, (wealth  - new_price).round]
end

nbMonths(2000, 8000, 1000, 1.5)
