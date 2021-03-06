﻿using CommonClasses;
using DataAccessLayer.Entities;
using DataAccessLayer.Interfaces;
using ExceptionClasses.Loggers;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace DataAccessLayer.DataContext
{
    class EmployeeDataAccessLayer : GeneralDataAccessLayer<Employee>, IDataAccessLayer<Employee>
    {
        public EmployeeDataAccessLayer()
        {
        }

        /// <summary>
        /// Инициализирует параметры для создания записи в базе данных
        /// </summary>
        /// <param name="item">Экземпляр класса, который необходимо создать в базе данных</param>
        /// <returns>Список sql параметров для выполнения хранимой процедуры</returns>
        private List<SqlParameter> GetParametersForCreate(Employee item)
        {
            List<SqlParameter> parameters = new List<SqlParameter>
            {
                new SqlParameter("@PositionId", item.PositionId.Identificator),
                new SqlParameter("@CompanyId", item.CompanyId.Identificator),
                new SqlParameter("@Surname", item.Surname),
                new SqlParameter("@MiddleName", item.MiddleName),
                new SqlParameter("@Name", item.Name),
                new SqlParameter("@DateOfEmployment", item.DateOfEmployment)
            };

            return parameters;
        }

        public override void Create(Employee newEmployee)
        {
            IEnumerable<SqlParameter> parameters = GetParametersForCreate(newEmployee);

            const string CREATE_STORED_PROCEDURE_NAME = "spAddEmployee";

            IDataBaseCommandExecutor storedProcedure = TryGetStoredProcedure(CREATE_STORED_PROCEDURE_NAME, parameters);

            try
            {
                storedProcedure.ExecuteNonQuery();
            }
            catch (Exception)
            {
                const string EXCEPTION_MESSAGE = "Ошибка создания экземпляра класса Employee в классе EmployeeDataAccessLayer!";

                ExceptionLogger.LogError(EXCEPTION_MESSAGE);

                throw;
            }
        }

        /// <summary>
        /// Инициализирует параметры для обновления записи в базе данных
        /// </summary>
        /// <param name="item">Экземпляр класса, который необходимо обновить в базе данных</param>
        /// <returns>Список sql параметров для выполнения хранимой процедуры</returns>
        private List<SqlParameter> GetParametersForUpdate(Employee item)
        {
            SqlParameter idParameter = new SqlParameter("@Id", item.Id.Identificator);

            List<SqlParameter> parameters = GetParametersForCreate(item);
            parameters.Add(idParameter);

            return parameters;
        }

        public override void Update(Employee employee)
        {
            IEnumerable<SqlParameter> parameters = GetParametersForUpdate(employee);

            const string UPDATE_STORED_PROCEDURE_NAME = "spUpdateEmployee";

            IDataBaseCommandExecutor storedProcedure = TryGetStoredProcedure(UPDATE_STORED_PROCEDURE_NAME, parameters);

            try
            {
                storedProcedure.ExecuteNonQuery();
            }
            catch (Exception)
            {
                const string EXCEPTION_MESSAGE = "Ошибка обновления экземпляра класса Employee в классе EmployeeDataAccessLayer!";

                ExceptionLogger.LogError(EXCEPTION_MESSAGE);

                throw;
            }
        }

        public void Delete(IdType id)
        {
            const string DELETE_STORED_PROCEDURE_NAME = "spDeleteEmployee";
            Delete(id, DELETE_STORED_PROCEDURE_NAME);
        }

        public Employee Get(IdType id)
        {
            const string GET_STORED_PROCEDURE_NAME = "spGetEmployee";
            return Get(id, GET_STORED_PROCEDURE_NAME);
        }

        public IEnumerable<Employee> GetAll()
        {
            const string GET_ALL_STORED_PROCEDURE_NAME = "spGetAllEmployees";
            return GetAll(GET_ALL_STORED_PROCEDURE_NAME);
        }

        public bool Exists(IdType id)
        {
            const string EXISTS_STORED_PROCEDURE_NAME = "spExistsEmployee";
            return Exists(id, EXISTS_STORED_PROCEDURE_NAME);
        }
    }
}
