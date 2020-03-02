﻿using CommonClasses;
using DataAccessLayer.Entities;
using DataAccessLayer.Interfaces;
using ExceptionClasses.Loggers;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace DataAccessLayer.DataContext
{
    class PositionDataAccessLayer : GeneralDataAccessLayer<Position>, IDataAccessLayer<Position>
    {
        /// <summary>
        /// Инициализирует параметры для создания записи в базе данных
        /// </summary>
        /// <param name="item">Экземпляр класса, который необходимо создать в базе данных</param>
        /// <returns>Список sql параметров для выполнения хранимой процедуры</returns>
        private List<SqlParameter> GetParametersForCreate(Position item)
        {
            List<SqlParameter> parameters = new List<SqlParameter>
            {
                 new SqlParameter("@Name", item.Name)
            };

            return parameters;
        }

        public override void Create(Position item)
        {
            IEnumerable<SqlParameter> parameters = GetParametersForCreate(item);

            const string CREATE_STORED_PROCEDURE_NAME = "spAddPosition";

            IDataBaseCommandExecutor storedProcedure = TryGetStoredProcedure(CREATE_STORED_PROCEDURE_NAME, parameters);

            try
            {
                storedProcedure.ExecuteNonQuery();
            }
            catch (Exception)
            {
                const string EXCEPTION_MESSAGE = "Ошибка создания экземпляра класса Position в классе PositionDataAccessLayer!";

                ExceptionLogger.LogError(EXCEPTION_MESSAGE);

                throw;
            }
        }

        /// <summary>
        /// Инициализирует параметры для обновления записи в базе данных
        /// </summary>
        /// <param name="item">Экземпляр класса, который необходимо обновить в базе данных</param>
        /// <returns>Список sql параметров для выполнения хранимой процедуры</returns>
        private List<SqlParameter> GetParametersForUpdate(Position item)
        {
            SqlParameter idParameter = new SqlParameter("@Id", item.Id.Identificator);

            List<SqlParameter> parameters = GetParametersForCreate(item);
            parameters.Add(idParameter);

            return parameters;
        }

        public override void Update(Position item)
        {
            IEnumerable<SqlParameter> parameters = GetParametersForUpdate(item);

            const string UPDATE_STORED_PROCEDURE_NAME = "spUpdatePosition";

            IDataBaseCommandExecutor storedProcedure = TryGetStoredProcedure(UPDATE_STORED_PROCEDURE_NAME, parameters);

            try
            {
                storedProcedure.ExecuteNonQuery();
            }
            catch (Exception)
            {
                const string EXCEPTION_MESSAGE = "Ошибка обновления экземпляра класса Position в классе PositionDataAccessLayer!";

                ExceptionLogger.LogError(EXCEPTION_MESSAGE);

                throw;
            }
        }

        public void Delete(Position item)
        {
            const string DELETE_STORED_PROCEDURE_NAME = "spDeletePosition";
            Delete(item.Id, DELETE_STORED_PROCEDURE_NAME);
        }

        public Position Get(Position item)
        {
            const string GET_STORED_PROCEDURE_NAME = "spGetPosition";
            return Get(item.Id, GET_STORED_PROCEDURE_NAME);
        }

        public IEnumerable<Position> GetAll()
        {
            const string GET_ALL_STORED_PROCEDURE_NAME = "spGetAllPositions";
            return GetAll(GET_ALL_STORED_PROCEDURE_NAME);
        }

        public bool Exists(Position item)
        {
            const string EXISTS_STORED_PROCEDURE_NAME = "spExistsPosition";
            return Exists(item.Id, EXISTS_STORED_PROCEDURE_NAME);
        }
    }
}
