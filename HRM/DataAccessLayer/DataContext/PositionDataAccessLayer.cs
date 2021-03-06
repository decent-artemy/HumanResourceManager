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
        public PositionDataAccessLayer()
        {
        }

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

        public override void Create(Position newPosition)
        {
            IEnumerable<SqlParameter> parameters = GetParametersForCreate(newPosition);

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

        public override void Update(Position position)
        {
            IEnumerable<SqlParameter> parameters = GetParametersForUpdate(position);

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

        public void Delete(IdType id)
        {
            const string DELETE_STORED_PROCEDURE_NAME = "spDeletePosition";
            Delete(id, DELETE_STORED_PROCEDURE_NAME);
        }

        public Position Get(IdType id)
        {
            const string GET_STORED_PROCEDURE_NAME = "spGetPosition";
            return Get(id, GET_STORED_PROCEDURE_NAME);
        }

        public IEnumerable<Position> GetAll()
        {
            const string GET_ALL_STORED_PROCEDURE_NAME = "spGetAllPositions";
            return GetAll(GET_ALL_STORED_PROCEDURE_NAME);
        }

        public bool Exists(IdType id)
        {
            const string EXISTS_STORED_PROCEDURE_NAME = "spExistsPosition";
            return Exists(id, EXISTS_STORED_PROCEDURE_NAME);
        }
    }
}
