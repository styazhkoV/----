select dbo.C_1 customerId,
       Z$CONTR_RBK_BIBL.GETSRREPATR(ct.ID) repDate,
       ct.C_NUMB_PASS_NEW unkRegNumber
from z#contr ct, VW_CRIT_RBK_CORP_INFIN dbo
where ct.c_Client_Arr#client_Org=dbo.ref3
and dbo.REF6 = 2047879
and ct.C_NUMB_PASS_NEW	 is not null
and ct.state_id in 'CONFIRM'
and Z$CONTR_RBK_BIBL.GETSRREPATR(ct.ID)>= sysdate -1
