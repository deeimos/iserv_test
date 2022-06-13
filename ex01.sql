/*
    1.  Требуется написать запрос, который выведет номер, лицевой счет, дату в формате
        «день.месяц.год» и сумму ближайших по дате двух счетов, у которых день начисления в
        промежутке от 8 до 12 включительно.
*/

select
        [C_Number],
        [F_Subscr] as N_Subscr,
        format([D_Date], 'dd.MM.yyyy'),
        sum([N_Amount])
    from dbo.FD_Bills
    where day([D_Date]) between 8 and 12
    group by [C_Number], [F_Subscr], D_Date