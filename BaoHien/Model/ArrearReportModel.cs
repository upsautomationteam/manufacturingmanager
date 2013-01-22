﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BaoHien.Model
{
    public class ArrearReportModel
    {
        int id;
        public int ID
        {
            get { return id; }
            set { id = value; }
        }

        int index;
        public int Index
        {
            get { return index; }
            set { index = value; }
        }

        string date;
        public string Date
        {
            get { return date; }
            set { date = value; }
        }

        string recordCode;
        public string RecordCode
        {
            get { return recordCode; }
            set { recordCode = value; }
        }

        string amount;
        public string Amount
        {
            get { return amount; }
            set { amount = value; }
        }

        string afterDebit;
        public string AfterDebit
        {
            get { return afterDebit; }
            set { afterDebit = value; }
        }

        double afterDebitNumber;
        public double AfterDebitNumber
        {
            get { return afterDebitNumber; }
            set { afterDebitNumber = value; }
        }

        string customerName;
        public string CustomerName
        {
            get { return customerName; }
            set { customerName = value; }
        }
    }
}