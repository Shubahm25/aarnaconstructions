CREATE DEFINER=`root`@`localhost` PROCEDURE `accountingdetailsinsert`(in society_code varchar(50),in accountMasterId1 bigint,in debitClosingBalance double, in creditClosingBalance double, in tenantId int, in txndate datetime,in RefLedgerId int,in groupid1 int ,in categoryid int,in amounttype varchar(25),in category_underid bigint,in bal_categoryid bigint,in  bal_groupid bigint ,in bal_category_underid int,in amount double,in  reledgerid bigint)
BEGIN











Declare d int default 0;
Declare masterid1 int;

Declare accountingcursor CURSOR for select distinct masterid from temp;
Declare CONTINUE HANDLER FOR SQLSTATE '02000' SET
d=1;
Declare CONTINUE HANDLER FOR SQLSTATE '23000' SET
d=1;






OPEN accountingcursor;

lbl:LOOP
IF d=1 THEN
LEAVE lbl;
END IF;
IF NOT d=1 THEN

FETCH accountingcursor INTO masterid1;


select masterid1;
IF d=1 THEN

LEAVE lbl;
END IF;
set  @balcount=0;

SET @t1=CONCAT('select count(*) into @balcount from',' ',society_code,'aaccountingdetails where accountingmasterid =',masterid1,'  ','and txndate=','"',txndate,'"');
PREPARE param_stmt FROM @t1;
  EXECUTE param_stmt ;
 DEALLOCATE PREPARE param_stmt;
select  @balcount;

-- select @balcount :=  count(*) from  balancesheet where groupid=bal_groupid and date=txndate;



if @balcount <= 0

then


set @category_undername=NULL;
SET @t1=CONCAT('select name into @category_undername from',' ',society_code,'accountingconfigmaster where masterid =',bal_category_underid);
PREPARE param_stmt FROM @t1;
  EXECUTE param_stmt ;
 DEALLOCATE PREPARE param_stmt;




select @checkbalancesheetype := IF(STRCMP(Upper(@category_undername),"Assets") = 0, 0, 1);
select @checkbalancetype := IF(STRCMP(Upper(@category_undername),"Liabilities") = 0, 0, 1);
if @checkbalancesheetype = 0
then

select @creditordebit := IF(STRCMP(Upper(amounttype),"CR") = 0, 0, 1);

if  @creditordebit = 0
then

set amount=(-1 * amount);


SET @t2=CONCAT('Insert into',' ',society_code,'accountingdetails(txndate,accountingmasterid,amount,creditclosingbalance,debitclosingbalance) values("',txndate,'",',masterid1,',',amount,',',creditClosingBalance,',',debitClosingBalance,')' );

PREPARE param_stmt FROM @t2;
 EXECUTE param_stmt;
 DEALLOCATE PREPARE param_stmt;


else

set amount=amount;
SET @t2=CONCAT('Insert into',' ',society_code,'accountingdetails(txndate,accountingmasterid,amount,creditclosingbalance,debitclosingbalance) values("',txndate,'",',masterid1,',',amount,',',creditClosingBalance,',',debitClosingBalance,')' );

PREPARE param_stmt FROM @t2;
 EXECUTE param_stmt;
 DEALLOCATE PREPARE param_stmt;

end if;


elseif  @checkbalancetype = 0
then

select @creditordebit := IF(STRCMP(Upper(amounttype),"CR") = 0, 0, 1);

select amounttype;
if  @creditordebit = 0

then

set amount=amount;
SET @t2=CONCAT('Insert into',' ',society_code,'accountingdetails(txndate,accountingmasterid,amount,creditclosingbalance,debitclosingbalance) values("',txndate,'",',masterid1,',',amount,',',creditClosingBalance,',',debitClosingBalance,')' );

PREPARE param_stmt FROM @t2;
 EXECUTE param_stmt;
 DEALLOCATE PREPARE param_stmt;

else
set amount=(-1 * amount);


SET @t2=CONCAT('Insert into',' ',society_code,'accountingdetails(txndate,accountingmasterid,amount,creditclosingbalance,debitclosingbalance) values("',txndate,'",',masterid1,',',amount,',',creditClosingBalance,',',debitClosingBalance,')' );

PREPARE param_stmt FROM @t2;
 EXECUTE param_stmt;
 DEALLOCATE PREPARE param_stmt;

end if;


else

set amount=amount;

SET @t2=CONCAT('Insert into',' ',society_code,'accountingdetails(txndate,accountingmasterid,amount,creditclosingbalance,debitclosingbalance) values("',txndate,'",',masterid1,',',amount,',',creditClosingBalance,',',debitClosingBalance,')' );
PREPARE param_stmt FROM @t2;
 EXECUTE param_stmt;
 DEALLOCATE PREPARE param_stmt;


end if;


else

select @creditordebit := IF(STRCMP(Upper(amounttype),"CR") = 0, 0, 1);

select amounttype;
if  @creditordebit = 0
then



SET @t1=CONCAT('update',' ',society_code,'accountingdetails set creditclosingbalance=creditClosingBalance+',creditClosingBalance,'  ','where accountingmasterid=',masterid1,'  ','and txndate=','"',txndate,'"');

PREPARE param_stmt FROM @t1;
 EXECUTE param_stmt;
 DEALLOCATE PREPARE param_stmt;
else
SET @t1=CONCAT('update',' ',society_code,'accountingdetails set debitclosingbalance=debitClosingBalance+',debitClosingBalance,' ','where accountingmasterid=',masterid1, '  ','and txndate=','"',txndate,'"');


PREPARE param_stmt FROM @t1;
 EXECUTE param_stmt;
 DEALLOCATE PREPARE param_stmt;
end if;







set @category_undername=NULL;
SET @t1=CONCAT('select name into @category_undername from',' ',society_code,'accountingconfigmaster where masterid =',bal_category_underid);
PREPARE param_stmt FROM @t1;
  EXECUTE param_stmt ;
 DEALLOCATE PREPARE param_stmt;

-- select @category_undername :=  name from  where masterid=bal_category_underid;

select @checkbalancesheetype := IF(STRCMP(Upper(@category_undername),"Assets") = 0, 0, 1);
select @checkbalancetype := IF(STRCMP(Upper(@category_undername),"Liabilities") = 0, 0, 1);
if @checkbalancesheetype = 0
then

select @creditordebit := IF(STRCMP(Upper(amounttype),"CR") = 0, 0, 1);

select amounttype;
if  @creditordebit = 0

then
select  "success12333";
SET @t3=CONCAT('update',' ',society_code,'accountingdetails set amount=amount-',amount,'  ','where accountingmasterid=',masterid1,'  ','and txndate=','"',txndate,'"');
select @t3;

PREPARE param_stmt FROM @t3;
 EXECUTE param_stmt;
 DEALLOCATE PREPARE param_stmt;



else

SET @t3=CONCAT('update',' ',society_code,'accountingdetails set amount=amount+',amount,'  ','where accountingmasterid=',masterid1,'  ','and txndate=','"',txndate,'"');

PREPARE param_stmt FROM @t3;
 EXECUTE param_stmt;
 DEALLOCATE PREPARE param_stmt;


end if;

elseif  @checkbalancetype = 0
then

select @creditordebit := IF(STRCMP(Upper(amounttype),"CR") = 0, 0, 1);

select amounttype;
if  @creditordebit = 0

then

SET @t3=CONCAT('update',' ',society_code,'accountingdetails set amount=amount+',amount,'  ','where accountingmasterid=',masterid1,'  ','and txndate=','"',txndate,'"');

PREPARE param_stmt FROM @t3;
 EXECUTE param_stmt;
 DEALLOCATE PREPARE param_stmt;

else

SET @t3=CONCAT('update',' ',society_code,'accountingdetails set amount=amount-',amount,'  ','where accountingmasterid=',masterid1,'  ','and txndate=','"',txndate,'"');

PREPARE param_stmt FROM @t3;
 EXECUTE param_stmt;
 DEALLOCATE PREPARE param_stmt;


end if;



else
SET @t4=CONCAT('update',' ',society_code,'accountingdetails set amount=amount+',amount,'  ','where accountingmasterid=',masterid1,'  ','and txndate=','"',txndate,'"');


PREPARE param_stmt FROM @t4;
 EXECUTE param_stmt;
 DEALLOCATE PREPARE param_stmt;




end if;










end if;






END IF;
END LOOP;

CLOSE accountingcursor;














END$$
