Dcl-F ex7 WorkStn;
Dcl-F cust;
Dcl-s exit Ind;

exit = *Off;
dow (exit = *off);
  IID = 0;
  write HEADER;
  exfmt SEARCH;

  Select;
    When *in03;
      exit = *on;

    When *in03 = *off;
      chain (IID) cust;

      ONAME = cname;
      OEMAIL = cemail;

      write HEADER;
      exfmt CUSTDSP;
  Endsl;
enddo;