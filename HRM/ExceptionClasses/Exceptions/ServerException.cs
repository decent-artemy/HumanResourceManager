﻿using ExceptionClasses.Interfaces;
using System;
using System.Collections.Generic;
using System.Text;

namespace ExceptionClasses.Exceptions
{
    class ServerException : GeneralException<ClientException>, IException
    {
        public ServerException() { }

        public ServerException(string message)
        {
            ExceptionMessage = message;
        }
    }
}
