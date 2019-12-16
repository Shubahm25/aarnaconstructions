CREATE DEFINER=`root`@`localhost` PROCEDURE `Opening_balance`(in society_code varchar(50),in accountMasterId1 bigint,in debitClosingBalance double, in creditClosingBalance double, in tenantId int, in txndate datetime,in RefLedgerId int,in groupid1 int ,in categoryid int,in amounttype varchar(25),in category_underid bigint,in bal_categoryid bigint,in bal_groupid bigint ,in bal_category_underid int,in amount double,in reledgerid bigint)
BEGIN



set society_code=CONCAT(society_code,'_');
select "suceess";
SET @t1=CONCAT('insert into temp select t.masterid as masterid,name, @pv:=t.configmasterparentid as parent from (select * from ',society_code,'accountingconfigmaster where masterid>',groupid1 ,' order by masterid desc) t join (select @pv:=',accountMasterId1,')tmp where t.masterid=@pv');

select @t1;

PREPARE param_stmt FROM @t1;

EXECUTE param_stmt ;
DEALLOCATE PREPARE param_stmt;


while Date(txndate) <= Date(CURDATE()) Do
select txndate;

call accountingdetailsinsertopeningbalance(society_code,accountMasterId1,debitClosingBalance,creditClosingBalance,tenantId,txndate,RefLedgerId,groupid1,categoryid,amounttype,category_underid,bal_categoryid,bal_groupid,bal_category_underid,amount,reledgerid);






set @trialcount=0;


SET @t1=CONCAT('select count(*) into @trialcount from',' ',society_code,'trialbalance where accountMasterId =',accountMasterId1,' ','and date=','"',txndate,'"');
PREPARE param_stmt FROM @t1;
EXECUTE param_stmt ;
DEALLOCATE PREPARE param_stmt;






-- select @trialcount := count(*) from trialbalance where accountMasterId=accountMasterId1 and date=txndate;
-- select DateAdd(@txndate,Interval 1 Day) ;
if @trialcount <= 0
then

SET @t1=CONCAT('Insert into',' ',society_code,'trialbalance(accountMasterId,debitClosingBalance,creditClosingBalance,tenantId,date,RefLedgerId,groupid,categoryid) values(',accountMasterId1,',',debitClosingBalance,',',creditClosingBalance,',',tenantId,',','"',txndate,'",',RefLedgerId,',',groupid1,',',categoryid,')' );
PREPARE param_stmt FROM @t1;
EXECUTE param_stmt;
DEALLOCATE PREPARE param_stmt;
else

select @creditordebit := IF(STRCMP(Upper(amounttype),"CR") = 0, 0, 1);

select amounttype;
if @creditordebit = 0
then



SET @t1=CONCAT('update',' ',society_code,'trialbalance set creditClosingBalance=creditClosingBalance+',creditClosingBalance,' ','where accountMasterId=',accountMasterId1,' ','and date=','"',txndate,'"');

PREPARE param_stmt FROM @t1;
EXECUTE param_stmt;
DEALLOCATE PREPARE param_stmt;
else
SET @t1=CONCAT('update',' ',society_code,'trialbalance set debitClosingBalance=debitClosingBalance+',debitClosingBalance,' ','where accountMasterId=',accountMasterId1, ' ','and date=','"',txndate,'"');


PREPARE param_stmt FROM @t1;
EXECUTE param_stmt;
DEALLOCATE PREPARE param_stmt;
end if;







select "success" ;
end if;


set @balcount=0;


SET @t1=CONCAT('select count(*) into @balcount from',' ',society_code,'balancesheet where ledgertype =',accountMasterId1,' ','and date=','"',txndate,'"');
PREPARE param_stmt FROM @t1;
EXECUTE param_stmt ;
DEALLOCATE PREPARE param_stmt;

-- select @balcount := count(*) from balancesheet where groupid=bal_groupid and date=txndate;



if @balcount <= 0

then



select @creditordebit := IF(STRCMP(Upper(amounttype),"CR") = 0, 0, 1);

select amounttype;




SET @t2=CONCAT('Insert into',' ',society_code,'balancesheet(date,category_underid,categoryid,groupid,tenantid,amount,ledgertype) values("',txndate,'",',category_underid,',',bal_categoryid,',',bal_groupid,',',tenantId,',',amount,',',accountMasterId1,')' );

PREPARE param_stmt FROM @t2;
EXECUTE param_stmt;
DEALLOCATE PREPARE param_stmt;





else

set @category_undername=NULL;
SET @t1=CONCAT('select name into @category_undername from',' ',society_code,'accountingconfigmaster where masterid =',bal_category_underid);
PREPARE param_stmt FROM @t1;
EXECUTE param_stmt ;
DEALLOCATE PREPARE param_stmt;

-- select @category_undername := name from accountingconfigmaster where masterid=bal_category_underid;

select @checkbalancesheetype := IF(STRCMP(Upper(@category_undername),"Assets") = 0, 0, 1);
select @checkbalancetype := IF(STRCMP(Upper(@category_undername),"Liabilities") = 0, 0, 1);
if @checkbalancesheetype = 0
then

select @creditordebit := IF(STRCMP(Upper(amounttype),"CR") = 0, 0, 1);

select amounttype;
if @creditordebit = 0

then
select "success12333";
SET @t3=CONCAT('update',' ',society_code,'balancesheet set amount=amount-',amount,' ','where ledgertype=',accountMasterId1,' ','and date=','"',txndate,'"');
select @t3;

PREPARE param_stmt FROM @t3;
EXECUTE param_stmt;
DEALLOCATE PREPARE param_stmt;



else

SET @t3=CONCAT('update',' ',society_code,'balancesheet set amount=amount+',amount,' ','where ledgertype=',accountMasterId1,' ','and date=','"',txndate,'"');

PREPARE param_stmt FROM @t3;
EXECUTE param_stmt;
DEALLOCATE PREPARE param_stmt;


end if;

elseif @checkbalancetype = 0
then

select @creditordebit := IF(STRCMP(Upper(amounttype),"CR") = 0, 0, 1);

select amounttype;
if @creditordebit = 0

then

SET @t3=CONCAT('update',' ',society_code,'balancesheet set amount=amount+',amount,' ','where ledgertype=',accountMasterId1,' ','and date=','"',txndate,'"');

PREPARE param_stmt FROM @t3;
EXECUTE param_stmt;
DEALLOCATE PREPARE param_stmt;

else

SET @t3=CONCAT('update',' ',society_code,'balancesheet set amount=amount-',amount,' ','where ledgertype=',accountMasterId1,' ','and date=','"',txndate,'"');

PREPARE param_stmt FROM @t3;
EXECUTE param_stmt;
DEALLOCATE PREPARE param_stmt;


end if;



else
SET @t4=CONCAT('update',' ',society_code,'balancesheet set amount=amount+',amount,' ','where ledgertype=',accountMasterId1,' ','and date=','"',txndate,'"');


PREPARE param_stmt FROM @t4;
EXECUTE param_stmt;
DEALLOCATE PREPARE param_stmt;




end if;










end if;









set txndate = (txndate +Interval 1 Day);
END WHILE;



END$$