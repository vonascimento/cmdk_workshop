create or replace 
procedure DGSY_INS_AUT_CONV_HIST(
 NR_SEQ_AUTORIZACAO_p  in  number,
 DS_HISTORICO_p    in  varchar2) is


DGSY_AUT_CONV_HIST_w DGSY_AUT_CONV_HIST%rowtype;

begin
update autorizacao_convenio
set nr_seq_estagio = 21
where nr_sequencia = NR_SEQ_AUTORIZACAO_p;

select DGSY_AUT_CONV_HIST_seq.nextval
into DGSY_AUT_CONV_HIST_w.NR_SEQUENCIA
from dual;

DGSY_AUT_CONV_HIST_w.NR_SEQ_AUTORIZACAO := NR_SEQ_AUTORIZACAO_p;
DGSY_AUT_CONV_HIST_w.DS_HISTORICO  := DS_HISTORICO_p;
DGSY_AUT_CONV_HIST_w.IE_TIPO   := 'I';

insert into DGSY_AUT_CONV_HIST values DGSY_AUT_CONV_HIST_w;

commit;
end DGSY_INS_AUT_CONV_HIST;
/
