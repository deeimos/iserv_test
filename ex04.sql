/*
    4. Требуется вывести общие суммы начислений за каждый месяц по каждой услуге за все время с
       сортировкой по месяцам, с под итогами.

    Подитоги не получилось вывести, е была попытка с агрегатной оконной функцией.

    select
        format([D_Date], 'yyyyMM') as N_Month,
        [C_Sale_Items],
        sum([N_Amount]) 
            over
                (
                    partition by format([D_Date], 'yyyyMM')
                ) as N_Amount_Sum
    from dbo.FD_Bills
*/

select
        format([D_Date], 'yyyyMM') as N_Month,
        [C_Sale_Items],
        sum([N_Amount]) as N_Amount_Sum
    from dbo.FD_Bills
    group by format([D_Date], 'yyyyMM'), [C_Sale_Items]
    order by format([D_Date], 'yyyyMM')