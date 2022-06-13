/*
    5. Требуется вывести общие суммы начислений за каждый месяц по каждой услуге за все время, так
       чтобы услуги были строках, месяца в столбцах
*/


with Income as
    (
        select
                format([D_Date], 'yyyyMM') as N_Month,
                [C_Sale_Items],
                [N_Amount]
            from dbo.FD_Bills
    )
select 
        [C_Sale_Items],
        N_Month
    from Income
    pivot
        (
            sum([N_Amount])
            for counter in ([201812], [201901], [201902])
        ) as Result
    order by year