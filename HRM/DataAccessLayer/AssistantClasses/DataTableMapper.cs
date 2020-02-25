﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Reflection;

namespace DataAccessLayer.AssistantClasses
{
    /// <summary>
    /// Класс, автоматизирующий создание объектов из контекста данных 
    /// </summary>
    internal static class DataTableMapper
    {
        /// <summary>
        /// Создает из DataTable один объект
        /// </summary>
        /// <typeparam name="T">Тип возвращаемого объекта</typeparam>
        /// <param name="dataTable">Контекст данных, из которого будет создаваться объект</param>
        /// <returns>Возвращает созданный объект передаваемого типа T</returns>
        public static T CreateObjectFromTable<T>(DataTable dataTable) where T : class, new()
        {
            T resultObject = new T();

            DataRow  row = dataTable.Rows[0];

            SetItemFromRow(resultObject, row);

            return resultObject;
        }

        /// <summary>
        /// Создает из DataTable список объектов
        /// </summary>
        /// <typeparam name="T">Тип возвращаемого списка объектов</typeparam>
        /// <param name="dataTable">Контекст данных, из которого будет создаваться список объектов</param>
        /// <returns>Возвращает список созданных объектов передаваемого типа T</returns>
        public static IEnumerable<T> CreateListFromTable<T>(DataTable dataTable) where T : new()
        {
            List<T> resultListWithObjects = new List<T>();

            foreach (DataRow row in dataTable.Rows)
            {
                resultListWithObjects.Add(GetItemFromRow<T>(row));
            }
            return resultListWithObjects;
        }

        /// <summary>
        /// Возвращает объект из строки DataRow
        /// </summary>
        /// <typeparam name="T">Тип объекта</typeparam>
        /// <param name="row">Строка DataRow</param>
        /// <returns>Объект передаваемого типа</returns>
        private static T GetItemFromRow<T>(DataRow row) where T : new()
        {
            T item = new T();

            SetItemFromRow(item, row);

            return item;
        }

        /// <summary>
        /// Создает объект из строки DataRow
        /// </summary>
        /// <typeparam name="T">Тип объекта</typeparam>
        /// <param name="inputItem">Экземпляр объекта</param>
        /// <param name="row">Строка DataRow</param>
        private static void SetItemFromRow<T>(T inputItem, DataRow row) where T : new()
        {
            foreach (DataColumn column in row.Table.Columns)
            {
                Type type = inputItem.GetType();

                PropertyInfo property = type.GetProperty(column.ColumnName);

                if (property != null && row[column] != DBNull.Value)
                {
                    //property.SetValue(inputItem, inputRow[column], null);
                    property.SetValue(inputItem, row[column]);
                }
                else
                {
                    // ToDo: exception
                }
            }
        }
    }
}
