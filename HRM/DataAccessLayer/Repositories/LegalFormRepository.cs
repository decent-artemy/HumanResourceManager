﻿using DataAccessLayer.Classes;
using DataAccessLayer.DataContext;
using DataAccessLayer.Entities;
using DataAccessLayer.Interfaces;
using System;
using System.Collections.Generic;
using System.Text;

namespace DataAccessLayer.Repositories
{
    class LegalFormRepository : IRepository<LegalForm>
    {
        private readonly HRMContext context;

        public LegalFormRepository(HRMContext inputСontext)
        {
            context = inputСontext;
        }

        public void Create(LegalForm item)
        {
            throw new NotImplementedException();
        }

        public void Delete(IdType id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<LegalForm> Find(Func<LegalForm, bool> predicate)
        {
            throw new NotImplementedException();
        }

        public LegalForm Get(IdType id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<LegalForm> GetAll()
        {
            throw new NotImplementedException();
        }

        public void Update(LegalForm item)
        {
            throw new NotImplementedException();
        }
    }
}