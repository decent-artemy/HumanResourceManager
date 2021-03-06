﻿using ExceptionClasses.Interfaces;
using System;
using System.Collections.Generic;
using System.Text;

namespace ExceptionClasses.Exceptions
{
    public class ClientException : GeneralException<ClientException>, IException
    {
        public ClientException() { }

        public ClientException(string message)
        {
            ExceptionMessage = message;
        }
    }
}
