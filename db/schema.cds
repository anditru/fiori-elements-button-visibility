using { Currency, managed, sap } from '@sap/cds/common';
namespace bookshop;

entity Books : managed {
  @title: 'ID'
  key ID : Integer;
  @title: 'Title'
  title  : String(111);
  @title: 'Description'
  descr  : String(1111);
  @title: 'Author'
  author : String(111);
  @title: 'Genre'
  genre : String(111);
  @title: 'Stock'
  stock  : Integer;
  @title: 'Price'
  price  : Decimal;
  @title: 'Currency'
  currency : String;
  @title: 'Owner'
  owner : String;
}
